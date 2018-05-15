----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:13 05/14/2018 
-- Design Name: 
-- Module Name:    reg - Behavioral 
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


entity reg is
	 Generic (
		DATA_WIDTH : integer := 8 -- Register data widht
	 );
    Port ( iCLK  : in  std_logic;
           inRST : in  std_logic;
			  iWE   : in  std_logic;
			  iD 	  : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
			  oQ    : out std_logic_vector(DATA_WIDTH - 1 downto 0));
end reg;

architecture Behavioral of reg is

	signal sREG : std_logic_vector(DATA_WIDTH - 1 downto 0); -- Register signal

begin

	-- Register process
	reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sREG <= (others => '0'); -- Reset register
		elsif (iCLK'event and iCLK = '1') then
			if (iWE = '1') then
				sREG <= iD; -- Write to register
			end if;
		end if;
	end process reg;
	
	-- Register output
	oQ <= sREG;

end Behavioral;

