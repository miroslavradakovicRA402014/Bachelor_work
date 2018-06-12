library IEEE;
use IEEE.STD_LOGIC_1164.all;

package i2c_via_uart_components is

	-- I2C via UART components
	
	-- I2C bus
	component i2c_bus is
		 Generic (
			DATA_WIDTH 			: integer := 8;	 -- UART word widht 
			LCD_BUS_WIDTH 		: integer := 4		 -- Width of LCD interface	
		 );
		 Port ( iCLK  		   : in 	  std_logic;
				  inRST 		   : in 	  std_logic;
				  iUART_FULL   : in 	  std_logic; 
				  iUART_EMPTY  : in    std_logic;
				  iUART_DATA   : in 	  std_logic_vector(DATA_WIDTH - 1  downto 0);		
				  oUART_READ   : out   std_logic;
				  oUART_WRITE  : out   std_logic;
				  oUART_DATA   : out   std_logic_vector(DATA_WIDTH - 1  downto 0);
				  oLCD_E 	   : out   std_logic;
				  oLCD_RS    	: out   std_logic;
				  oLCD_RW      : out   std_logic;
				  ioLCD_D 		: inout std_logic_vector(LCD_BUS_WIDTH - 1 downto 0));
	end component;
	
	-- UART
	component uart is
		 Generic (
			BAUD_RATE_SEL : integer := 3;  -- Width of baud rate select
			DATA_BIT_SEL  : integer := 2;  -- Width of data bit number select
			DATA_WIDTH    : integer := 8	 -- Data widht 
		 );
		 Port ( iCLK        		 : in   std_logic;
				  inRST       		 : in   std_logic;
				  iPARITY_EN		 : in   std_logic;
				  iPARITY			 : in   std_logic;
				  iHANDSHAKE_EN    : in   std_logic;
				  iDATA_SEL			 : in   std_logic_vector(DATA_BIT_SEL  - 1 downto 0);
				  iBAUD_SEL			 : in   std_logic_vector(BAUD_RATE_SEL - 1 downto 0);
				  iCTS				 : in   std_logic;
				  iRX         		 : in   std_logic;
				  iUART_DATA		 : in   std_logic_vector(DATA_WIDTH 	- 1 downto 0);
				  iUART_WR 			 : in	  std_logic;
				  iUART_RD    		 : in   std_logic;
				  oTX         		 : out  std_logic;
				  oRTS				 : out  std_logic;
				  oUART_FULL       : out  std_logic;
				  oUART_EMPTY      : out  std_logic;
				  oUART_DATA       : out  std_logic_vector(DATA_WIDTH - 1 downto 0));
	end component;	


end i2c_via_uart_components;

