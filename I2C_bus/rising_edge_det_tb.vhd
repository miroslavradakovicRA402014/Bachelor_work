--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:53:47 05/07/2018
-- Design Name:   
-- Module Name:   /home/rtrk/Workspace/BSc_workspace/Bachelor_work/I2C_bus/rising_edge_det_tb.vhd
-- Project Name:  I2C_bus
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rising_edge_det
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
 
ENTITY rising_edge_det_tb IS
END rising_edge_det_tb;
 
ARCHITECTURE behavior OF rising_edge_det_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rising_edge_det
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iSIG : IN  std_logic;
         oEDGE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iSIG : std_logic := '0';

 	--Outputs
   signal oEDGE : std_logic;

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rising_edge_det PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iSIG => iSIG,
          oEDGE => oEDGE
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
		
		wait for iCLK_period*10;
		
		iSIG <= '1';
		
		wait for iCLK_period*10;

		iSIG <= '0';
		
		wait for iCLK_period*10;

		iSIG <= '1';

      wait;
   end process;

END;
