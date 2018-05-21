----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:11:44 05/21/2018 
-- Design Name: 
-- Module Name:    falling_edge_det - Behavioral 
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


entity falling_edge_det is
    Port ( iCLK  : in  std_logic;
           inRST : in  std_logic;
           iSIG  : in  std_logic;
           oEDGE : out std_logic);
end falling_edge_det;

architecture Behavioral of falling_edge_det is
	type   tSTATES is (IDLE, EDGE, ZERO); 	 -- Detector FSM states
	
	signal sCURRENT_STATE : tSTATES;	 -- Detector FSM current state
	signal sNEXT_STATE 	 : tSTATES;  -- Detector FSM next state

begin

	-- FSM state register process
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then 
			sCURRENT_STATE <= IDLE; -- Reset FSM
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE; -- Move to next state
		end if;
	end process fsm_reg;

	-- Edge detector FSM next state logic
	fsm_next : process (sCURRENT_STATE, iSIG) begin
		case (sCURRENT_STATE) is
			when IDLE =>
				-- Wait for signal edge
				if (iSIG = '1') then
					sNEXT_STATE <= IDLE; -- Falling edge detected
				else
					sNEXT_STATE <= ZERO;
				end if;
			when EDGE =>
				if (iSIG = '0') then
					sNEXT_STATE <= ZERO; -- Logical zero
				else 
					sNEXT_STATE <= IDLE; -- Falling edge
				end if;	
			when ONE  =>
				if (iSIG = '0') then
					sNEXT_STATE <= IDLE; -- Falling edge 
				else 
					sNEXT_STATE <= ONE;
				end if;
		end case;
	end process fsm_next;
	
	-- Edge detector FSM output logic
	fsm_out : process (sCURRENT_STATE) begin
		case (sCURRENT_STATE) is
			when IDLE =>
				oEDGE <= '0';
			when EDGE =>
				oEDGE <= '1'; -- Rising edge
			when ONE  =>
				oEDGE <= '0';
		end case;
	end process fsm_out;


end Behavioral;

