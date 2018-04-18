----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:58:49 04/16/2018 
-- Design Name: 
-- Module Name:    baud_freq_div - Behavioral 
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

entity baud_freq_div is
	 Generic (
		CLK_PERIOD_NUM : integer := 156; -- Number of clock periods
		CLK_CNT_WIDTH  : integer := 8		-- Width of clock counter
	 );
    Port ( iCLK   : in  std_logic;
           inRST  : in  std_logic;
           oTC 	: out std_logic);
end baud_freq_div;

architecture Behavioral of baud_freq_div is

	signal sCLK_CNT : unsigned(CLK_CNT_WIDTH - 1 downto 0); -- Clock counter signal

begin

	-- Clock counter process
	clk_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sCLK_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sCLK_CNT = CLK_PERIOD_NUM - 1) then
				sCLK_CNT <= (others => '0'); 
			else
				sCLK_CNT <= sCLK_CNT + 1; -- Count clock periods
			end if;
		end if;
	end process clk_cnt;
	
	-- Terminal count statement
	oTC <= '1' when sCLK_CNT = CLK_PERIOD_NUM - 1 else
			 '0';
	
end Behavioral;

