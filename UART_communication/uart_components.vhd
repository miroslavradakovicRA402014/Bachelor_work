library IEEE;
use IEEE.STD_LOGIC_1164.all;

package uart_components is

	-- UART components declaration
	
	component baud_freq_div is
		 Generic (
			CLK_FREQUENCY 	: integer := 50000000;	 -- Clock frequency MHz
			BAUD_RATE_SEL	: integer := 3;		 	 -- Num of baud rate select bits
			CLK_CNT_WIDTH  : integer := 11		    -- Width of clock counter
		 );
		 Port ( iCLK   	: in  std_logic;							-- Clock signal 50MHz
				  inRST  	: in  std_logic;							-- Reset signal
				  iBAUD_SEL : in  std_logic_vector(2 downto 0); -- Baud rate mode selection
				  iBAUD_EN  : in  std_logic;							-- Baud rate mode change enable
				  oTC 		: out std_logic);							-- Terminal count for one period
	end component baud_freq_div;	

	component reciver is
		 Generic (
			DATA_WIDTH 		 : integer := 8;  -- Data bit number
			START_TC_PERIOD : integer := 8;  -- Start terminal count period for oversampling
			TC_PERIOD  		 : integer := 16; -- Terminal count period for oversampling
			DATA_CNT_WIDTH  : integer := 3;  -- Width of data bit counter
			TC_CNT_WIDTH	 : integer := 4;  -- Width of terminal count counter
			DATA_BIT_SEL	 : integer := 2
		 );
		 Port ( iCLK        : in   std_logic;												-- Clock signal 50MHz	
				  inRST       : in   std_logic;												-- Reset signal
				  iPARITY_EN  : in   std_logic;												-- Parity enable signal
				  iPARITY     : in   std_logic;												-- Parity mode signal
				  iDATA_SEL   : in   std_logic_vector(1 downto 0);						-- Data bits mode
				  iRX         : in   std_logic;												-- RX signal
				  iTC         : in   std_logic;												-- Terminal count
				  iFULL 	     : in   std_logic;												-- FIFO full indication
				  oBAUD_EN    : out  std_logic;												-- Baud register enable
				  oRTS		  : out  std_logic;												-- Request to send signal
				  oDATA 	     : out  std_logic_vector(DATA_WIDTH  - 1 downto 0);	-- Data output 
				  oRX_DONE    : out  std_logic);												-- Data reciving done
	end component reciver;
	
	component transmitter is
		 Generic (
			DATA_WIDTH 		 : integer := 8;  -- Data bit number
			TC_PERIOD  		 : integer := 16; -- Terminal count period for oversampling
			DATA_CNT_WIDTH  : integer := 3;  -- Width of data bit counter
			TC_CNT_WIDTH	 : integer := 4;  -- Width of terminal count counter
			DATA_BIT_SEL	 : integer := 2	-- Width of data bit number select
		 );
		 Port ( iCLK 		 	 : in   std_logic;												-- Clock signal 50MHz
				  inRST  	 	 : in   std_logic;												-- Reset signal 
				  iPARITY_EN 	 : in   std_logic;												-- Parity enable signal
				  iPARITY	 	 : in   std_logic;												-- Parity mode signal
				  iHANDSHAKE_EN : in   std_logic;												-- Handshaking enable signal
				  iDATA_SEL  	 : in   std_logic_vector(1 downto 0);						-- Data bits select 
				  iCTS		 	 : in   std_logic;												-- Clear to send signal 
				  iTC    	 	 : in   std_logic;												-- Terminal count from clock divider
				  iDATA  	 	 : in   std_logic_vector(DATA_WIDTH - 1 downto 0);  	-- Input data
				  iSTART 	 	 : in   std_logic;											 	--	Transaction start signal
				  oTX_READY  	 : out  std_logic;												-- Transmitter ready
				  oTX    	 	 : out  std_logic);												-- TX ready signal
		end component transmitter;

	component fifo is
		 Generic (
			DATA_WIDTH   : integer := 8; -- Widht of FIFO word
			NUM_OF_WORDS : integer := 4  -- Number of FIFO locations (as 2^n where n is, NUM_OF_WORDS)
		 );
		 Port ( iCLK    : in  std_logic;												-- Clock signal 50MHz
				  inRST   : in  std_logic;												-- Reset signal
				  iDATA   : in  std_logic_vector(DATA_WIDTH - 1 downto 0);	-- Data input 
				  iWR     : in  std_logic;												-- Write to FIFO signal
				  iRD     : in  std_logic;												-- Read from FIFO signal
				  oFULL   : out std_logic;												-- FIFO full indication
				  oEMPTY  : out std_logic;												-- FIFO empty indication
				  oDATA   : out std_logic_vector(DATA_WIDTH - 1 downto 0)); -- Output data
	end component;	

end uart_components;


