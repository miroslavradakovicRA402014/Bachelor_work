library IEEE;
use IEEE.STD_LOGIC_1164.all;

package i2c_via_uart_components is

	-- I2C via UART components declaration
	
	component dcm24_to_50 is
		 Port( CLK_IN1           : in     std_logic;	-- Input clock 24MHz
				 CLK_OUT1          : out    std_logic;	-- Output clock 50MHz
				 RESET             : in     std_logic; -- DCM reset
				 LOCKED            : out    std_logic	-- DCM locked signal
		 );
	end component;
	
	entity uart_i2c_bridge is
		 Generic (
			BAUD_RATE_SEL : integer := 3;  -- Width of baud rate select
			DATA_BIT_SEL  : integer := 2;  -- Width of data bit number select
			LCD_BUS_WIDTH : integer := 4;  -- Width of LCD interface
			DATA_WIDTH    : integer := 8	 -- Data widht 
		 );
		 Port ( iCLK        		 : in    std_logic;													-- External clock 24MHz
				  inRST       		 : in    std_logic;												 	-- Reset signal 
				  iPARITY_EN_SW	 : in    std_logic;													-- Parity mode signal from switch
				  iPARITY_SW		 : in    std_logic;													-- Parity enable signal from switch	
				  iHANDSHAKE_EN_SW : in    std_logic;													-- Handshake enable signal form swith
				  iDATA_BIT_SW		 : in    std_logic_vector(DATA_BIT_SEL  - 1 downto 0);	-- Data bit mode signal from switches
				  iBAUD_SW			 : in    std_logic_vector(BAUD_RATE_SEL - 1 downto 0);	-- Baud rate mode from switches
				  iCTS				 : in    std_logic;													-- Clear to send signal
				  iRX         		 : in    std_logic;													-- RX UART signal 														
				  oLCD_E 	   	 : out   std_logic;													-- LCD display enable signal
				  oLCD_RS    	  	 : out   std_logic;													-- LCD display register select signal
				  oLCD_RW   		 : out   std_logic;													-- LCD display read-write operation signal
				  oTX         		 : out   std_logic;													-- TX UART signal
				  oRTS				 : out   std_logic;													-- Request to send signal
				  oLED				 : out   std_logic_vector(7 downto 0);							-- LED control
				  oSCL		   	 : out   std_logic;													-- SCL signal
				  ioSDA		   	 : inout std_logic;													-- SDA signal
				  ioLCD_D 		  	 : inout std_logic_vector(LCD_BUS_WIDTH - 1 downto 0));	-- LCD display data signal
	end uart_i2c_bridge;
	
	component i2c_slave is
		 Generic(
				REGISTER_NUM		 		: integer := 16;  										 -- Number of slave registers
				TC_PERIOD			 		: integer := 13;  										 -- Terminal count period for ack start
				TR_PERIOD			 		: integer := 17;  										 -- Slave transmission peirod
				REP_START_PERIOD 			: integer := 9;											 -- Repeated start period
				DATA_WIDTH 			 		: integer := 8; 											 -- Data width
				DATA_CNT_WIDTH 	 		: integer := 4;											 -- Data counter width
				PERIOD_CNT_WIDTH   		: integer := 4;											 -- Period counter width
				RSTART_PERIOD_CNT_WIDTH : integer := 4;									 		 -- Repeat start period counter width
				TR_PERIOD_CNT_WIDTH  	: integer := 5;											 -- Transmission period counter width
				REGISTER_SEL_WIDTH 		: integer := 4; 											 -- Decoder selection width
				SLAVE_ADDRESS  	 		: std_logic_vector(6 downto 0) := "0110001"      -- Slave address (7 bit address)
			 );	
		 Port( iCLK 	: in  	std_logic;														 -- Clock signal 50MHz
				 inRST 	: in  	std_logic;														 -- Reset signal
				 iSCL 	: in  	std_logic;														 -- SCL signal
				 ioSDA   : inout  std_logic);														 -- SDA signal
	end component;	


end i2c_via_uart_components;

