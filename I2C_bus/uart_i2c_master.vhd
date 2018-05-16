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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_i2c_master is
	 Generic (
		REGISTER_NUM		: integer := 4;	 -- Number of register
		TC_PERIOD			: integer := 12;   -- Terminal count period 
		TR_PERIOD			: integer := 16;   -- Master transmission peirod
		DATA_WIDTH 			: integer := 8;	 -- UART word widht 
		DATA_CNT_WIDTH 	: integer := 4;    -- Data counter width
		PERIOD_CNT_WIDTH  : integer := 4		 -- Period counter width
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

	type   tSTATES is (IDLE, UART_START, UART_SLAVE_ADDRESS, UART_REG_ADDRESS, UART_BYTE_LOW, UART_BYTE_HIGH, UART_STOP,
							 I2C_START, I2C_SLAVE_ADDRESS_MODE, I2C_SLAVE_ADDRESS_ACK, I2C_REGISTER_ADDRESS, I2C_REGISTER_ADDRESS_ACK,
							 I2C_READ_DATA, I2C_WRITE_DATA, I2C_WRITE_DATA_ACK, I2C_STOP); 	   		-- Slave FSM states type


	signal sCURRENT_STATE 	   	: tSTATES;																				 		-- Master FSM current state
	signal sNEXT_STATE    	   	: tSTATES; 																			 			-- Master FSM next state

	signal sSCL							: std_logic;																					-- SCL signal

	signal sOUT_BUFF_EN	 	   	: std_logic;																					-- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	   	: std_logic;																					-- Input tri-state buffer enable

	signal sSDA_IN			 	   	: std_logic;																					-- SDA input signal
	signal sSDA_OUT 		 	   	: std_logic;																					-- SDA output signal

	signal sDATA_CNT 		 	   	: unsigned(DATA_CNT_WIDTH - 1 downto 0);												-- Data counter
	signal sDATA_CNT_EN 	 	   	: std_logic;																					-- Data counter enable		
	signal sDATA_CNT_RST				: std_logic;																					-- Data counter reset signal

	signal sPERIOD_CNT 		   	: unsigned(PERIOD_CNT_WIDTH - 1 downto 0);											-- Period counter
	signal sPERIOD_CNT_EN 	   	: std_logic;																					-- Period counter enable
	signal sTC_PERIOD_CNT 			: std_logic;																					-- Period counter terminal count
	
	signal sTR_PERIOD_CNT 			: unsigned(PERIOD_CNT_WIDTH - 1 downto 0);											-- Master transmission period
	signal sTR_PERIOD_CNT_EN 		: std_logic;																					-- Master transmission period enable
	signal sTC_TR_PERIOD_CNT 		: std_logic;																					-- Master transmission period terminal count
	signal sTR_PERIOD_CNT_RST		: std_logic;																					-- Master transmission period counter reset signal	

	signal sISHW_REG					: std_logic_vector(DATA_WIDTH	- 1 downto 0);											-- Input shift register
	signal sISHW_EN					: std_logic;																					-- Input shift register enable	
	signal sOSHW_REG					: std_logic_vector(DATA_WIDTH	- 1 downto 0);											-- Output shift register
	signal sOSHW_EN					: std_logic;																					-- Input shift register enable	
	signal sOSHW_LOAD					: std_logic;																					-- Shift load signal

	signal sREG_MUX					: std_logic_vector(DATA_WIDTH	- 1 downto 0);											-- Input registers multiplexer
	signal sREG_MUX_SEL				: std_logic_vector(1 downto 0);															-- Registers multiplexer select
	
	signal sSCL_EN						: std_logic;																					-- SCL generator enable signal
	
	signal sSCL_RISING_EDGE    	: std_logic;																					-- SCL rising edge indication
	--signal sSDA_RISING_EDGE    	: std_logic;																					-- SDA rising edge indication
	
	signal sIUART_REG					: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- UART input register
	signal sOUART_REG					: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- UART output register
	signal sIUART_REG_EN				: std_logic;																					-- UART input register	enable
	signal sOUART_REG_EN				: std_logic;																					-- UART output register enable

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

	signal sREG_DEC 					: std_logic_vector(REGISTER_NUM - 1 downto 0);
	signal sREG_DEC_SEL 				: std_logic_vector(1 downto 0);
	signal sREG_DEC_EN				: std_logic;

begin

	sISHW_REG <= (others => '1');

	-- Input UART data register
	eIN_UART_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sIUART_REG_EN,
				iD 	=> iUART_DATA,
				oQ		=> sIUART_REG
			);
			
	-- Output UART data register
	eOUT_UART_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sOUART_REG_EN,
				iD 	=> sOUART_REG,
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
				oQ		=> sREG_ADDR_REG
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

	-- SCL rising edge detector
	eSCL_EDGE_DET : entity work.rising_edge_det
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iSIG  => sSCL,
				oEDGE => sSCL_RISING_EDGE
			);	

	-- SCL generator
	eSCL_GEN : entity work.scl_gen 
			Port map(
				iCLK    => iCLK,
				inRST   => inRST,
				iSCL_EN => sSCL_EN,
				iTC     => iTC,
				oSCL	  => sSCL
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
	fsm_next : process (sCURRENT_STATE, ioSDA, iUART_EMPTY, iUART_DATA, sTC_TR_PERIOD_CNT, sTC_PERIOD_CNT, sSLAVE_ADDR_REG) begin
		case (sCURRENT_STATE) is
			when IDLE =>
				if (iUART_EMPTY = '0' and iUART_DATA = "00000001") then -- Check is there messages
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
			when UART_STOP =>
				if (iUART_EMPTY = '0' and iUART_DATA = "10000000") then
					sNEXT_STATE <= I2C_START; -- Get stop byte from UART 
				else 
					sNEXT_STATE <= UART_STOP;
				end if;
			when I2C_START =>
				-- Check if period elapsed
				if (sTC_TR_PERIOD_CNT = '1') then
					sNEXT_STATE <= I2C_SLAVE_ADDRESS_MODE; 
				else 
					sNEXT_STATE <= I2C_START;
				end if;
			when I2C_SLAVE_ADDRESS_MODE =>
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= I2C_SLAVE_ADDRESS_ACK;
				else
					sNEXT_STATE <= I2C_SLAVE_ADDRESS_MODE;
				end if;
			when I2C_SLAVE_ADDRESS_ACK =>
				-- Check if period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then 
					sNEXT_STATE <= I2C_REGISTER_ADDRESS;	
				else
					sNEXT_STATE <= I2C_SLAVE_ADDRESS_ACK;
				end if;	
			when I2C_REGISTER_ADDRESS =>
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= I2C_REGISTER_ADDRESS_ACK;
				else
					sNEXT_STATE <= I2C_REGISTER_ADDRESS;
				end if;
			when I2C_REGISTER_ADDRESS_ACK => 	
				-- Check if period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then
					if (ioSDA = '1') then 
						sNEXT_STATE <= IDLE; -- If address is not correct stop transaction
					else
						if (sSLAVE_ADDR_REG(0) = '0') then 
							sNEXT_STATE <= I2C_WRITE_DATA; -- Write data to slave
						else 
							sNEXT_STATE <= I2C_WRITE_DATA;--I2C_READ_DATA;	 -- Read data from slave
						end if;
					end if;
				else
					sNEXT_STATE <= I2C_REGISTER_ADDRESS_ACK;
				end if;
			when I2C_WRITE_DATA => 
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= I2C_WRITE_DATA_ACK;
				else
					sNEXT_STATE <= I2C_WRITE_DATA;
				end if;	
			when I2C_WRITE_DATA_ACK =>
				-- Check if period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then 
					sNEXT_STATE <= I2C_STOP;	
				else
					sNEXT_STATE <= I2C_WRITE_DATA_ACK;
				end if;	
			when I2C_STOP =>
				-- Check if period elapsed
				if (sTC_TR_PERIOD_CNT = '1') then
					sNEXT_STATE <= IDLE; 
				else 
					sNEXT_STATE <= I2C_STOP;
				end if;
			when others =>
					sNEXT_STATE <= IDLE;
		end case;
	end process fsm_next;	

	-- Master FSM output logic
	fsm_out : process (sCURRENT_STATE, sDATA_CNT) begin
		case (sCURRENT_STATE) is
			when IDLE =>
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '1';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '1';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';		
				sREG_MUX_SEL		 <= "00";	
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '0';	
				oUART_READ  		 <= '0';
				oUART_WRITE			 <= '0';
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '0';	
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '0';
			when UART_START =>
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '1';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '1';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "00";		
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '1';
				sSCL_EN				 <= '0';	
				oUART_READ  		 <= '1';
				oUART_WRITE			 <= '0';
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '0';
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '0';				
			when UART_SLAVE_ADDRESS =>
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '1';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '1';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';		
				sREG_MUX_SEL		 <= "00";	
				sREG_DEC_SEL		 <= "01";
				sREG_DEC_EN			 <= '1';
				sSCL_EN				 <= '0';	
				oUART_READ  		 <= '1';
				oUART_WRITE			 <= '0';
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '0';		
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '0';				
			when UART_REG_ADDRESS =>
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '1';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '1';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "00";		
				sREG_DEC_SEL		 <= "10";
				sREG_DEC_EN			 <= '1';
				sSCL_EN				 <= '0';	
				oUART_READ  		 <= '1';
				oUART_WRITE			 <= '0';		
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '0';	
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '0';				
			when UART_BYTE_LOW =>
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '1';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '1';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';
				sREG_MUX_SEL		 <= "00";				
				sREG_DEC_SEL		 <= "11";
				sREG_DEC_EN			 <= '1';
				sSCL_EN				 <= '0';	
				oUART_READ  		 <= '1';
				oUART_WRITE			 <= '0';
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '0';		
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '0';				
			when UART_BYTE_HIGH =>
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '1';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '1';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "00";		
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '0';	
				oUART_READ  		 <= '1';
				oUART_WRITE			 <= '0';
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '0';	
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '0';				
			when UART_STOP =>	
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '1';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '1';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "00";	
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '0';	
				oUART_READ  		 <= '1';
				oUART_WRITE			 <= '0';
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '0';	
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '0';				
			when I2C_START =>
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '0';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '0';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "00";				
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '0';	
				oUART_READ  		 <= '0';
				oUART_WRITE			 <= '0';		
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '1';	
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '1';	
			when I2C_SLAVE_ADDRESS_MODE => 
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '0';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '0';
				sSDA_SEL		 		 <= '1';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "00";	
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '1';	
				oUART_READ  		 <= '0';
				oUART_WRITE			 <= '0';		
				sDATA_CNT_EN 		 <= '1';
				sDATA_CNT_RST 		 <= '0';			
				if (sDATA_CNT = DATA_WIDTH) then 
					sPERIOD_CNT_EN  	 <= '1'; 
					sTR_PERIOD_CNT_RST <= '1';
					sOSHW_EN			 	 <= '0';
				else
					sPERIOD_CNT_EN     <= '0';
					sTR_PERIOD_CNT_RST <= '0';
					sOSHW_EN			    <= '1'; 
				end if;
				sTR_PERIOD_CNT_EN  <= '1';
				sOSHW_LOAD			 <= '0';		
			when I2C_SLAVE_ADDRESS_ACK =>
				sIN_BUFF_EN	 		 <= '1';
				sOUT_BUFF_EN 		 <= '0';
				sIUART_REG_EN  	 <= '0';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '0';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "01";				
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '1';	
				oUART_READ  		 <= '0';
				oUART_WRITE			 <= '0';		
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '1';	
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '1';
			when I2C_REGISTER_ADDRESS => 
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '0';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '0';
				sSDA_SEL		 		 <= '1';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "00";	
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '1';	
				oUART_READ  		 <= '0';
				oUART_WRITE			 <= '0';		
				sDATA_CNT_EN 		 <= '1';
				sDATA_CNT_RST 		 <= '0';			
				if (sDATA_CNT = DATA_WIDTH) then 
					sPERIOD_CNT_EN  	 <= '1';
					sTR_PERIOD_CNT_RST <= '1';					
					sOSHW_EN			 	 <= '0';
				else
					sPERIOD_CNT_EN  	 <= '0';
					sTR_PERIOD_CNT_RST <= '0';
					sOSHW_EN			 	 <= '1'; 
				end if;
				sTR_PERIOD_CNT_EN  <= '1';
				sOSHW_LOAD			 <= '0';		
			when I2C_REGISTER_ADDRESS_ACK =>
				sIN_BUFF_EN	 		 <= '1';
				sOUT_BUFF_EN 		 <= '0';
				sIUART_REG_EN  	 <= '0';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '0';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "10";				
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '1';	
				oUART_READ  		 <= '0';
				oUART_WRITE			 <= '0';		
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '1';	
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '1';
			when I2C_WRITE_DATA =>
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '0';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '0';
				sSDA_SEL		 		 <= '1';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "00";	
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '1';	
				oUART_READ  		 <= '0';
				oUART_WRITE			 <= '0';		
				sDATA_CNT_EN 		 <= '1';
				sDATA_CNT_RST 		 <= '0';			
				if (sDATA_CNT = DATA_WIDTH) then 
					sPERIOD_CNT_EN  	 <= '1'; 
					sTR_PERIOD_CNT_RST <= '1';
					sOSHW_EN			 	 <= '0';
				else
					sPERIOD_CNT_EN     <= '0';
					sTR_PERIOD_CNT_RST <= '0';
					sOSHW_EN			    <= '1'; 
				end if;
				sTR_PERIOD_CNT_EN  <= '1';
				sOSHW_LOAD			 <= '0';	
			when I2C_WRITE_DATA_ACK =>
				sIN_BUFF_EN	 		 <= '1';
				sOUT_BUFF_EN 		 <= '0';
				sIUART_REG_EN  	 <= '0';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '0';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "10";				
				sREG_DEC_SEL		 <= "11";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '1';	
				oUART_READ  		 <= '0';
				oUART_WRITE			 <= '0';		
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '1';	
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '1';		
			when I2C_STOP =>
				sIN_BUFF_EN	 		 <= '0';
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '1';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '0';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';		
				sREG_MUX_SEL		 <= "00";	
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '0';	
				oUART_READ  		 <= '0';
				oUART_WRITE			 <= '0';
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '1';	
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '0';			
			when others => 
				sIN_BUFF_EN	 		 <= '1';
				sOUT_BUFF_EN 		 <= '0';
				sIUART_REG_EN  	 <= '0';
				sOUART_REG_EN		 <= '0';
				sACK_SEL		 		 <= '0';
				sSDA_SEL		 		 <= '0';
				sLBYTE_REG_SEL		 <= '0';		
				sUBYTE_REG_SEL 	 <= '0';	
				sREG_MUX_SEL		 <= "10";				
				sREG_DEC_SEL		 <= "00";
				sREG_DEC_EN			 <= '0';
				sSCL_EN				 <= '1';	
				oUART_READ  		 <= '0';
				oUART_WRITE			 <= '0';		
				sDATA_CNT_EN 		 <= '0';
				sDATA_CNT_RST 		 <= '0';			
				sPERIOD_CNT_EN 	 <= '0';
				sTR_PERIOD_CNT_RST <= '0';
				sTR_PERIOD_CNT_EN  <= '1';	
				sOSHW_EN				 <= '0';
				sOSHW_LOAD			 <= '1';			
		end case;
	end process fsm_out;
		
	-- Data counter process						
	data_cnt : process (iCLK, inRST) begin				
		if (inRST = '0') then
			sDATA_CNT <= (others => '0'); -- Reset counter		
		elsif (iCLK'event and iCLK = '1') then	
			if (sTC_PERIOD_CNT = '1' or sDATA_CNT_RST = '1') then 
				sDATA_CNT <= (others => '0'); -- Reset counter when all data recived and period elapsed
			elsif (sSCL_RISING_EDGE = '1' and sDATA_CNT_EN = '1') then
				sDATA_CNT <= sDATA_CNT + 1; -- Count data bits
			end if;	
		end if;
	end process data_cnt;	
	
	-- Period counter
	per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sPERIOD_CNT <= (others => '0'); -- Reset counter 
		elsif (iCLK'event and iCLK = '1') then
			if (sPERIOD_CNT = TC_PERIOD - 1) then -- Check counted periods
				sPERIOD_CNT <= (others => '0'); 
			elsif (iTC = '1' and sPERIOD_CNT_EN = '1') then 
				sPERIOD_CNT <= sPERIOD_CNT + 1; -- Count period
			end if;
		end if;
	end process per_cnt;
	
	-- Period counter terminal count 
	sTC_PERIOD_CNT <= '1' when sPERIOD_CNT = TC_PERIOD - 1 else
							'0';	
	
	-- Transmission period counter
	tr_per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sTR_PERIOD_CNT <= (others => '0'); -- Reset counter 
		elsif (iCLK'event and iCLK = '1') then
			if (sTR_PERIOD_CNT = TR_PERIOD - 1 or sTR_PERIOD_CNT_RST = '1') then -- Check counted periods
				sTR_PERIOD_CNT <= (others => '0'); 
			elsif (iTC = '1' and sTR_PERIOD_CNT_EN = '1') then 
				sTR_PERIOD_CNT <= sTR_PERIOD_CNT + 1; -- Count period
			end if;
		end if;
	end process tr_per_cnt;
	
	-- Transmission period counter terminal count 
	sTC_TR_PERIOD_CNT <= '1' when sTR_PERIOD_CNT = TR_PERIOD - 1 else
								'0'; 	
								
	-- Output shift register process
	oshift_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sOSHW_REG <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then	
			if (sOSHW_LOAD = '1') then
				sOSHW_REG <= sREG_MUX; -- Load data to register
			elsif (sOSHW_EN = '1' and sTC_TR_PERIOD_CNT = '1') then -- When data bit transsmited shift for next data bit
				sOSHW_REG <= sOSHW_REG(DATA_WIDTH - 2 downto 0) & '0'; -- Shift data bits
			end if;	
		end if;
	end process oshift_reg;	

	-- Registers multiplexer process
	reg_mux : process (sREG_MUX_SEL, sSLAVE_ADDR_REG, sREG_ADDR_REG, sLOW_BYTE_REG, sUPPER_BYTE_REG) begin
		-- Select register
		case (sREG_MUX_SEL) is
			when "00" =>
				sREG_MUX <= sSLAVE_ADDR_REG;
			when "01" =>
				sREG_MUX <= sREG_ADDR_REG;
			when "10" =>
				sREG_MUX <= sLOW_BYTE_REG;
			when others =>
				sREG_MUX <= sUPPER_BYTE_REG;		
		end case;
	end process reg_mux;
		
	-- Register decoder
	sREG_DEC <= "0000" when sREG_DEC_EN =  '0'  else 
					"0001" when sREG_DEC_SEL = "00" else
					"0010" when sREG_DEC_SEL = "01" else
					"0100" when sREG_DEC_SEL = "10" else
					"1000";
	
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

	-- Output SCL 
	oSCL <= sSCL;
					
end Behavioral;

