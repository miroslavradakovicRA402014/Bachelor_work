--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:30:21 05/20/2018
-- Design Name:   
-- Module Name:   /home/mika/Projects/projects_workspace/Bachelor_work/I2C_bus/i2c_clk_freq_div_tb.vhd
-- Project Name:  I2C_bus
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i2c_clk_freq_div
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY i2c_clk_freq_div_tb IS
END i2c_clk_freq_div_tb;
 
ARCHITECTURE behavior OF i2c_clk_freq_div_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2c_clk_freq_div
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iFREQ_EN : IN  std_logic;
         oTC : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iFREQ_EN : std_logic := '0';

 	--Outputs
   signal oTC : std_logic;

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: i2c_clk_freq_div PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iFREQ_EN => iFREQ_EN,
          oTC => oTC
        );

   -- Clock process definitions
   iCLK_process :process
   begin
		iCLK <= '0';
		wait for iCLK_period/2;
		iCLK <= '1';
		wait for iCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for iCLK_period*10;

      -- insert stimulus here 
		inRST <= '1';
		iFREQ_EN <= '0';
		
      wait for iCLK_period*10;
		
		iFREQ_EN <= '1';
		
		wait for iCLK_period*100;
		
		iFREQ_EN <= '0';

      wait;
   end process;

END;
