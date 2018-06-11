----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:18 06/11/2018 
-- Design Name: 
-- Module Name:    char_gen - Behavioral 
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


entity char_gen is
	 Generic (
		 DATA_WIDTH : integer := 8; -- Data width 
		 CHAR_WIDTH : integer := 16 -- Char width
	 );
    Port ( iDATA : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
           oCHAR : out std_logic_vector(CHAR_WIDTH - 1 downto 0));
end char_gen;

architecture Behavioral of char_gen is
	
	signal sUPPER_CHAR : std_logic_vector(DATA_WIDTH - 1 downto 0);  -- Upper bits char
	signal sLOWER_CHAR : std_logic_vector(DATA_WIDTH - 1 downto 0);  -- Lower bits char

begin

	-- Char generator process
	char_gen : process (iDATA) begin
		-- Lower bits char
		case (iDATA(3 downto 0)) is
			when "0000" =>
				sLOWER_CHAR <= "00110000"; -- 0
			when "0001" =>
				sLOWER_CHAR <= "00110001"; -- 1
			when "0010" =>
				sLOWER_CHAR <= "00110010"; -- 2
			when "0011" =>
				sLOWER_CHAR <= "00110011"; -- 3
			when "0100" =>
				sLOWER_CHAR <= "00110100"; -- 4
			when "0101" =>
				sLOWER_CHAR <= "00110101"; -- 5
			when "0110" =>
				sLOWER_CHAR <= "00110110"; -- 6
			when "0111" =>
				sLOWER_CHAR <= "00110111"; -- 7
			when "1000" =>
				sLOWER_CHAR <= "00111000"; -- 8
			when "1001" =>
				sLOWER_CHAR <= "00111001"; -- 9
			when "1010" =>
				sLOWER_CHAR <= "01000001"; -- A
			when "1011" =>
				sLOWER_CHAR <= "01000010"; -- B
			when "1100" =>
				sLOWER_CHAR <= "01000011"; -- C
			when "1101" =>
				sLOWER_CHAR <= "01000100"; -- D
			when "1110" =>
				sLOWER_CHAR <= "01000101"; -- E		
			when others =>
				sLOWER_CHAR <= "01000110"; -- F
		end case;
		-- Upper bits char
		case (iDATA(7 downto 4)) is
			when "0000" =>
				sUPPER_CHAR <= "00110000"; -- 0
			when "0001" =>
				sUPPER_CHAR <= "00110001"; -- 1
			when "0010" =>
				sUPPER_CHAR <= "00110010"; -- 2
			when "0011" =>
				sUPPER_CHAR <= "00110011"; -- 3
			when "0100" =>
				sUPPER_CHAR <= "00110100"; -- 4
			when "0101" =>
				sUPPER_CHAR <= "00110101"; -- 5
			when "0110" =>
				sUPPER_CHAR <= "00110110"; -- 6
			when "0111" =>
				sUPPER_CHAR <= "00110111"; -- 7
			when "1000" =>
				sUPPER_CHAR <= "00111000"; -- 8
			when "1001" =>
				sUPPER_CHAR <= "00111001"; -- 9
			when "1010" =>
				sUPPER_CHAR <= "01000001"; -- A
			when "1011" =>
				sUPPER_CHAR <= "01000010"; -- B
			when "1100" =>
				sUPPER_CHAR <= "01000011"; -- C
			when "1101" =>
				sUPPER_CHAR <= "01000100"; -- D
			when "1110" =>
				sUPPER_CHAR <= "01000101"; -- E		
			when others =>
				sUPPER_CHAR <= "01000110"; -- F
		end case;
	end process char_gen;
	
	-- Output char
	oCHAR <= sUPPER_CHAR & sLOWER_CHAR;

end Behavioral;

