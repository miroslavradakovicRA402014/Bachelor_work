----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic
-- 
-- Create Date:    11:51:36 05/04/2018 
-- Design Name:    Slave register
-- Module Name:    slave_reg - Behavioral 
-- Project Name:   i2c_via_uart
-- Target Devices: E2LP development board(Spartan 6)
-- Tool versions:  Xilinx ISE 14.6
-- Description: 	 Slave register, can write and read form 
--						 upper and lower part of register
-- Dependencies:   none
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity slave_reg is
	 Generic (
		DATA_WIDTH : integer := 8 -- Register data width
	 );
    Port ( iCLK  		: in   std_logic;														-- Clock signal 50MHz
           inRST 		: in   std_logic;														-- Reset signal
           iWE  		: in   std_logic;														-- Write enable
			  iBYTE_SEL : in   std_logic;														-- Register byte selection
           iD    		: in   std_logic_vector(DATA_WIDTH - 1 downto 0);			-- Input data
           oQ    		: out  std_logic_vector(2 * DATA_WIDTH - 1 downto 0));	-- Output data
end slave_reg;

architecture Behavioral of slave_reg is

	signal sREG : std_logic_vector(2 * DATA_WIDTH - 1 downto 0); -- Register signal

begin

	-- Register process
	reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sREG <= (others => '0'); -- Reset register
		elsif (iCLK'event and iCLK = '1') then
			if (iWE = '1') then
				if (iBYTE_SEL = '0') then
					sREG(DATA_WIDTH - 1 downto 0) <= iD; -- Write to register lower part 
				else
					sREG(2 * DATA_WIDTH - 1 downto DATA_WIDTH) <= iD; -- Write to register upper part
				end if;	
			end if;
		end if;
	end process;
	
	-- Register output
	oQ  <= sREG;

end Behavioral;

