--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:36:50 05/15/2018
-- Design Name:   
-- Module Name:   /home/rtrk/Workspace/BSc_workspace/Bachelor_work/I2C_bus/scl_gen_tb.vhd
-- Project Name:  I2C_bus
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: scl_gen
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
 
ENTITY scl_gen_tb IS
END scl_gen_tb;
 
ARCHITECTURE behavior OF scl_gen_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT scl_gen
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iSCL_EN : IN  std_logic;
         iTC : IN  std_logic;
         oSCL : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iSCL_EN : std_logic := '0';
   signal iTC : std_logic := '0';

 	--Outputs
   signal oSCL : std_logic;

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: scl_gen PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iSCL_EN => iSCL_EN,
          iTC => iTC,
          oSCL => oSCL
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
		iSCL_EN <= '0';
		iTC <= '1';
		
		wait for iCLK_period*10;
		
		iSCL_EN <= '1';
		

      wait;
   end process;

END;
