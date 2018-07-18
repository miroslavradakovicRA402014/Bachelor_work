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
	
	component uart_i2c_bridge is
		 Generic (
			BAUD_RATE_SEL : integer := 3;  -- Width of baud rate select
			DATA_BIT_SEL  : integer := 2;  -- Width of data bit number select
			LCD_BUS_WIDTH : integer := 4;  -- Width of LCD interface
			DATA_WIDTH    : integer := 8	 -- Data width 
		 );
		 Port( iCLK        		 : in    std_logic;													-- Clock signal 50MHz
				 inRST       		 : in    std_logic;												 	-- Reset signal 
				 iPARITY_EN_SW		 : in    std_logic;													-- Parity mode signal from switch
				 iPARITY_SW		 	 : in    std_logic;													-- Parity enable signal from switch	
				 iHANDSHAKE_EN_SW  : in    std_logic;													-- Handshake enable signal form swith
				 iDATA_BIT_SW		 : in    std_logic_vector(DATA_BIT_SEL  - 1 downto 0);	-- Data bit mode signal from switches
				 iBAUD_SW			 : in    std_logic_vector(BAUD_RATE_SEL - 1 downto 0);	-- Baud rate mode from switches
				 iCTS				 	 : in    std_logic;													-- Clear to send signal
				 iRX         		 : in    std_logic;													-- RX UART signal 
				 oLCD_SLAVE_ADDR	 : out   std_logic_vector(DATA_WIDTH - 1 downto 0);		-- LCD display driver slave address data
				 oLCD_REG_ADDR	 	 : out   std_logic_vector(DATA_WIDTH - 1 downto 0); 		-- LCD display driver register address data
				 oLCD_DATA_BYTE	 : out   std_logic_vector(DATA_WIDTH - 1 downto 0);		-- LCD display driver data byte 
				 oLCD_BYTE_NUM	 	 : out   std_logic_vector(DATA_WIDTH - 1 downto 0);		-- LCD display driver data byte number data 
				 oLCD_MODE			 : out   std_logic;													-- LCD display driver mode data
				 oLCD_READ_VALID	 : out   std_logic;													-- LCD display driver read valid
				 oLCD_DATA_EN		 : out   std_logic;													-- LCD display driver data enable
				 oLCD_BYTE_EN		 : out   std_logic;													-- LCD display driver data byte enable			  
				 oTX         		 : out   std_logic;													-- TX UART signal
				 oRTS				 	 : out   std_logic;													-- Request to send signal
				 oSCL		   	 	 : out   std_logic;													-- SCL signal
				 ioSDA		   	 : inout std_logic);													-- SDA signal
	end component;
	
	component i2c_slave is
		 Generic(
			REGISTER_NUM		 		: integer := 16;  										 -- Number of slave registers
			TC_PERIOD			 		: integer := 12;  										 -- Terminal count period for ack start
			TR_PERIOD			 		: integer := 16;  										 -- Slave transmission peirod
			REP_START_PERIOD 			: integer := 8;											 -- Repeated start period
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
	
	component lcd_driver is
		 Generic(
			INIT_SEQ_NUMBER 	 	: integer := 4;		  -- Init commands sequence
			CMD_SEQ_NUMBER  	 	: integer := 3;		  -- Command of 4-bit sequence number
			CMD_PERIOD_CNT_WIDTH : integer := 2;		  -- Command period counter width
			DATA_BYTE_CNT_WIDTH	: integer := 3;		  -- Byte enable counter 
			SEQ_CNT_WIDTH 		 	: integer := 3;		  -- Sequence command widht
			LCD_BUS_WIDTH	 	 	: integer := 4;		  -- LCD controler interface width 
			DATA_WIDTH		 	 	: integer := 8;		  -- Input data width
			CHAR_WIDTH   		 	: integer := 8;		  -- Data character width	
			CHAR_NUMBER_WIDTH		: integer := 6;		  -- Char number width
			INIT_PERIOD 		 	: integer := 2160000;  -- Clock cycles number for 45ms period
			CMD_SEQ_PERIOD 	 	: integer := 12000;	  -- Clock cycles number for 250us period		
			CHAR_NUMBER 	 	 	: integer := 22  	  	  -- Number of characters without data characters
		 );
		 Port( iCLK   	  	  : in 		std_logic;												 -- Clock signal 50MHz
				 inRST  	  	  : in 		std_logic;												 -- Reset signal
				 iSLAVE_ADDR  : in 		std_logic_vector(DATA_WIDTH - 1 downto 0);	 -- Slave address
				 iREG_ADDR    : in 		std_logic_vector(DATA_WIDTH - 1 downto 0);    -- Slave register address
				 iDATA_BYTE   : in  		std_logic_vector(DATA_WIDTH - 1 downto 0); 	 -- Data byte
				 iBYTE_NUM    : in 		std_logic_vector(DATA_WIDTH - 1 downto 0); 	 -- Data byte number 
				 iMODE 		  : in		std_logic;												 -- Mode R/W signal
				 iREAD_VALID  : in		std_logic;												 -- Read operation valid signal
				 iDATA_EN	  : in 		std_logic;												 -- Data enable signal
				 iBYTE_EN	  : in      std_logic;												 -- Data byte enable signal
				 oE 	   	  : out 		std_logic;												 -- LCD display enable control signal
				 oRS    	  	  : out		std_logic;												 -- LCD display register select control signal
				 oRW   		  : out 		std_logic;												 -- LCD display read-write control signal
				 ioD 		  	  : inout   std_logic_vector(LCD_BUS_WIDTH - 1 downto 0));-- LCD display data
	end component;	

end i2c_via_uart_components;

