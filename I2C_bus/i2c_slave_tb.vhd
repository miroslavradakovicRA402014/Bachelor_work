--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:05:15 05/04/2018
-- Design Name:   
-- Module Name:   /home/rtrk/Workspace/BSc_workspace/Bachelor_work/I2C_bus/i2c_slave_tb.vhd
-- Project Name:  I2C_bus
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i2c_slave
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
 
ENTITY i2c_slave_tb IS
END i2c_slave_tb;
 
ARCHITECTURE behavior OF i2c_slave_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2c_slave
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iSCL : IN  std_logic;
         ioSDA : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iSCL : std_logic := '1';

	--BiDirs
   signal ioSDA : std_logic := '1';

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: i2c_slave PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iSCL => iSCL,
          ioSDA => ioSDA
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
		ioSDA <= '1';
		iSCL  <= '1';
		
		wait for iCLK_period*10;
		
		-- Start condition
		ioSDA <= '0';
		
		wait for iCLK_period*10;

		iSCL  <= '0';

      wait;
   end process;

END;
