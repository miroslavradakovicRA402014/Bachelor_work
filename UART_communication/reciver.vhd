----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:05 04/13/2018 
-- Design Name: 
-- Module Name:    reciver - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reciver is
	 Generic (
		DATA_WIDTH 		 : integer := 8;  -- Data bit number
		START_TC_PERIOD : integer := 8;  -- Start terminal count period for oversampling
		TC_PERIOD  		 : integer := 16; -- Terminal count period for oversampling
		DATA_CNT_WIDTH  : integer := 3;  -- Width of data bit counter
		TC_CNT_WIDTH	 : integer := 4;  -- Width of terminal count counter
		DATA_BIT_SEL	 : integer := 2   -- Width of data bit number select
	 );
    Port ( iCLK        : in   std_logic;
           inRST       : in   std_logic;
			  iPARITY_EN  : in   std_logic;
			  iPARITY     : in   std_logic;
			  iDATA_SEL   : in   std_logic_vector(DATA_BIT_SEL - 1  downto 0);
           iRX         : in   std_logic;
           iTC         : in   std_logic;
           iFULL 	     : in   std_logic;
			  oBAUD_EN    : out  std_logic;
           oDATA 	     : out  std_logic_vector(DATA_WIDTH   - 1 downto 0);
           oRX_DONE    : out  std_logic);
end reciver;

architecture Behavioral of reciver is

	constant cWRONG_DATA		 : std_logic_vector(DATA_WIDTH - 1 downto 0) := x"2D";									-- Wrong parity character
	
	-- Data counter count limit
	constant cDATA_5_BIT     : unsigned(DATA_CNT_WIDTH - 1 downto 0) := "100";		
	constant cDATA_6_BIT     : unsigned(DATA_CNT_WIDTH - 1 downto 0) := "101";
	constant cDATA_7_BIT     : unsigned(DATA_CNT_WIDTH - 1 downto 0) := "110";
	constant cDATA_8_BIT     : unsigned(DATA_CNT_WIDTH - 1 downto 0) := "111";

	type tSTATES is (IDLE, START, DATA, PARITY, STOP); 							     								 		-- Reciver FSM state type

	signal sCURRENT_STATE 	 	: tSTATES; 										  			  								 		-- Reciver FSM current state 
	signal sNEXT_STATE    	 	: tSTATES;	   						      	  			 							 		-- Reciver FSM next state 
	
	signal sDATA_CNT      	 	: unsigned(DATA_CNT_WIDTH - 1 downto 0);   			  							 		-- Recived data bits counter 
	signal sDATA_BIT_REG			: unsigned(DATA_CNT_WIDTH - 1	downto 0);											 		-- Data bit number register
	signal sDATA_BIT				: unsigned(DATA_CNT_WIDTH - 1	downto 0);											 		-- Data bit number 
	signal sTC_CNT        	 	: unsigned(TC_CNT_WIDTH   - 1 downto 0);	  			  							 		-- Terminal count counter
	
	signal sTC_CNT_RST       	: std_logic;	  			  																 -- Terminal count counter reset
	
	signal sSHW_REG 		 	 	: std_logic_vector(DATA_WIDTH downto 0);   	 		  							 -- Shift register for recived data

	signal sDATA_CNT_EN 		 	: std_logic;										  			  							 -- Data counter enable
	signal sTC_CNT_EN 		 	: std_logic;										  			 	  						 -- Terminal count counter enable
	signal sSHW_EN				 	: std_logic;										  			  							 -- Shifter enable
	signal sDATA_BIT_EN			: std_logic;																				 -- Enable signal for data bit register

	signal sSTART_TC_CNT_DONE 	: std_logic;										  			  							 -- Start terminal count counter count done
	signal sTC_CNT_DONE 		 	: std_logic;										  			  							 -- Terminal count counter count done
	
	signal sPARITY_OK 		 	: std_logic;													  							 -- Parity check signal
		 
begin

	-- FSM state register process
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then 
			sCURRENT_STATE <= IDLE; -- Reset FSM
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE; -- Move to next state
		end if;
	end process fsm_reg;

	-- Reciver FSM next state logic
	fsm_next : process (sCURRENT_STATE, iRX, iPARITY_EN, sSTART_TC_CNT_DONE, sTC_CNT_DONE, sDATA_CNT, sDATA_BIT_REG) begin
		case (sCURRENT_STATE) is 
			when IDLE   =>
				-- Wait for RX 
				if (iRX = '0') then 
					sNEXT_STATE <= START; -- Get for start bit
				else 
					sNEXT_STATE <= IDLE;
				end if;
			when START  =>
				-- Check if sampling period done
				if (sSTART_TC_CNT_DONE = '1') then
					sNEXT_STATE <= DATA; -- Get for data bits
			   else
					sNEXT_STATE <= START;
				end if;
			when DATA   =>
				-- Check if all data bits recived
				if (sDATA_CNT = sDATA_BIT_REG and sTC_CNT_DONE = '1') then
					if (iPARITY_EN = '1') then
						sNEXT_STATE <= PARITY; -- Get for parity bit
					else
						sNEXT_STATE <= STOP; -- Skip parity bit
					end if;	
				else 
					sNEXT_STATE <= DATA;
				end if;
			when PARITY =>
				-- Check if sampling period done
				if (sTC_CNT_DONE = '1') then
					sNEXT_STATE <= STOP; -- Get for stop bit
			   else
					sNEXT_STATE <= PARITY;
				end if;
			when STOP   =>
				-- Check if sampling period done 
				if (sTC_CNT_DONE = '1') then
					sNEXT_STATE <= IDLE; -- Recive next data 
			   else
					sNEXT_STATE <= STOP;
				end if;			
		end case;
	end process fsm_next;

	-- Reciver FSM output logic
	fsm_out : process (sCURRENT_STATE, iFULL, sSTART_TC_CNT_DONE, sTC_CNT_DONE) begin
		case (sCURRENT_STATE) is
			when IDLE   =>
				sTC_CNT_EN	 <= '0';
				sTC_CNT_RST  <= '0';
				sDATA_BIT_EN <= '1';
				sDATA_CNT_EN <= '0';
				sSHW_EN		 <= '0';
				oBAUD_EN 	 <= '1';
				oRX_DONE 	 <= '0';
			when START  =>	
				sTC_CNT_EN	 <= '1';
				if (sSTART_TC_CNT_DONE = '1') then
					sTC_CNT_RST  <= '1'; -- Reset counter
			   else
					sTC_CNT_RST  <= '0';
				end if;			
				sDATA_BIT_EN <= '0';
				sDATA_CNT_EN <= '0';
				sSHW_EN		 <= '0';
				oBAUD_EN 	 <= '0';
				oRX_DONE 	 <= '0';			
			when DATA   =>	
				sTC_CNT_EN	 <= '1';
				sTC_CNT_RST	 <= '0';
				sDATA_BIT_EN <= '0';
				sDATA_CNT_EN <= '1';
				sSHW_EN		 <= '1';
				oBAUD_EN 	 <= '0';
				oRX_DONE 	 <= '0';
			when PARITY =>
				sTC_CNT_EN	 <= '1';
				sTC_CNT_RST	 <= '0';
				sDATA_BIT_EN <= '0';
				sDATA_CNT_EN <= '0';
				sSHW_EN		 <= '1';
				oBAUD_EN 	 <= '0';
				oRX_DONE 	 <= '0';			
			when STOP   =>	
				sTC_CNT_EN	 <= '1';
				sTC_CNT_RST	 <= '0';
				sDATA_BIT_EN <= '0';
				sDATA_CNT_EN <= '0';	
				sSHW_EN		 <= '0';
				oBAUD_EN 	 <= '0';
				if (iFULL = '0' and sTC_CNT_DONE = '1') then -- FIFO is not full, store to it
					oRX_DONE  <= '1';
				else 
					oRX_DONE  <= '0';
				end if;	
		end case;		
	end process fsm_out;
	
	-- Terminal count counter process
	tc_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sTC_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sTC_CNT_RST = '1' or sTC_CNT = TC_PERIOD - 1) then -- Check counted periods 
				sTC_CNT <= (others => '0'); 
			elsif (iTC = '1' and sTC_CNT_EN = '1') then -- Check for counter enable
				sTC_CNT <= sTC_CNT + 1; -- Count terminal counts 
			end if;		
		end if;
	end process tc_cnt;
	
	-- Terminal count done for start bit
	sSTART_TC_CNT_DONE <= '1' when sTC_CNT = START_TC_PERIOD - 1 else
								 '0';
	
	-- Terminal count done statement
	sTC_CNT_DONE <= '1' when sTC_CNT = TC_PERIOD - 1 else 
						 '0';
						 
	-- Data bits counter process
	data_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sDATA_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sDATA_CNT = sDATA_BIT_REG and sTC_CNT_DONE = '1') then -- Reset counter if all bits was sent
				sDATA_CNT <= (others => '0');
			elsif (sDATA_CNT_EN = '1' and sTC_CNT_DONE = '1') then -- Check for enable signal and for terminal count counter
				sDATA_CNT <= sDATA_CNT + 1; -- Count data bits			
			end if;
		end if;
	end process data_cnt;
	
	-- Shift register process
	shift_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sSHW_REG <= (others => '0'); -- Reset shifter
		elsif (iCLK'event and iCLK = '1') then
			if (sSHW_EN = '1' and sTC_CNT_DONE = '1') then -- Check for shift enable
				sSHW_REG <= iRX & sSHW_REG(DATA_WIDTH downto 1); -- Shift data bits		
			end if;
		end if;
	end process shift_reg;
	
	-- Data bit number register
	data_bit_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sDATA_BIT_REG <= cDATA_8_BIT;  -- Set to default bit number
		elsif (iCLK'event and iCLK = '1') then	
			if (sDATA_BIT_EN = '1') then
				sDATA_BIT_REG <= sDATA_BIT; -- Set data bit number
			end if;
		end if;
	end process data_bit_reg;
	
	-- Baud data bit signal generator
	data_bit : process (iDATA_SEL) begin
		-- Generate data bits depend on input configurarion
		case (iDATA_SEL) is
			when "00"   =>
				sDATA_BIT <= cDATA_5_BIT;
			when "01"   =>
				sDATA_BIT <= cDATA_6_BIT;
			when "10"   =>
				sDATA_BIT <= cDATA_7_BIT;
			when others =>
				sDATA_BIT <= cDATA_8_BIT;
		end case;
	end process data_bit;
	

	-- Parity check signal generator
	parity_gen : process (sSHW_REG, iPARITY, sDATA_BIT_REG) begin
		-- Generate parity bit depend on data bit number
		case (sDATA_BIT_REG) is
			when cDATA_5_BIT =>
				-- Check parity input
				if (iPARITY = '1') then
					sPARITY_OK <= not ( not ((sSHW_REG(3) xor sSHW_REG(4) xor sSHW_REG(5) xor sSHW_REG(6) xor sSHW_REG(7))) xor sSHW_REG(8)); -- Odd parity 
				else
					sPARITY_OK <= not (		 (sSHW_REG(3) xor sSHW_REG(4) xor sSHW_REG(5) xor sSHW_REG(6) xor sSHW_REG(7))  xor sSHW_REG(8)); -- Even parity
				end if;
			when cDATA_6_BIT =>	
				-- Check parity input
				if (iPARITY = '1') then
					sPARITY_OK <= not ( not ((sSHW_REG(2) xor sSHW_REG(3) xor sSHW_REG(4) xor sSHW_REG(5) xor sSHW_REG(6) xor sSHW_REG(7))) xor sSHW_REG(8)); -- Odd parity 
				else
					sPARITY_OK <= not (		 (sSHW_REG(2) xor sSHW_REG(3) xor sSHW_REG(4) xor sSHW_REG(5) xor sSHW_REG(6) xor sSHW_REG(7))  xor sSHW_REG(8)); -- Even parity
				end if;							
			when cDATA_7_BIT =>		
				-- Check parity input
				if (iPARITY = '1') then
					sPARITY_OK <= not ( not ((sSHW_REG(1) xor sSHW_REG(2) xor sSHW_REG(3) xor sSHW_REG(4) xor sSHW_REG(5) xor sSHW_REG(6) xor sSHW_REG(7))) xor sSHW_REG(8)); -- Odd parity 
				else
					sPARITY_OK <= not (		 (sSHW_REG(1) xor sSHW_REG(2) xor sSHW_REG(3) xor sSHW_REG(4) xor sSHW_REG(5) xor sSHW_REG(6) xor sSHW_REG(7))  xor sSHW_REG(8)); -- Even parity
				end if;			
			when others 	  =>
				-- Check parity input
				if (iPARITY = '1') then
					sPARITY_OK <= not ( not ((sSHW_REG(0) xor sSHW_REG(1) xor sSHW_REG(2) xor sSHW_REG(3) xor sSHW_REG(4) xor sSHW_REG(5) xor sSHW_REG(6) xor sSHW_REG(7)) xor sSHW_REG(8))); -- Odd parity 
				else
					sPARITY_OK <= not (		 (sSHW_REG(0) xor sSHW_REG(1) xor sSHW_REG(2) xor sSHW_REG(3) xor sSHW_REG(4) xor sSHW_REG(5) xor sSHW_REG(6) xor sSHW_REG(7)) xor sSHW_REG(8)); -- Even parity
				end if;								
		end case;
	end process parity_gen;
	
	
	-- Reciver data output
	oDATA <=		     sSHW_REG(DATA_WIDTH - 1 downto 0) when (not (iPARITY_EN = '1') or sPARITY_OK = '1') and sDATA_BIT_REG = cDATA_8_BIT and iPARITY_EN = '1' else
						  sSHW_REG(DATA_WIDTH     downto 1) when (not (iPARITY_EN = '1') or sPARITY_OK = '1') and sDATA_BIT_REG = cDATA_8_BIT and iPARITY_EN = '0' else
				'0'   & sSHW_REG(DATA_WIDTH - 1 downto 1) when (not (iPARITY_EN = '1') or sPARITY_OK = '1') and sDATA_BIT_REG = cDATA_7_BIT and iPARITY_EN = '1' else
				'0'   & sSHW_REG(DATA_WIDTH     downto 2) when (not (iPARITY_EN = '1') or sPARITY_OK = '1') and sDATA_BIT_REG = cDATA_7_BIT and iPARITY_EN = '0' else
				"00"  & sSHW_REG(DATA_WIDTH - 1 downto 2) when (not (iPARITY_EN = '1') or sPARITY_OK = '1') and sDATA_BIT_REG = cDATA_6_BIT and iPARITY_EN = '1' else
				"00"  & sSHW_REG(DATA_WIDTH     downto 3) when (not (iPARITY_EN = '1') or sPARITY_OK = '1') and sDATA_BIT_REG = cDATA_6_BIT and iPARITY_EN = '0' else
				"000" & sSHW_REG(DATA_WIDTH - 1 downto 3) when (not (iPARITY_EN = '1') or sPARITY_OK = '1') and sDATA_BIT_REG = cDATA_5_BIT and iPARITY_EN = '1' else
				"000" & sSHW_REG(DATA_WIDTH     downto 4) when (not (iPARITY_EN = '1') or sPARITY_OK = '1') and sDATA_BIT_REG = cDATA_5_BIT and iPARITY_EN = '0' else
				cWRONG_DATA;
	
end Behavioral;

