library IEEE;
use IEEE.STD_LOGIC_1164.all;

package uart_i2c_bridge_components is

	-- UART to I2C bridge components

	component uart is
		 Generic (
			BAUD_RATE_SEL : integer := 3;  -- Width of baud rate select
			DATA_BIT_SEL  : integer := 2;  -- Width of data bit number select
			DATA_WIDTH    : integer := 8	 -- Data width 
		 );
		 Port ( iCLK        		 : in   std_logic;												-- Clock signal 50MHz
				  inRST       		 : in   std_logic;												-- Reset signal
				  iPARITY_EN		 : in   std_logic;												-- Parity enable
				  iPARITY			 : in   std_logic;												-- Parity mode
				  iHANDSHAKE_EN    : in   std_logic;												-- Handshake enable signal
				  iDATA_SEL			 : in   std_logic_vector(DATA_BIT_SEL  - 1 downto 0); -- Data bit mode signal
				  iBAUD_SEL			 : in   std_logic_vector(BAUD_RATE_SEL - 1 downto 0); -- Baud rate selection
				  iCTS				 : in   std_logic;												-- Clear to send signal
				  iRX         		 : in   std_logic;												-- RX signal
				  iUART_DATA		 : in   std_logic_vector(DATA_WIDTH - 1 downto 0); 	-- Transmitter input data
				  iUART_WR 			 : in	  std_logic;												-- Write to transmitter signal
				  iUART_RD    		 : in   std_logic;												-- Read from reciver signal			
				  oTX         		 : out  std_logic;												-- TX signal
				  oRTS				 : out  std_logic;												-- Request to send signal		  
				  oUART_FULL       : out  std_logic;												-- Reciver FIFO full idication
				  oUART_EMPTY      : out  std_logic;												-- Transmitter FULL empty indication
				  oUART_DATA       : out  std_logic_vector(DATA_WIDTH - 1 downto 0));	-- Reciver output data
	end component;	
		
	component uart_i2c_master is
		 Generic (
			REGISTER_NUM		   : integer := 4;	-- Number of register
			MAX_BYTE_NUM			: integer := 4;	-- Maximum number of bytes which can send and recive as a exp of 2			
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
				  oLCD_READ_VALID	: out   std_logic;												-- LCD display driver read valid
				  oLCD_DATA_EN		: out   std_logic;												-- LCD display driver data enable
				  oLCD_BYTE_EN		: out   std_logic;												-- LCD display driver data byte enable
				  ioSDA		   	: inout std_logic);												-- SDA signal
	end component;	
		
end uart_i2c_bridge_components;

