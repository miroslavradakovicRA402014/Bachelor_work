----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic 
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
use IEEE.STD_LOGIC_ARITH.ALL;


entity uart_i2c_master is
	 Generic (
		REGISTER_NUM		   : integer := 4;	-- Number of register
		TC_PERIOD			   : integer := 13;  -- Bus control period 
		TR_PERIOD			   : integer := 17;  -- Master transmission peirod
		REGISTER_SEL_WIDTH   : integer := 2;	-- Register mux and decoder select widht
		DATA_WIDTH 			   : integer := 8;	-- UART word widht 
		DATA_CNT_WIDTH 	   : integer := 4;   -- Data counter width
		BYTE_CNT_WIDTH 	   : integer := 8;   -- Byte counter width
		TR_PERIOD_CNT_WIDTH  : integer := 5;	-- Transmisssion period counter width
		PERIOD_CNT_WIDTH     : integer := 4;	-- Period counter width
		LCD_BUS_WIDTH 			: integer := 4		-- Width of LCD interface	
	 );
    Port ( iCLK  		   	: in 	  std_logic;												-- Clock signal 50MHz
           inRST 		   	: in 	  std_logic;												-- Reset signal 
			  iUART_FULL   	: in 	  std_logic; 												-- UART full indication
			  iUART_EMPTY  	: in    std_logic;												-- UART empty indication
			  iUART_DATA   	: in 	  std_logic_vector(DATA_WIDTH - 1  downto 0);   -- Input data from UART FIFO
			  oUART_READ   	: out   std_logic;												-- Read from UART signal
			  oUART_WRITE  	: out   std_logic;												-- Write to UART signal
			  oUART_DATA   	: out   std_logic_vector(DATA_WIDTH - 1  downto 0);	-- Output data to UART FIFO
			  oSCL		   	: out   std_logic;												-- SCL signal
			  oLCD_SLAVE_ADDR	: out   std_logic_vector(DATA_WIDTH - 1 downto 0);		-- LCD display driver slave address data
			  oLCD_REG_ADDR	: out   std_logic_vector(DATA_WIDTH - 1 downto 0); 	-- LCD display driver register address data
			  oLCD_DATA_BYTE	: out   std_logic_vector(DATA_WIDTH - 1 downto 0);		-- LCD display driver data byte 
			  oLCD_BYTE_NUM	: out   std_logic_vector(DATA_WIDTH - 1 downto 0);		-- LCD display driver data byte number data 
			  oLCD_MODE			: out   std_logic;												-- LCD display driver mode data
			  oLCD_DATA_EN		: out   std_logic;												-- LCD display driver data enable
			  oLCD_BYTE_EN		: out   std_logic;												-- LCD display driver data byte enable
			  ioSDA		   	: inout std_logic);												-- SDA signal
end uart_i2c_master;

architecture Behavioral of uart_i2c_master is

	-- ACK and NACK constant 
	constant cACK  : std_logic := '0';
	constant cNACK : std_logic := '1';

	type   tSTATES is (IDLE, UART_START, UART_SLAVE_ADDRESS, UART_REGISTER_ADDRESS, UART_BYTE_NUMBER, UART_DATA_BYTE, UART_LOAD_BYTE, UART_NEXT_BYTE, UART_STOP,
							 I2C_START_CONDITION, I2C_START, I2C_SLAVE_ADDRESS_WRITE, I2C_SLAVE_ADDRESS_ACK_WRITE, I2C_SLAVE_ADDRESS_READ, I2C_SLAVE_ADDRESS_ACK_READ, 
							 I2C_REGISTER_ADDRESS, I2C_REGISTER_ADDRESS_ACK, I2C_REPEATED_START_SETUP, I2C_REPEATED_START_HOLD, I2C_READ_DATA, I2C_WRITE_DATA, I2C_WRITE_DATA_ACK, 
							 I2C_READ_DATA_ACK, I2C_STOP, I2C_NACK_STOP, SEND_I2C_UART_TELEGRAM, SEND_UART_SLAVE_ADDRESS, SEND_UART_REGISTER_ADDRESS, SEND_UART_BYTE_NUMBER, SEND_UART_DATA_BYTE); -- Slave FSM states type


	signal sCURRENT_STATE 	   	: tSTATES;																				 		-- Master FSM current state
	signal sNEXT_STATE    	   	: tSTATES; 																			 			-- Master FSM next state

	signal sSCL							: std_logic;																					-- SCL signal
	
	signal sTC							: std_logic;																					-- Frequency clock divider terminal count
	signal sFREQ_EN					: std_logic;																					-- Frequency clock divider enable 

	signal sOUT_BUFF_EN	 	   	: std_logic;																					-- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	   	: std_logic;																					-- Input tri-state buffer enable

	signal sSDA_IN			 	   	: std_logic;																					-- SDA input signal
	signal sSDA_OUT 		 	   	: std_logic;																					-- SDA output signal

	signal sDATA_CNT 		 	   	: unsigned(DATA_CNT_WIDTH - 1 downto 0);												-- Data bits counter
	signal sDATA_CNT_EN 	 	   	: std_logic;																					-- Data bits counter enable		
	signal sDATA_CNT_RST				: std_logic;																					-- Data bits counter reset signal


	signal sDATA_BYTE_CNT 		 	: unsigned(BYTE_CNT_WIDTH - 1 downto 0);												-- Data byte counter 
	signal sDATA_BYTE_CNT_EN 	 	: std_logic;																					-- Data byte counter enable		
	signal sDATA_BYTE_CNT_RST		: std_logic;																					-- Data byte counter reset signal				

	signal sBYTE_CNT 		 	   	: unsigned(BYTE_CNT_WIDTH - 1 downto 0);												-- Recived/transmitted data byte counter 
	signal sBYTE_CNT_EN 	 	   	: std_logic;																					-- Recived/transmitted data byte counter enable		
	signal sBYTE_CNT_RST				: std_logic;																					-- Recived/transmitted data byte counter reset signal
	
	signal sPERIOD_CNT 		   	: unsigned(PERIOD_CNT_WIDTH - 1 downto 0);											-- Period counter
	signal sPERIOD_CNT_EN 	   	: std_logic;																					-- Period counter enable
	signal sTC_PERIOD_CNT 			: std_logic;																					-- Period counter terminal count

	signal sTR_PERIOD_CNT 			: unsigned(TR_PERIOD_CNT_WIDTH - 1 downto 0);										-- Master transmission period
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
	signal sSCL_RST					: std_logic;																					-- SCL generator reset signal
	
	signal sSCL_RISING_EDGE    	: std_logic;																					-- SCL rising edge indication
	
	signal sIUART_REG					: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- UART input register signal
	signal sIUART_REG_EN				: std_logic;																					-- UART input register	enable
	signal sOUART_REG					: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- UART input register signal
	signal sOUART_REG_EN				: std_logic;																					-- UART output register enable

	signal sACK							: std_logic;																					-- Acknowelge signal from mux
	signal sACK_SEL					: std_logic;																					-- Acknowelge select signal 
	signal sACK_FF						: std_logic;																					-- Acknowelge flip-flop  
	signal sACK_FF_EN					: std_logic;																					-- Acknowelge flip-flop enable  	
	
	signal sSDA_SEL					: std_logic;																					-- SDA line data select

	signal sDATA_BYTE_SEL			: std_logic;																					-- Data fifo register multiplexer selection
	signal sDATA_BYTE_MUX			: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Data fifo register multiplexer

	signal sOUART_REG_MUX 			: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- UART output registers multiplexer
	signal sOUART_REG_SEL			: std_logic_vector(1 downto 0);															-- UART output registers multiplexer select signal	

	signal sSLAVE_ADDR_MUX			: std_logic_vector(DATA_WIDTH	- 1 downto 0);											-- Slave address register multiplexer
	signal sSLAVE_ADDR_SEL			: std_logic;																					-- Slave address register multiplexer select
	
	signal sSLAVE_ADDR_REG 			: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Slave address register 
	signal sREG_ADDR_REG 		   : std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Slave address register register
	signal sSLAVE_ADDR 				: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Slave address without mode bit
	signal sBYTE_NUM_REG				: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Byte number register

	signal sDATA_FIFO_READ			: std_logic;																					-- Data FIFO read signal
	signal sDATA_FIFO_FULL			: std_logic;																					-- Data FIFO full indication
	signal sDATA_FIFO_EMPTY			: std_logic;																					-- Data FIFO empty indication
	signal sDATA_BYTE 				: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- Data byte		
	signal sDATA_FIFO_RST			: std_logic;																					-- Data FIFO reset multiplexer
	signal sDATA_FIFO_RST_SEL		: std_logic;																					-- Data FIFO reset multiplexer select

	signal sBYTE_SEL					: std_logic;																					-- Data byte multiplexer select

	signal sREG_DEC 					: std_logic_vector(REGISTER_NUM - 1 downto 0);										-- Registers decoder
	signal sREG_DEC_SEL 				: std_logic_vector(REGISTER_SEL_WIDTH - 1 downto 0);								-- Register decoder selection signal
	signal sREG_DEC_EN				: std_logic;																					-- Register decoder enable

	signal sLCD_DATA_EN				: std_logic;																					-- LCD driver data enable signal
	signal sLCD_BYTE_EN				: std_logic;																					-- LCD driver data byte enable

	signal sLCD_BYTE_MUX				: std_logic_vector(DATA_WIDTH - 1 downto 0);											-- LCD data byte multiplexer
	signal sLCD_BYTE_SEL				: std_logic;																					-- LCD data byte multiplexer selection

begin

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
				iD 	=> sOUART_REG_MUX,
				oQ		=> sOUART_REG
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
	
	-- Slave address
	sSLAVE_ADDR <= '0' & sSLAVE_ADDR_REG(DATA_WIDTH - 1 downto 1); 
	
	-- Register address register
	eREG_ADDR_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sREG_DEC(1),
				iD 	=> sIUART_REG,
				oQ		=> sREG_ADDR_REG
			);	

	-- Data bytes FIFO
	eDATA_FIFO : entity work.fifo 
			Generic map(
				NUM_OF_WORDS => 8
			)
			Port map(
				iCLK   	=> iCLK,
				inRST  	=> sDATA_FIFO_RST,
				iDATA  	=> sDATA_BYTE_MUX,
				iWR    	=> sREG_DEC(2),
				iRD    	=> sDATA_FIFO_READ,
				oFULL  	=> sDATA_FIFO_FULL,
				oEMPTY 	=> sDATA_FIFO_EMPTY,
				oDATA  	=> sDATA_BYTE
			);
			
	-- Data FIFO reset 
	sDATA_FIFO_RST <= '0' when sDATA_FIFO_RST_SEL = '1' else
							inRST;
	
				
	-- Data byte number register
	eBYTE_NUM_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sREG_DEC(3),
				iD 	=> sIUART_REG,
				oQ		=> sBYTE_NUM_REG
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
				iCLK     => iCLK,
				inRST    => inRST,
				iSCL_RST => sSCL_RST,
				iSCL_EN  => sSCL_EN,
				iTC      => sTC,
				oSCL	   => sSCL
			);
				
	-- I2C bus clock frequency divider		
	eCLK_FREQ_DIV : entity work.i2c_clk_freq_div
			Port map(
				iCLK		=> iCLK,
				inRST 	=> inRST,
				iFREQ_EN => sFREQ_EN,
				oTC   	=>	sTC		
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
	fsm_next : process (sCURRENT_STATE, ioSDA, iUART_EMPTY, iUART_FULL, iUART_DATA, sTC_TR_PERIOD_CNT, sTC_PERIOD_CNT, sSLAVE_ADDR_REG, sBYTE_NUM_REG, sIUART_REG, sDATA_BYTE_CNT, sBYTE_CNT, sSLAVE_ADDR_MUX, sACK_FF) begin
		sNEXT_STATE <= sCURRENT_STATE;
		case (sCURRENT_STATE) is
			when IDLE =>
				if (iUART_EMPTY = '0') then -- Check is there messages
					sNEXT_STATE <= UART_START; -- Get I2C telegram from UART
				end if;
			when UART_START =>
				if (iUART_EMPTY = '0') then
					sNEXT_STATE <= UART_SLAVE_ADDRESS; -- Get slave address from UART 
				end if;
			when UART_SLAVE_ADDRESS =>
				if (iUART_EMPTY = '0') then
					sNEXT_STATE <= UART_REGISTER_ADDRESS; -- Get register address number from UART			
				end if;			
			when UART_REGISTER_ADDRESS =>
				sNEXT_STATE <= UART_BYTE_NUMBER;	-- Get data byte number from UART 								
			when UART_BYTE_NUMBER =>
				if (sBYTE_NUM_REG = "00000000") then -- If you don't want to read or write bytes 
					sNEXT_STATE <= IDLE;
				elsif (sSLAVE_ADDR_REG(0) = '1') then
					sNEXT_STATE <= UART_STOP; -- Get lower data byte from UART		
				else
					sNEXT_STATE <= UART_DATA_BYTE; -- Get data byte from UART
				end if;			
			when UART_DATA_BYTE =>
				if (CONV_STD_LOGIC_VECTOR(sDATA_BYTE_CNT, DATA_WIDTH) = sBYTE_NUM_REG) then
					sNEXT_STATE <= UART_STOP; -- End of I2C telegram all bytes recived
				else
					if (iUART_EMPTY = '0') then -- Check can you can read from UART and can write to
						sNEXT_STATE <= UART_LOAD_BYTE; -- Load data byte from input UART register
					end if;	
				end if;	
			when UART_LOAD_BYTE =>	
				sNEXT_STATE <= UART_NEXT_BYTE; -- Get next data byte
			when UART_NEXT_BYTE =>
				sNEXT_STATE <= UART_DATA_BYTE; 
			when UART_STOP =>
				sNEXT_STATE <= I2C_START_CONDITION; -- Generate start condition
			when I2C_START_CONDITION =>
				sNEXT_STATE <= I2C_START;	-- Start send I2C telegram
			when I2C_START =>
				-- Check if period elapsed
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= I2C_SLAVE_ADDRESS_WRITE; -- Send I2C address to slave
				end if;			
			when I2C_SLAVE_ADDRESS_WRITE =>
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= I2C_SLAVE_ADDRESS_ACK_WRITE; -- Get slave address ack
				end if;
			when I2C_SLAVE_ADDRESS_ACK_WRITE =>
				-- Check if period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then 
					if (sACK_FF /= '0') then
						sNEXT_STATE <= I2C_NACK_STOP;  -- Slave doesn't acknowelge 
					else 
						sNEXT_STATE <= I2C_REGISTER_ADDRESS; -- Send slave register address
					end if;
				end if;	
			when I2C_SLAVE_ADDRESS_READ =>
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= I2C_SLAVE_ADDRESS_ACK_READ; -- Get slave address ack
				end if;
			when I2C_SLAVE_ADDRESS_ACK_READ =>
				-- Check if period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then
					if (sACK_FF /= '0') then
						sNEXT_STATE <= I2C_NACK_STOP;  -- Slave doesn't acknowelge 
					else 				
						sNEXT_STATE <= I2C_READ_DATA; -- Get data byte
					end if;	
				end if;				
			when I2C_REGISTER_ADDRESS =>
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= I2C_REGISTER_ADDRESS_ACK;
				end if;
			when I2C_REGISTER_ADDRESS_ACK => 	
				-- Check if period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then
					if (sACK_FF = '1') then 
						sNEXT_STATE <= I2C_NACK_STOP; -- If address is not correct stop transaction
					else
						if (sSLAVE_ADDR_REG(0) = '0') then 
							sNEXT_STATE <= I2C_WRITE_DATA; -- Write data to slave
						else 
							sNEXT_STATE <= I2C_REPEATED_START_SETUP; -- Generate repeated start
						end if;
					end if;
				end if;
			when I2C_REPEATED_START_SETUP =>
				-- Check if period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then 
					sNEXT_STATE <= I2C_REPEATED_START_HOLD;
				end if;	
			when I2C_REPEATED_START_HOLD =>
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT = '1') then 
					sNEXT_STATE <= I2C_SLAVE_ADDRESS_READ; -- Send slave register address 
				end if;					
			when I2C_WRITE_DATA => 
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= I2C_WRITE_DATA_ACK;
				end if;	
			when I2C_READ_DATA =>
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= I2C_READ_DATA_ACK;
				end if;		
			when I2C_WRITE_DATA_ACK =>
				-- Check if period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then 
					if (sACK_FF /= '0') then
						sNEXT_STATE <= I2C_NACK_STOP; -- Nack  
					elsif (CONV_STD_LOGIC_VECTOR(sBYTE_CNT, DATA_WIDTH) = sBYTE_NUM_REG) then
						sNEXT_STATE <= I2C_STOP; -- All bytes written to slave
					else
						sNEXT_STATE <= I2C_WRITE_DATA; -- Write another byte
					end if;
				end if;	
			when I2C_READ_DATA_ACK =>
				-- Check if period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then 
					if (CONV_STD_LOGIC_VECTOR(sBYTE_CNT, DATA_WIDTH) = sBYTE_NUM_REG) then
						sNEXT_STATE <= I2C_STOP; -- All bytes read from slave
					else
						sNEXT_STATE <= I2C_READ_DATA; -- Read another byte from slave
					end if;	
				end if;					
			when I2C_STOP =>
				-- Check if period elapsed
				if (sTC_TR_PERIOD_CNT = '1') then
					if (sSLAVE_ADDR_REG(0) = '1') then -- If read form slave return back to UART 
						sNEXT_STATE <= SEND_I2C_UART_TELEGRAM;
					else
						sNEXT_STATE <= IDLE;
					end if;
				end if;
			when I2C_NACK_STOP =>
				-- Check if period elapsed
				if (sTC_TR_PERIOD_CNT = '1') then
					sNEXT_STATE <= IDLE;
				end if;				
			when SEND_I2C_UART_TELEGRAM =>
				-- Start to send I2C telegram to UART
				if (iUART_FULL = '0') then -- Check if UART is FULL
					sNEXT_STATE <= SEND_UART_SLAVE_ADDRESS;	-- Send slave address to UART 
				end if;
			when SEND_UART_SLAVE_ADDRESS =>
				if (iUART_FULL = '0') then	-- Check if UART is FULL
					sNEXT_STATE <= SEND_UART_REGISTER_ADDRESS; -- Send register address to UART 
				end if;
			when SEND_UART_REGISTER_ADDRESS =>
				if (iUART_FULL = '0') then -- Check if UART is FULL
					sNEXT_STATE <= SEND_UART_BYTE_NUMBER; -- Send data byte number to UART 
				end if;				
			when SEND_UART_BYTE_NUMBER =>
				if (iUART_FULL = '0') then -- Check if UART is FULL
					sNEXT_STATE <= SEND_UART_DATA_BYTE; -- Send data bytes to UART 
				end if;
			when SEND_UART_DATA_BYTE =>
				if (CONV_STD_LOGIC_VECTOR(sDATA_BYTE_CNT, DATA_WIDTH) = sBYTE_NUM_REG - 1) then -- Check if all bytes sent to UART 
					sNEXT_STATE <= IDLE; 					
				end if;	
		end case;
	end process fsm_next;	

	-- Master FSM output logic
	fsm_out : process (sCURRENT_STATE, iUART_EMPTY, iUART_FULL, sSLAVE_ADDR_REG, sTR_PERIOD_CNT, sTC_TR_PERIOD_CNT, sDATA_CNT, sBYTE_CNT, sBYTE_NUM_REG, sSCL_RISING_EDGE) begin
		sIN_BUFF_EN	 		 	<= '0';
		sOUT_BUFF_EN 		 	<= '0';
		sIUART_REG_EN  	 	<= '0';
		sOUART_REG_EN		 	<= '0';
		sACK_SEL		 		 	<= '0';
		sACK_FF_EN				<= '0';
		sSDA_SEL		 		 	<= '0';
		sBYTE_SEL		 		<= '0';		
		sSLAVE_ADDR_SEL		<= '0';				
		sREG_MUX_SEL		 	<= "00";		
		sREG_DEC_SEL		 	<= "00";
		sREG_DEC_EN			 	<= '0';
		sDATA_FIFO_READ		<= '0';
		sDATA_FIFO_RST_SEL	<= '0';
		sSCL_EN				 	<= '0';	
		sSCL_RST					<= '0';
		sFREQ_EN 			 	<= '0';
		oUART_READ  		 	<= '0';
		oUART_WRITE			 	<= '0';
		sDATA_CNT_EN 		 	<= '0';
		sDATA_CNT_RST 		 	<= '0';
		sDATA_BYTE_CNT_EN   	<= '0';
		sDATA_BYTE_CNT_RST 	<= '0';		
		sBYTE_CNT_EN   	 	<= '0';
		sBYTE_CNT_RST 		 	<= '0';					
		sPERIOD_CNT_EN 	 	<= '0';
		sTR_PERIOD_CNT_RST 	<= '0';
		sTR_PERIOD_CNT_EN  	<= '0';
		sISHW_EN			    	<= '0';				
		sOSHW_EN				 	<= '0';
		sOSHW_LOAD			 	<= '0';	
		sOUART_REG_SEL		 	<= "00";
		sLCD_DATA_EN 			<= '0';
		sLCD_BYTE_EN			<= '0';
		sLCD_BYTE_SEL			<= '0';
		case (sCURRENT_STATE) is
			-- Master control signals
			when IDLE =>
				sOUT_BUFF_EN 		 	<= '1';
				sIUART_REG_EN  	 	<= '1';
				sACK_SEL		 		 	<= '1';
				if (iUART_EMPTY = '0') then
					oUART_READ  		 	<= '1';
				end if;
				sBYTE_CNT_RST 		 	<= '1';	
				sDATA_BYTE_CNT_RST 	<= '1';		
				sDATA_FIFO_RST_SEL	<= '1';	
			when UART_START =>
				sOUT_BUFF_EN 		 	<= '1';
				sACK_SEL		 		 	<= '1';
				if (iUART_EMPTY = '0') then
					sIUART_REG_EN  		<= '1';
					oUART_READ  		 	<= '1';	
					sREG_DEC_EN			 	<= '1';
				end if;		
			when UART_SLAVE_ADDRESS =>
				sOUT_BUFF_EN 		 	<= '1';
				sACK_SEL		 		 	<= '1';	
				if (iUART_EMPTY = '0') then	
					sIUART_REG_EN  		<= '1';
					oUART_READ  		 	<= '1';
					sREG_DEC_EN			 	<= '1';	
				end if;		
				sREG_DEC_SEL		 	<= "01";
			when UART_REGISTER_ADDRESS =>
				sOUT_BUFF_EN 		 	<= '1';
				sACK_SEL		 		 	<= '1';		
				sREG_DEC_SEL		 	<= "11";
				sREG_DEC_EN			 	<= '1';							
			when UART_BYTE_NUMBER =>
				sOUT_BUFF_EN 		 	<= '1';
				sACK_SEL		 		 	<= '1';					
			when UART_DATA_BYTE =>
				sOUT_BUFF_EN 		 	<= '1';
				sIUART_REG_EN  		<= '1';
				sACK_SEL		 		 	<= '1';	
				if (iUART_EMPTY = '0') then
					oUART_READ  		 	<= '1';	
				end if;
				sREG_DEC_SEL		 	<= "10";
			when UART_LOAD_BYTE =>
				sOUT_BUFF_EN 		 	<= '1';
				sACK_SEL		 		 	<= '1';	
				sREG_DEC_EN			 	<= '1';	
				sREG_DEC_SEL		 	<= "10";
				sLCD_BYTE_EN			<= '1';
			when UART_NEXT_BYTE =>
				sOUT_BUFF_EN 		 	<= '1';
				sACK_SEL		 		 	<= '1';
				sDATA_BYTE_CNT_EN		<= '1';	
			when UART_STOP =>	
				sOUT_BUFF_EN 			<= '1';
				sACK_SEL		 		 	<= '1';	
				sSCL_RST					<= '1';
				sDATA_BYTE_CNT_RST 	<= '1';
				sREG_DEC_SEL		 	<= "10";
				if (sSLAVE_ADDR_REG(0) = '0') then
					sLCD_DATA_EN <= '1';
				end if;	
			when I2C_START_CONDITION =>
				sOUT_BUFF_EN 		 	<= '1';	
			when I2C_START =>
				sOUT_BUFF_EN 		 	<= '1';
				sSCL_EN					<= '1';	
				sFREQ_EN 				<= '1';
				sPERIOD_CNT_EN 	 	<= '1';
				sOSHW_LOAD			 	<= '1';		
			when I2C_SLAVE_ADDRESS_WRITE => 
				sOUT_BUFF_EN 		 	<= '1';
				sSDA_SEL		 		 	<= '1';
				sSCL_EN				 	<= '1';	
				sFREQ_EN 			 	<= '1';	
				sDATA_CNT_EN 		 	<= '1';					
				if (sDATA_CNT = DATA_WIDTH) then 
					sPERIOD_CNT_EN  	 <= '1'; 
					sTR_PERIOD_CNT_RST <= '1';
				else
					sOSHW_EN			    <= '1'; 
				end if;
				sTR_PERIOD_CNT_EN  	<= '1';		
			when I2C_SLAVE_ADDRESS_ACK_WRITE =>
				sIN_BUFF_EN	 		 	<= '1';
				sACK_FF_EN				<= '1';
				sREG_MUX_SEL		 	<= "01";				
				sSCL_EN				 	<= '1';	
				sFREQ_EN 			 	<= '1';
				sTR_PERIOD_CNT_EN  	<= '1';
				sOSHW_LOAD			 	<= '1';		
			when I2C_SLAVE_ADDRESS_READ => 
				sOUT_BUFF_EN 		 	<= '1';
				sSDA_SEL		 		 	<= '1';
				sSCL_EN				 	<= '1';	
				sFREQ_EN 			 	<= '1';		
				sDATA_CNT_EN 		 	<= '1';				
				if (sDATA_CNT = DATA_WIDTH) then 
					sPERIOD_CNT_EN  	 <= '1'; 
					sTR_PERIOD_CNT_RST <= '1';
				else
					sOSHW_EN			    <= '1'; 
				end if;
				sTR_PERIOD_CNT_EN  	<= '1';			
			when I2C_SLAVE_ADDRESS_ACK_READ =>
				sIN_BUFF_EN	 		 	<= '1';
				sACK_FF_EN				<= '1';
				sREG_MUX_SEL		 	<= "01";				
				sSCL_EN				 	<= '1';	
				sFREQ_EN 			 	<= '1';
				sTR_PERIOD_CNT_EN  	<= '1';							
			when I2C_REGISTER_ADDRESS => 
				sOUT_BUFF_EN 		 	<= '1';
				sSDA_SEL		 		 	<= '1';
				sSCL_EN				 	<= '1';
				sFREQ_EN 			 	<= '1';					
				sDATA_CNT_EN 			<= '1';				
				if (sDATA_CNT = DATA_WIDTH) then 
					sPERIOD_CNT_EN  	 <= '1';
					sTR_PERIOD_CNT_RST <= '1';					
				else
					sOSHW_EN			 	 <= '1'; 
				end if;
				sTR_PERIOD_CNT_EN  	<= '1';			
			when I2C_REGISTER_ADDRESS_ACK =>
				sIN_BUFF_EN	 		 <= '1';
				sACK_FF_EN			 <= '1';
				if (sSLAVE_ADDR_REG(0) = '0') then
					sREG_MUX_SEL		 <= "10";				
					if (sSCL_RISING_EDGE = '1') then 
						sOSHW_LOAD			 <= '1';
						sDATA_FIFO_READ	 <= '1';
					end if;		
				end if;				
				sSCL_EN				 <= '1';
				sFREQ_EN 			 <= '1';
				sTR_PERIOD_CNT_EN  <= '1';
			when I2C_REPEATED_START_SETUP =>
				sOUT_BUFF_EN 		 	<= '1';
				if (sTR_PERIOD_CNT < 12) then
					sACK_SEL		 		 	<= '1';
					if (sTR_PERIOD_CNT < 2) then
						sSCL_EN				 	<= '1';
					end if;
				else
					sSCL_RST				 	<= '1';
				end if;			
				sFREQ_EN 			 	<= '1';
				sTR_PERIOD_CNT_EN  	<= '1';	
			when I2C_REPEATED_START_HOLD =>
				sOUT_BUFF_EN 		 	<= '1';
				sSLAVE_ADDR_SEL		<= '1';
				sSCL_EN				 	<= '1';				
				sFREQ_EN 			 	<= '1';
				sPERIOD_CNT_EN			<= '1';
				sOSHW_LOAD			 	<= '1';				
			when I2C_WRITE_DATA =>
				sOUT_BUFF_EN 		 <= '1';
				sSDA_SEL		 		 <= '1';
				sSCL_EN				 <= '1';	
				sFREQ_EN 			 <= '1';	
				sDATA_CNT_EN 		 <= '1';
				sBYTE_CNT_EN   	 <= '1';				
				if (sDATA_CNT = DATA_WIDTH) then 
					sPERIOD_CNT_EN  	 <= '1'; 
					sTR_PERIOD_CNT_RST <= '1';
				else
					sOSHW_EN			    <= '1'; 
				end if;
				sTR_PERIOD_CNT_EN  <= '1';				
			when I2C_READ_DATA =>
				sIN_BUFF_EN	 		 <= '1';
				sBYTE_SEL		 	 <= '1';		
				sREG_MUX_SEL		 <= "10";	
				sSCL_EN				 <= '1';	
				sFREQ_EN 			 <= '1';		
				sDATA_CNT_EN 		 <= '1';	
				sBYTE_CNT_EN   	 <= '1';				
				if (sDATA_CNT = DATA_WIDTH) then 
					sPERIOD_CNT_EN  	 <= '1'; 
					sTR_PERIOD_CNT_RST <= '1';
				else
					sISHW_EN			    <= '1'; 
				end if;
				sTR_PERIOD_CNT_EN  <= '1';			
			when I2C_WRITE_DATA_ACK =>
				sIN_BUFF_EN	 		 <= '1';
				sACK_FF_EN			 <= '1';
				sSCL_EN				 <= '1';	
				sFREQ_EN 			 <= '1';
				sTR_PERIOD_CNT_EN  <= '1';
				if (CONV_STD_LOGIC_VECTOR(sBYTE_CNT, DATA_WIDTH) /= sBYTE_NUM_REG) then
					sREG_MUX_SEL		 <= "10";
					if (sSCL_RISING_EDGE = '1') then
						sOSHW_LOAD			 <= '1';
						sDATA_FIFO_READ	 <= '1';
					end if;
				end if;				
			when I2C_READ_DATA_ACK =>
				sOUT_BUFF_EN 		 <= '1';			
				if (CONV_STD_LOGIC_VECTOR(sBYTE_CNT, DATA_WIDTH) = sBYTE_NUM_REG) then
					sACK_SEL		 		 <= '1';
				end if;	
				sBYTE_SEL			 <= '1';
				sREG_DEC_SEL		 <= "10";		
				if (sSCL_RISING_EDGE = '1') then
					sREG_DEC_EN			 <= '1';
				end if;
				sSCL_EN				 <= '1';	
				sFREQ_EN 			 <= '1';
				sTR_PERIOD_CNT_EN  <= '1';				
			when I2C_STOP =>
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '1';
				sFREQ_EN 			 <= '1';
				sTR_PERIOD_CNT_EN  <= '1';	
			when I2C_NACK_STOP =>
				sOUT_BUFF_EN 		 <= '1';
				sIUART_REG_EN  	 <= '1';	
				sFREQ_EN 			 <= '1';
				sTR_PERIOD_CNT_EN  <= '1';					
			when SEND_I2C_UART_TELEGRAM =>
				sOUT_BUFF_EN 		 <= '1';
				sOUART_REG_EN		 <= '1';
				sACK_SEL		 		 <= '1';	
				sDATA_BYTE_CNT_RST <= '1';
				sLCD_DATA_EN		 <= '1';				
			when SEND_UART_SLAVE_ADDRESS =>
				sOUT_BUFF_EN 		 <= '1';
				sOUART_REG_EN		 <= '1';
				sACK_SEL		 		 <= '1';
				oUART_WRITE			 <= '1';	
				sOUART_REG_SEL		 <= "01";	
			when SEND_UART_REGISTER_ADDRESS =>
				sOUT_BUFF_EN 		 <= '1';
				sOUART_REG_EN		 <= '1';
				sACK_SEL		 		 <= '1';
				oUART_WRITE			 <= '1';
				sOUART_REG_SEL		 <= "11";					
			when SEND_UART_BYTE_NUMBER =>
				sOUT_BUFF_EN 		 <= '1';
				sOUART_REG_EN		 <= '1';
				sACK_SEL		 		 <= '1';
				sDATA_FIFO_READ	 <= '1';
				oUART_WRITE			 <= '1';
				sOUART_REG_SEL		 <= "10";	
				sLCD_BYTE_SEL		 <= '1';	
			when SEND_UART_DATA_BYTE =>
				sOUT_BUFF_EN 		 <= '1';
				sACK_SEL		 		 <= '1';
				if (iUART_FULL = '0') then
					sOUART_REG_EN		 <= '1';
					sDATA_BYTE_CNT_EN	 <= '1';
					sDATA_FIFO_READ	 <= '1';
					oUART_WRITE			 <= '1';
				end if;	
				sOUART_REG_SEL		 <= "10";	
				sLCD_BYTE_EN		 <= '1';
				sLCD_BYTE_SEL		 <= '1';
		end case;
	end process fsm_out;
	
	-- Acknowelge flip-flop  
	ack_ff : process (iCLK, inRST) begin
		if (inRST = '0') then
			sACK_FF <= '0'; -- Reset flip-flop
		elsif (iCLK'event and iCLK = '1') then
			if (sACK_FF_EN = '1') then -- If ack enabled
				if (sSCL_RISING_EDGE = '1') then 
					sACK_FF <= ioSDA; -- Write ack or nack form bus to flip-flop
				end if;	
			end if;
		end if;
	end process ack_ff;	
		
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
	
	-- Data byte counter process						
	data_byte_cnt : process (iCLK, inRST) begin				
		if (inRST = '0') then
			sDATA_BYTE_CNT <= (others => '0'); -- Reset counter		
		elsif (iCLK'event and iCLK = '1') then	
			if (sDATA_BYTE_CNT_RST = '1') then 
				sDATA_BYTE_CNT <= (others => '0'); -- Reset counter
			elsif (sDATA_BYTE_CNT_EN = '1') then
				sDATA_BYTE_CNT <= sDATA_BYTE_CNT + 1; -- Count data byte
			end if;	
		end if;
	end process data_byte_cnt;	
	
	-- Byte counter process						
	byte_cnt : process (iCLK, inRST) begin				
		if (inRST = '0') then
			sBYTE_CNT <= (others => '0'); -- Reset counter		
		elsif (iCLK'event and iCLK = '1') then	
			if (sBYTE_CNT_RST = '1') then 
				sBYTE_CNT <= (others => '0'); -- Reset counter when all data recived and period elapsed
			elsif (sSCL_RISING_EDGE = '1' and sBYTE_CNT_EN = '1' and sDATA_CNT = 0) then
				sBYTE_CNT <= sBYTE_CNT + 1; -- Count data byte
			end if;	
		end if;
	end process byte_cnt;	
		
	-- Period counter process
	per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sPERIOD_CNT <= (others => '0'); -- Reset counter 
		elsif (iCLK'event and iCLK = '1') then
			if (sPERIOD_CNT = TC_PERIOD - 1) then -- Check counted periods
				sPERIOD_CNT <= (others => '0'); 
			elsif (sTC = '1' and sPERIOD_CNT_EN = '1') then 
				sPERIOD_CNT <= sPERIOD_CNT + 1; -- Count period
			end if;
		end if;
	end process per_cnt;
	
	-- Period counter terminal count 
	sTC_PERIOD_CNT 		<= '1'   when sPERIOD_CNT = TC_PERIOD - 1 else
									'0';
	
	-- Transmission period counter
	tr_per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sTR_PERIOD_CNT <= (others => '0'); -- Reset counter 
		elsif (iCLK'event and iCLK = '1') then
			if (sTR_PERIOD_CNT = TR_PERIOD - 1 or sTR_PERIOD_CNT_RST = '1') then -- Check counted periods
				sTR_PERIOD_CNT <= (others => '0'); 
			elsif (sTC = '1' and sTR_PERIOD_CNT_EN = '1') then 
				sTR_PERIOD_CNT <= sTR_PERIOD_CNT + 1; -- Count period
			end if;
		end if;
	end process tr_per_cnt;
	
	-- Transmission period counter terminal count 
	sTC_TR_PERIOD_CNT <= '1' when sTR_PERIOD_CNT = TR_PERIOD - 1 else
								'0'; 	
								
	-- Input shift register process		
	ishift_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sISHW_REG <= (others => '0'); -- Reset shifter
		elsif (iCLK'event and iCLK = '1') then
			if (sISHW_EN = '1' and sSCL_RISING_EDGE = '1') then
				sISHW_REG <= sISHW_REG(DATA_WIDTH - 2 downto 0) & sSDA_IN; -- Shift data bits
			end if;
		end if;
	end process ishift_reg;								
								
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

	-- Slave address/mode multiplexer
	sSLAVE_ADDR_MUX <= sSLAVE_ADDR_REG when sSLAVE_ADDR_SEL = '1' else
							 sSLAVE_ADDR_REG(DATA_WIDTH - 1 downto 1) & '0';
							 							 
	-- Registers multiplexer process
	reg_mux : process (sREG_MUX_SEL, sSLAVE_ADDR_MUX, sREG_ADDR_REG, sDATA_BYTE, sBYTE_NUM_REG) begin
		-- Select register
		case (sREG_MUX_SEL) is
			when "00" =>
				sREG_MUX <= sSLAVE_ADDR_MUX;
			when "01" =>
				sREG_MUX <= sREG_ADDR_REG;
			when others =>
				sREG_MUX <= sDATA_BYTE;	
		end case;
	end process reg_mux;
		
	-- UART output multiplexer
	ouart_reg_mux : process (sOUART_REG_SEL, sSLAVE_ADDR_REG, sREG_ADDR_REG, sDATA_BYTE, sBYTE_NUM_REG) begin
		-- Select UART output register data
		case (sOUART_REG_SEL) is
			when "00" =>
				sOUART_REG_MUX <= sSLAVE_ADDR_REG;
			when "01" =>
				sOUART_REG_MUX <= sREG_ADDR_REG;
			when "10" =>
				sOUART_REG_MUX <= sDATA_BYTE;
			when others =>
				sOUART_REG_MUX <= sBYTE_NUM_REG;
		end case;
	end process ouart_reg_mux;
		
	-- Register decoder
	sREG_DEC <=  "0000" when sREG_DEC_EN =  '0'  else 
					 "0001" when sREG_DEC_SEL = "00" else
					 "0010" when sREG_DEC_SEL = "01" else
					 "0100" when sREG_DEC_SEL = "10" else
					 "1000";
	
	-- Data byte multiplexer
	sDATA_BYTE_MUX <=	sIUART_REG when sBYTE_SEL = '0' else 
							sISHW_REG;
													
	-- LCD data byte multiplexer
	sLCD_BYTE_MUX	<= sIUART_REG when sLCD_BYTE_SEL = '0' else
							sOUART_REG;
													
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
	
	-- Output data
	oUART_DATA <= sOUART_REG;
					
	-- LCD dispalty driver data
	oLCD_SLAVE_ADDR <= sSLAVE_ADDR;
	oLCD_REG_ADDR	 <= sREG_ADDR_REG;
	oLCD_DATA_BYTE	 <= sLCD_BYTE_MUX;
	oLCD_BYTE_NUM	 <= sBYTE_NUM_REG; 
	oLCD_MODE		 <= sSLAVE_ADDR_REG(0);	
	oLCD_DATA_EN	 <= sLCD_DATA_EN;	
	oLCD_BYTE_EN	 <= sLCD_BYTE_EN;	
	
end Behavioral;

