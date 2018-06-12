library IEEE;
use IEEE.STD_LOGIC_1164.all;


package i2c_bus_components is

	-- I2C bus components declaration
	
	component uart_i2c_master is
		 Generic (
			REGISTER_NUM		   : integer := 4;	-- Number of register
			DATA_BYTE_NUM		   : integer := 2;	-- Nmber of data bytes
			START_PERIOD		   : integer := 5;   -- Master start sync peirod
			TC_PERIOD			   : integer := 13;  -- Terminal count period 
			TR_PERIOD			   : integer := 17;  -- Master transmission peirod
			REGISTER_SEL_WIDTH   : integer := 2;	-- Register mux and decoder select widht
			DATA_WIDTH 			   : integer := 8;	-- UART word widht 
			DATA_CNT_WIDTH 	   : integer := 4;   -- Data counter width
			START_CNT_WIDTH 	   : integer := 3;   -- Start period counter width
			BYTE_CNT_WIDTH 	   : integer := 2;   -- Byte counter width
			TR_PERIOD_CNT_WIDTH  : integer := 5;	-- Transmisssion period counter width
			PERIOD_CNT_WIDTH     : integer := 4;	-- Period counter width
			LCD_BUS_WIDTH 			: integer := 4		-- Width of LCD interface	
		 );
		 Port ( iCLK  		   : in 	  std_logic;
				  inRST 		   : in 	  std_logic;
				  iTC 		   : in 	  std_logic;
				  iUART_FULL   : in 	  std_logic; 
				  iUART_EMPTY  : in    std_logic;
				  iUART_DATA   : in 	  std_logic_vector(DATA_WIDTH - 1  downto 0);
				  oFREQ_EN 		: out   std_logic;		
				  oUART_READ   : out   std_logic;
				  oUART_WRITE  : out   std_logic;
				  oUART_DATA   : out   std_logic_vector(DATA_WIDTH - 1  downto 0);
				  oSCL		   : out   std_logic;
				  oLCD_E 	   : out   std_logic;
				  oLCD_RS    	: out   std_logic;
				  oLCD_RW      : out   std_logic;			  
				  ioSDA		   : inout std_logic;
				  ioLCD_D 		: inout std_logic_vector(LCD_BUS_WIDTH - 1 downto 0));
	end component;
	
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
				SLAVE_ADDRESS  	 		: std_logic_vector(6 downto 0) := "1111101"      -- Slave address (7 bit address)
			 );	
		 Port ( iCLK 	: in  	std_logic;
				  inRST 	: in  	std_logic;
				  iTC		: in 		std_logic;
				  iSCL 	: in  	std_logic;
				  ioSDA  : inout  std_logic);
	end component;	
 
	component i2c_clk_freq_div is
		 Generic (
			CLK_FREQUENCY : integer := 24000000; -- Clock frequency	
			CLK_CNT_WIDTH : integer := 4	 		 -- Width of clock counter
		 );
		 Port ( iCLK  		: in  std_logic;
				  inRST 		: in  std_logic;
				  iFREQ_EN	: in  std_logic;
				  oTC   		: out std_logic);
	end component; 
	
end i2c_bus_components;
