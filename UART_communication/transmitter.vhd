----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:03:15 04/17/2018 
-- Design Name: 
-- Module Name:    transmitter - Behavioral 
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

entity transmitter is
	 Generic (
		DATA_WIDTH 		: integer := 8;  -- Data bit number
		TC_PERIOD  		: integer := 16; -- Terminal count period for oversampling
		DATA_CNT_WIDTH : integer := 3;  -- Width of data bit counter
		TC_CNT_WIDTH	: integer := 4   -- Width of terminal count counter
	 );
    Port ( iCLK 		 : in   std_logic;
           inRST  	 : in   std_logic;
           iTC    	 : in   std_logic;
           iDATA  	 : in   std_logic_vector (DATA_WIDTH - 1 downto 0);
           iSTART 	 : in   std_logic;
			  oTX_READY  : out  std_logic;
           oTX    	 : out  std_logic);
end transmitter;

architecture Behavioral of transmitter is

	type tSTATES is (IDLE, START, DATA, PARITY, STOP); 							-- Reciver FSM state type

	signal sCURRENT_STATE 	 : tSTATES; 										  		-- Reciver FSM current state 
	signal sNEXT_STATE    	 : tSTATES;	   						      	  		-- Reciver FSM next state
	
	signal sDATA_CNT      	 : unsigned(DATA_CNT_WIDTH - 1 downto 0);   		-- Recived data bits counter 
	signal sTC_CNT        	 : unsigned(TC_CNT_WIDTH   - 1 downto 0);	  		-- Terminal count counter
	
   signal sSHW_REG 		 	 : std_logic_vector(DATA_WIDTH - 1 downto 0);   -- Shift register
	
	signal sDATA_CNT_EN 		 : std_logic;										  		-- Data counter enable
	signal sTC_CNT_EN 		 : std_logic;										  		-- Terminal count counter enable
	signal sSHW_EN				 : std_logic;										  		-- Shifter enable

	signal sTC_CNT_DONE 		 : std_logic;										  		-- Terminal count counter count done	
	
	signal sDATA_LOAD		    : std_logic;										 		-- Registers data load signal
	
	signal sPARITY_REG 		 : std_logic_vector(DATA_WIDTH - 1 downto 0);	-- Parity register
	signal sPARITY				 : std_logic;												-- Odd parity
	
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
	fsm_next : process (sCURRENT_STATE, iSTART, sTC_CNT_DONE, sDATA_CNT) begin
		case (sCURRENT_STATE) is 
			when IDLE   =>
				-- Wait for FIFO 
				if (iSTART = '1') then 
					sNEXT_STATE <= START; -- Get for start bit
				else 
					sNEXT_STATE <= IDLE;
				end if;
			when START  =>
				-- Check if sampling period done
				if (sTC_CNT_DONE = '1') then
					sNEXT_STATE <= DATA; -- Get for data bits
			   else
					sNEXT_STATE <= START;
				end if;
			when DATA   =>
				-- Check if all data bits sent
				if (sDATA_CNT = DATA_WIDTH - 1 and sTC_CNT_DONE = '1') then
					sNEXT_STATE <= PARITY; -- Get for stop bit  
				else 
					sNEXT_STATE <= DATA;
				end if;
			when PARITY =>
				-- Check if sampling period done 
				if (sTC_CNT_DONE = '1') then
					sNEXT_STATE <= STOP; -- Recive stop bit
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
	fsm_out: process (sCURRENT_STATE, sSHW_REG(0), sPARITY, sTC_CNT_DONE) begin
		case (sCURRENT_STATE) is
			when IDLE  =>
				sTC_CNT_EN	 <= '0';
				sDATA_CNT_EN <= '0';
				sSHW_EN		 <= '0';
				sDATA_LOAD	 <= '0';
				oTX_READY 	 <= '0';
				oTX 			 <= '1';
			when START =>	
				sTC_CNT_EN	 <= '1';
				sDATA_CNT_EN <= '0';
				sSHW_EN		 <= '0';
				if (sTC_CNT_DONE = '1') then -- Load form data from FIFO 
					sDATA_LOAD	 <= '1';
					oTX_READY 	 <= '1';
				else			
					sDATA_LOAD	 <= '0';
					oTX_READY 	 <= '0';					
				end if;
				oTX 			 <= '0';				
			when DATA  =>	
				sTC_CNT_EN	 <= '1';
				sDATA_CNT_EN <= '1';
				sSHW_EN		 <= '1';
				sDATA_LOAD	 <= '0';
				oTX_READY 	 <= '0';	
				oTX 			 <= sSHW_REG(0);
			when PARITY  =>	
				sTC_CNT_EN	 <= '1';
				sDATA_CNT_EN <= '0';
				sSHW_EN		 <= '0';
				sDATA_LOAD	 <= '0';
			   oTX_READY 	 <= '0';	
				oTX			 <= sPARITY;				
			when STOP  =>	
				sTC_CNT_EN	 <= '1';
				sDATA_CNT_EN <= '0';
				sSHW_EN		 <= '0';
				sDATA_LOAD	 <= '0';
			   oTX_READY 	 <= '0';	
				oTX			 <= '0';
		end case;		
	end process fsm_out;	
	
	-- Terminal count counter process
	tc_cnt: process (iCLK, inRST) begin
		if (inRST = '0') then
			sTC_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sTC_CNT = TC_PERIOD - 1) then -- Check counted periods 
				sTC_CNT <= (others => '0'); 
			elsif (iTC = '1' and sTC_CNT_EN = '1') then -- Check for counter enable
				sTC_CNT <= sTC_CNT + 1; -- Count terminal counts 
			end if;		
		end if;
	end process tc_cnt;

	-- Terminal count done statement
	sTC_CNT_DONE <= '1' when sTC_CNT = TC_PERIOD - 1 else 
						 '0';			
						 
	-- Data bits counter process
	data_cnt: process (iCLK, inRST) begin
		if (inRST = '0') then
			sDATA_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sDATA_CNT = DATA_WIDTH - 1 and sTC_CNT_DONE = '1') then -- Reset counter if all bits was sent
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
			if (sDATA_LOAD = '1') then -- Load data from FIFO
				sSHW_REG <= iDATA;
			elsif (sSHW_EN = '1' and sTC_CNT_DONE = '1') then -- Check for shift enable
				sSHW_REG <= '0' & sSHW_REG(DATA_WIDTH - 1 downto 1); -- Shift data bits
			end if;
		end if;
	end process shift_reg;
	
	
	-- Parity bit generator contains register for data and parity generator
	
	-- Parity register process
	parity_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sPARITY_REG <= (others => '0'); -- Reset register
		elsif (iCLK'event and iCLK = '1') then
			if (sDATA_LOAD = '1') then -- Load data from input
				sPARITY_REG <= iDATA;
			end if;	
		end if;	
	end process parity_reg;
	
	-- Parity bit generator
	sPARITY <=	not (sPARITY_REG(0) xor sPARITY_REG(1) xor sPARITY_REG(2) xor sPARITY_REG(3) xor sPARITY_REG(4) xor sPARITY_REG(5) xor sPARITY_REG(6) xor sPARITY_REG(7));
		
end Behavioral;

