----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic
-- 
-- Create Date:    15:48:00 05/15/2018 
-- Design Name:    Serial clock generator
-- Module Name:    scl_gen - Behavioral 
-- Project Name:   I2C via UART
-- Target Devices: E2LP develpoment board(Spartan 6)
-- Tool versions:  Xilinx ISE 14.6
-- Description: 	 Serial clock generator
--
-- Dependencies: 	 none
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity scl_gen is
	 Generic (
		PERIOD_CNT_WIDHT : integer := 4; -- Period counter width
		SCL_CLOCK_PERIOD : integer := 9 	-- Clock period
	 );
    Port ( iCLK  	  : in  std_logic;	 -- Clock signal 50MHz
           inRST 	  : in  std_logic;	 -- Reset signal
			  iSCL_RST : in  std_logic;	 -- Serial clock reset
           iSCL_EN  : in  std_logic;    -- SCL generation enable
           iTC 	  : in  std_logic;	 -- Terminal count from clock divider
           oSCL 	  : out std_logic);   -- SCL signal
end scl_gen;

architecture Behavioral of scl_gen is

	signal sPER_CNT 	 : unsigned(PERIOD_CNT_WIDHT - 1 downto 0);			-- Period counter
	signal sTC_PER_CNT : std_logic;													-- Period counter terminal count signal			
		
	signal sSCL 		 : std_logic; 													-- SCL signal 
	
begin

	-- SCL generator process
	scl_gen : process (iCLK, inRST) begin
		if (inRST = '0') then
			sSCL <= '1';
		elsif (iCLK'event and iCLK = '1') then	
			if (iSCL_EN = '0') then
				sSCL <= '1';	-- SLC line idle
			else
				-- Generate SCL signal
				if (sTC_PER_CNT = '1') then
					sSCL <=	not (sSCL);  
				end if;
			end if;
		end if;
	end process scl_gen;
		
	-- SCL peroid counter
	per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sPER_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sPER_CNT = SCL_CLOCK_PERIOD - 1 or iSCL_RST = '1') then
				sPER_CNT <= (others => '0');
			elsif (iSCL_EN = '1' and iTC = '1') then
				sPER_CNT <= sPER_CNT + 1; -- Count period
			end if;
		end if;
	end process per_cnt;

	-- SCL period counter terminal count
	sTC_PER_CNT <= '1' when sPER_CNT = SCL_CLOCK_PERIOD - 1 else
						'0';
	
	-- Output signal
	oSCL <= sSCL;					

end Behavioral;

