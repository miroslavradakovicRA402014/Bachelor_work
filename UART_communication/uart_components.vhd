--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package uart_components is

	-- UART components declaration
	
	component baud_freq_div is
		 Generic (
			CLK_PERIOD_NUM : integer := 156; -- Number of clock periods
			CLK_CNT_WIDTH  : integer := 8		-- Width of clock counter
		 );
		 Port ( iCLK   : in  std_logic;
				  inRST  : in  std_logic;
				  oTC 	: out std_logic);
	end component baud_freq_div;	

	component reciver is
		 Generic (
			DATA_WIDTH 		: integer := 8;  -- Data bit number
			TC_PERIOD  		: integer := 16; -- Terminal count period for oversampling
			DATA_CNT_WIDTH : integer := 4;  -- Width of data bit counter
			TC_CNT_WIDTH	: integer := 4   -- Width of terminal count counter
		 );
		 Port ( iCLK     : in   std_logic;
				  inRST    : in   std_logic;
				  iRX      : in   std_logic;
				  iTC      : in   std_logic;
				  iFULL 	  : in   std_logic;
				  oDATA 	  : out  std_logic_vector(DATA_WIDTH - 1 downto 0);
				  oRX_DONE : out  std_logic);
	end component reciver;
	
	component transmitter is
		 Generic (
			DATA_WIDTH 		: integer := 8;  -- Data bit number
			TC_PERIOD  		: integer := 16; -- Terminal count period for oversampling
			DATA_CNT_WIDTH : integer := 4;  -- Width of data bit counter
			TC_CNT_WIDTH	: integer := 4   -- Width of terminal count counter
		 );
		 Port ( iCLK 		 : in   std_logic;
				  inRST  	 : in   std_logic;
				  iTC    	 : in   std_logic;
				  iDATA  	 : in   std_logic_vector (7 downto 0);
				  iSTART 	 : in   std_logic;
				  oTX_READY  : out  std_logic;
				  oTX    	 : out  std_logic);
	end component transmitter;

	component fifo is
		 Generic (
			DATA_WIDTH   : integer := 8; -- Widht of FIFO word
			NUM_OF_WORDS : integer := 16 -- Number of FIFO locations
		 );
		 Port ( iCLK   : in  std_logic;
				  inRST  : in  std_logic;
				  iDATA  : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
				  iWR    : in  std_logic;
				  iRD    : in  std_logic;
				  oFULL  : out std_logic;
				  oEMPTY : out std_logic;
				  oDATA  : out std_logic_vector(DATA_WIDTH - 1 downto 0));
	end component;	

end uart_components;


