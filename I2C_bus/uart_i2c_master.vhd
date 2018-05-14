----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:05:44 05/14/2018 
-- Design Name: 
-- Module Name:    uart_i2c_master - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity uart_i2c_master is
	 Generic (
		DATA_WIDTH : integer := 8	-- UART word widht 
	 );
    Port ( iCLK  		  : in 	 std_logic;
           inRST 		  : in 	 std_logic;
			  iTC 		  : in 	 std_logic;
			  iUART_FULL  : in 	 std_logic; 
			  iUART_EMPTY : in  	 std_logic;
			  iUART_DATA  : in 	 std_logic_vector(DATA_WIDTH - 1  downto 0);
			  oUART_READ  : out 	 std_logic;
			  oUART_WRITE : out 	 std_logic;
			  oUART_DATA  : out 	 std_logic_vector(DATA_WIDTH - 1  downto 0);
			  oSCL		  : out 	 std_logic;
			  ioSDA		  : inout std_logic
			  );
end uart_i2c_master;

architecture Behavioral of uart_i2c_master is

	-- ACK and NACK constant 
	constant cACK  : std_logic := '0';
	constant cNACK : std_logic := '1';

	type   tSTATES is (IDLE, UART_START,  
							  STOP); 	   		-- Slave FSM states type


	signal sCURRENT_STATE 	   	: tSTATES;																				 		-- Master FSM current state
	signal sNEXT_STATE    	   	: tSTATES; 																			 			-- Master FSM next state

	signal sOUT_BUFF_EN	 	   	: std_logic;																					-- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	   	: std_logic;																					-- Input tri-state buffer enable

	signal sSDA_IN			 	   	: std_logic;																					-- SDA input signal
	signal sSDA_OUT 		 	   	: std_logic;																					-- SDA output signal

	signal sIUART_REG					: std_logic;																					-- UART input register
	signal sOUART_REG					: std_logic;																					-- UART output register

	signal sACK							: std_logic;																					-- Acknowelge signal from mux
	signal sACK_SEL					: std_logic;																					-- Acknowelge select signal 
	
	signal sSDA_SEL					: std_logic;																					-- SDA line data select

	signal sLBYTE_REG_SEL			: std_logic;																					-- Lower byte register multiplexer selection
	signal sUBYTE_REG_SEL 			: std_logic;																					-- Upper byte register multiplexer selection

	signal sLBYTE_REG_MUX			: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Lower byte register multiplexer
	signal sUBYTE_REG_MUX			: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Upper byte register multiplexer

	signal sSLAVE_ADDR_REG 			: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Slave address register 
	signal sREG_ADDR_REG 		   : std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Slave address register register
	signal sLOW_BYTE_REG 			: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Lower data byte
	signal sUPPER_BYTE_REG			: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Upper data byte

begin

	-- Input UART data register
	eIN_UART_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sREG_DEC(0),
				iD 	=> iIUART_DATA,
				oQ		=> sIUART_REG
			);
			
	-- Output UART data register
	eOUT_UART_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sREG_DEC(0),
				iD 	=> sOUART_DATA,
				oQ		=> oUART_DATA
			);			
			
	-- Slave address register
	eSLAVE_ADDR_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sREG_DEC(0),
				iD 	=> sIUART_REG,
				oQ		=> sSLAVE_ADDR_REG
			);
	
	-- Register address register
	eREG_ADDR_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sREG_DEC(1),
				iD 	=> sIUART_REG,
				oQ		=> sSLAVE_ADDR_REG
			);	

	-- Lower data byte register
	eLOW_BYTE_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sREG_DEC(2),
				iD 	=> sUBYTE_REG_MUX,
				oQ		=> sLOW_BYTE_REG
			);
			
	-- Upper data byte register
	eUPPER_BYTE_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sREG_DEC(3),
				iD 	=> sUBYTE_REG_MUX,
				oQ		=> sUPPER_BYTE_REG
			);	

	-- FSM state register process
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then 
			sCURRENT_STATE <= IDLE; -- Reset FSM
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE; -- Move to next state
		end if;
	end process fsm_reg;
	
	-- Master FSM next state logic
	fsm_next : process (sCURRENT_STATE) begin
		case (sCURRENT_STATE) is
			when IDLE =>
				if (iUART_EMPTY = '0') then -- Check is there messages
					sNEXT_STATE <= UART_START; -- Get start byte from UART
				else 
					sNEXT_STATE <= IDLE;
				end if;
			when UART_START =>
				if (iUART_EMPTY = '0') then
					sNEXT_STATE <= UART_SLAVE_ADDRESS; -- Get slave address from UART 
				else 
					sNEXT_STATE <= UART_START;
				end if;
			when UART_SLAVE_ADDRESS =>
				if (iUART_EMPTY = '0') then
					sNEXT_STATE <= UART_REG_ADDRESS; -- Get register address from UART 
				else 
					sNEXT_STATE <= UART_SLAVE_ADDRESS;
				end if;	
			when UART_REG_ADDRESS =>
				if (iUART_EMPTY = '0') then
					sNEXT_STATE <= UART_BYTE_LOW; -- Get lower data byte from UART 
				else 
					sNEXT_STATE <= UART_REG_ADDRESS;
				end if;	
			when UART_BYTE_LOW =>
				if (iUART_EMPTY = '0') then
					sNEXT_STATE <= UART_BYTE_HIGH; -- Get upper data byte from UART 
				else 
					sNEXT_STATE <= UART_BYTE_LOW;
				end if;	
			when UART_BYTE_HIGH =>
				if (iUART_EMPTY = '0') then
					sNEXT_STATE <= UART_STOP; -- Get stop byte from UART 
				else 
					sNEXT_STATE <= UART_BYTE_HIGH;
				end if;				
			when others =>
				sNEXT_STATE <= IDLE;
				
		end case;
	end process fsm_next;	

	-- Master FSM output logic
	fsm_out : process (sCURRENT_STATE) begin
		case (sCURRENT_STATE) is
			when IDLE =>
		end case;
	end process fsm_out;	
	
	-- Lower byte register multiplexer
	sLBYTE_REG_MUX <=	sIUART_REG when sLBYTE_REG_SEL = '0' else 
							sISHW_REG;
							
	-- Upper byte register multiplexer
	sUBYTE_REG_MUX <=	sIUART_REG when sUBYTE_REG_SEL = '0' else 
							sISHW_REG;							
							
	-- Acknowelge multiplexer
	sACK 		<= cACK 		when sACK_SEL = '0' else
					cNACK;
	
	-- Output data multiplexer
	sSDA_OUT	<= sACK  	when sSDA_SEL = '0' else 		  
					sOSHW_REG(7);	

	-- Input tri-state buffer
	sSDA_IN  <= ioSDA 	when sIN_BUFF_EN  = '1' else  
				   'Z';
	-- Output tri-state buffer
	ioSDA    <= sSDA_OUT when sOUT_BUFF_EN = '1' else  
				   'Z';
					
end Behavioral;

