----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic
-- 
-- Create Date:    18:52:59 05/20/2018 
-- Design Name: 
-- Module Name:    i2c_clk_freq_div - Behavioral 
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


entity i2c_clk_freq_div is
	 Generic (
		CLK_FREQUENCY : integer := 50000000; -- Clock frequency	
		CLK_CNT_WIDTH : integer := 5	 		 -- Width of clock counter
	 );
    Port ( iCLK  		: in  std_logic;		 -- Clock signal 50MHz
           inRST 		: in  std_logic;		 -- Reset signal
			  iFREQ_EN	: in  std_logic; 		 -- Divider enable
           oTC   		: out std_logic);		 -- Period terminal count
end i2c_clk_freq_div;

architecture Behavioral of i2c_clk_freq_div is

	constant cI2C_CLK_PERIOD : unsigned(CLK_CNT_WIDTH - 1 downto 0) := TO_UNSIGNED(CLK_FREQUENCY/(102400*16), CLK_CNT_WIDTH); -- Number of clock peroids to count 100kbit/s period
	
	signal sCLK_CNT : unsigned(CLK_CNT_WIDTH - 1 downto 0); 	-- Clock counter signal

begin

	-- Clock counter process
	clk_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sCLK_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sCLK_CNT = cI2C_CLK_PERIOD) then
				sCLK_CNT <= (others => '0'); -- Reset counter if was counted period cycles 
			elsif (iFREQ_EN = '1') then
				sCLK_CNT <= sCLK_CNT + 1; -- Count clock periods
			end if;
		end if;
	end process clk_cnt;
	
	-- Terminal count statement
	oTC <= '1' when sCLK_CNT = cI2C_CLK_PERIOD - 1 else
			 '0';
			 		 
end Behavioral;

