----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:33 06/01/2018 
-- Design Name: 
-- Module Name:    lcd_timer - Behavioral 
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


entity lcd_timer is
	 Generic(
		CLK_PERIOD_NUMBER : integer := 360000; 	 -- Clock period number for 15ms period
		CLK_CNT_WIDHT 		: integer := 18 	  	 	 -- Clock counter widht
	 );
    Port ( iCLK 		: in  std_logic;
           inRST 		: in  std_logic;
           iTIMER_EN : in  std_logic;
           oTC 		: out std_logic);
end lcd_timer;

architecture Behavioral of lcd_timer is

	signal sCLK_CNT : unsigned(CLK_CNT_WIDHT - 1 downto 0);	-- Clock counter
	
begin

	-- Clock counter process
	clk_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sCLK_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sCLK_CNT = CLK_PERIOD_NUMBER - 1) then
				sCLK_CNT <= (others => '0'); -- Reset counter
			elsif (iTIMER_EN = '1') then
				sCLK_CNT <= sCLK_CNT + 1; -- Count period
			end if;
		end if;
	end process clk_cnt;
	
	-- Terminal count statement
	oTC <= '1' when sCLK_CNT = CLK_PERIOD_NUMBER - 1 else
			 '0'; 

end Behavioral;

