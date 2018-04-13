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
	 Generic(
		DATA_WIDTH : integer := 8;
		TC_NUMBER  : integer := 16;
	 );
    Port ( iCLK     : in   std_logic;
           inRST    : in   std_logic;
           iRX      : in   std_logic;
           iTC      : in   std_logic;
           iFULL 	  : in   std_logic;
           oDATA 	  : out  std_logic_vector(DATA_WIDTH-1 downto 0);
           oRX_DONE : out  std_logic);
end reciver;

architecture Behavioral of reciver is
	
	type tSTATES is (IDLE, START, DATA, STOP); 							  -- Reciver FSM state type

	-- Reciver signals
	signal sCURRENT_STATE : tSTATES; 										  -- Reciver FSM current state signal
	signal sNEXT_STATE    : tSTATES;	   						      	  -- Reciver FSM next state signal
	
	signal sDATA_CNT      : unsigned( downto 0); 	    				  -- Recived data bits counter 
	signal sTC_CNT        : unsigned( downto 0);							  -- Terminal count counter
	signal sSHW_REG 		 : std_logic_vector(DATA_WIDTH-1 downto 0); -- Shift register 


 
begin

	-- FSM state register process
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then 
			sCURRENT_STATE <= IDLE; -- Reset FSM
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE; -- Move to next state
		end if;
	end process;

	-- Reciver FSM next state logic
	fsm_next : process (sCURRENT_STATE, iRX, sTC_CNT, sDATA_CNT) begin
		case (sCURRENT_STATE) is 
			when IDLE =>
				-- Wait for RX 
				if (iRX = '0') then 
					sNEXT_STATE <= START; -- Get for start bit
				else 
					sNEXT_STATE <= IDLE;
				end if;
			when START =>
				-- Check if sampling period done
				if (sTC_CNT = TC_NUMBER - 1) begin
					sNEXT_STATE <= DATA; -- Get for data bits
			   else
					sNEXT_STATE <= START;
				end process;
			when DATA =>
				-- Check if all data bits with parity bit recived 
				if (sDATA_CNT = DATA_WIDTH) then
					sNEXT_STATE <= STOP; -- Get for stop bit  
				else 
					sNEXT_STATE <= DATA;
				end if;
			when STOP =>
				-- Check if sampling period done 
				if (sTC_CNT = TC_NUMBER - 1) begin
					sNEXT_STATE <= IDLE; -- Recive next data 
			   else
					sNEXT_STATE <= STOP;
				end process;			
		end case;
	end process;

	-- Reciver FSM output logic
	fsm_out: process (sCURRENT_STATE) is
			when IDLE | START | DATA  =>
				oRX_DONE <= '0';
			when STOP =>	
				oRX_DONE <= '1';
	end case;
	
	-- Terminal count counter process
	tc_cnt: process (iCLK, inRST) begin
		if (inRST = '0') then
			sTC_CNT <= (others => '0');
		elsif (iCLK'event and iCLK = '1') then		
			if (sTC = TC_NUMBER - 1) then
				sTC_CNT <= (others => '0');	
			else
				sTC_CNT <= sTC_CNT + 1;
			end if;
		end if;
	end process;
	
	-- Data bits counter process
	data_cnt: process (iCLK, inRST) begin
		if (inRST = '0') then
			sDATA_CNT <= (others => '0');
		elsif (iCLK'event and iCLK = '1') then
			if (sDATA_CNT_EN = '1') then
	
	
			end if;
		end if;
	end process;
	
end Behavioral;

