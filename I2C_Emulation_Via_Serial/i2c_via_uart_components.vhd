library IEEE;
use IEEE.STD_LOGIC_1164.all;

package i2c_via_uart_components is

	-- I2C via UART components declaration
	
	component dcm24_to_50 is
		 Port( CLK_IN1           : in     std_logic;
				 CLK_OUT1          : out    std_logic;
				 RESET             : in     std_logic;
				 LOCKED            : out    std_logic
		 );
	end component;
	
	component i2c_bus is
		 Generic (
			DATA_WIDTH 			: integer := 8;	 -- UART word widht 
			LCD_BUS_WIDTH 		: integer := 4		 -- Width of LCD interface	
		 );
		 Port ( iCLK  		   : in 	  std_logic;												-- Clock signal 50MHz	
				  inRST 		   : in 	  std_logic;												-- Reset signal
				  iUART_FULL   : in 	  std_logic; 												-- UART transmitter FIFO full indication
				  iUART_EMPTY  : in    std_logic;												-- UART reciver FIFO empty indication
				  iUART_DATA   : in 	  std_logic_vector(DATA_WIDTH - 1  downto 0);	-- UART data from reciver	
				  oUART_READ   : out   std_logic;												-- Read from UART reciver signal
				  oUART_WRITE  : out   std_logic;												-- Write to UART transmitter
				  oUART_DATA   : out   std_logic_vector(DATA_WIDTH - 1  downto 0);   -- UART data to transmitter
				  oLCD_E 	   : out   std_logic;												-- LCD display enable signal
				  oLCD_RS    	: out   std_logic;												-- LCD display register select signal
				  oLCD_RW      : out   std_logic;												-- LCD read write signa
				  ioLCD_D 		: inout std_logic_vector(LCD_BUS_WIDTH - 1 downto 0));-- LCD display data signal
	end component;
	
	component uart is
		 Generic (
			BAUD_RATE_SEL : integer := 3;  -- Width of baud rate select
			DATA_BIT_SEL  : integer := 2;  -- Width of data bit number select
			DATA_WIDTH    : integer := 8	 -- Data widht 
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
			  iUART_DATA		 : in   std_logic_vector(DATA_WIDTH 	- 1 downto 0); -- Transmitter input data
			  iUART_WR 			 : in	  std_logic;												-- Write to transmitter signal
           iUART_RD    		 : in   std_logic;												-- Read from reciver signal			
			  oTX         		 : out  std_logic;												-- TX signal
			  oRTS				 : out  std_logic;												-- Request to send signal
			  oLED			: out   std_logic_vector(7 downto 0);			  
			  oUART_FULL       : out  std_logic;												-- Reciver FIFO full idication
           oUART_EMPTY      : out  std_logic;												-- Transmitter FULL empty indication
           oUART_DATA       : out  std_logic_vector(DATA_WIDTH - 1 downto 0));	-- Reciver output data
	end component;	


end i2c_via_uart_components;

