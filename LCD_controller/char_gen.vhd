----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic 
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
    Port ( iDATA : in  std_logic_vector(DATA_WIDTH - 1 downto 0); 	-- Input data
           oCHAR : out std_logic_vector(CHAR_WIDTH - 1 downto 0));	-- Generated char
end char_gen;

architecture Behavioral of char_gen is
	
	-- Char codes
	constant cCHAR_0 : std_logic_vector(DATA_WIDTH - 1 downto 0) := "00110000";
	constant cCHAR_1 : std_logic_vector(DATA_WIDTH - 1 downto 0) := "00110001";
	constant cCHAR_2 : std_logic_vector(DATA_WIDTH - 1 downto 0) := "00110010";
	constant cCHAR_3 : std_logic_vector(DATA_WIDTH - 1 downto 0) := "00110011";
	constant cCHAR_4 : std_logic_vector(DATA_WIDTH - 1 downto 0) := "00110100";
	constant cCHAR_5 : std_logic_vector(DATA_WIDTH - 1 downto 0) := "00110101";
	constant cCHAR_6 : std_logic_vector(DATA_WIDTH - 1 downto 0) := "00110110";
	constant cCHAR_7 : std_logic_vector(DATA_WIDTH - 1 downto 0) := "00110111";
	constant cCHAR_8 : std_logic_vector(DATA_WIDTH - 1 downto 0) := "00111000";
	constant cCHAR_9 : std_logic_vector(DATA_WIDTH - 1 downto 0) := "00111001";
	constant cCHAR_A : std_logic_vector(DATA_WIDTH - 1 downto 0) := "01000001";
	constant cCHAR_B : std_logic_vector(DATA_WIDTH - 1 downto 0) := "01000010";
	constant cCHAR_C : std_logic_vector(DATA_WIDTH - 1 downto 0) := "01000011";
	constant cCHAR_D : std_logic_vector(DATA_WIDTH - 1 downto 0) := "01000100";
	constant cCHAR_E : std_logic_vector(DATA_WIDTH - 1 downto 0) := "01000101";
	constant cCHAR_F : std_logic_vector(DATA_WIDTH - 1 downto 0) := "01000110";
	
	signal sUPPER_CHAR : std_logic_vector(DATA_WIDTH - 1 downto 0);  -- Upper bits char
	signal sLOWER_CHAR : std_logic_vector(DATA_WIDTH - 1 downto 0);  -- Lower bits char

begin

	-- Char generator process
	char_gen : process (iDATA) begin
		-- Lower bits char
		case (iDATA(3 downto 0)) is
			when "0000" =>
				sLOWER_CHAR <= cCHAR_0; -- 0
			when "0001" =>
				sLOWER_CHAR <= cCHAR_1; -- 1
			when "0010" =>
				sLOWER_CHAR <= cCHAR_2; -- 2
			when "0011" =>
				sLOWER_CHAR <= cCHAR_3; -- 3
			when "0100" =>
				sLOWER_CHAR <= cCHAR_4; -- 4
			when "0101" =>
				sLOWER_CHAR <= cCHAR_5; -- 5
			when "0110" =>
				sLOWER_CHAR <= cCHAR_6; -- 6
			when "0111" =>
				sLOWER_CHAR <= cCHAR_7; -- 7
			when "1000" =>
				sLOWER_CHAR <= cCHAR_8; -- 8
			when "1001" =>
				sLOWER_CHAR <= cCHAR_9; -- 9
			when "1010" =>
				sLOWER_CHAR <= cCHAR_A; -- A
			when "1011" =>
				sLOWER_CHAR <= cCHAR_B; -- B
			when "1100" =>
				sLOWER_CHAR <= cCHAR_C; -- C
			when "1101" =>
				sLOWER_CHAR <= cCHAR_D; -- D
			when "1110" =>
				sLOWER_CHAR <= cCHAR_E; -- E		
			when others =>
				sLOWER_CHAR <= cCHAR_F; -- F
		end case;
		-- Upper bits char
		case (iDATA(7 downto 4)) is
			when "0000" =>
				sUPPER_CHAR <= cCHAR_0; -- 0
			when "0001" =>
				sUPPER_CHAR <= cCHAR_1; -- 1
			when "0010" =>
				sUPPER_CHAR <= cCHAR_2; -- 2
			when "0011" =>
				sUPPER_CHAR <= cCHAR_3; -- 3
			when "0100" =>
				sUPPER_CHAR <= cCHAR_4; -- 4
			when "0101" =>
				sUPPER_CHAR <= cCHAR_5; -- 5
			when "0110" =>
				sUPPER_CHAR <= cCHAR_6; -- 6
			when "0111" =>
				sUPPER_CHAR <= cCHAR_7; -- 7
			when "1000" =>
				sUPPER_CHAR <= cCHAR_8; -- 8
			when "1001" =>
				sUPPER_CHAR <= cCHAR_9; -- 9
			when "1010" =>
				sUPPER_CHAR <= cCHAR_A; -- A
			when "1011" =>
				sUPPER_CHAR <= cCHAR_B; -- B
			when "1100" =>
				sUPPER_CHAR <= cCHAR_C; -- C
			when "1101" =>
				sUPPER_CHAR <= cCHAR_D; -- D
			when "1110" =>
				sUPPER_CHAR <= cCHAR_E; -- E		
			when others =>
				sUPPER_CHAR <= cCHAR_F; -- F
		end case;
	end process char_gen;
	
	-- Output char
	oCHAR <= sUPPER_CHAR & sLOWER_CHAR;

end Behavioral;

