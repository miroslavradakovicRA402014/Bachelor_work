--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:35:10 06/11/2018
-- Design Name:   
-- Module Name:   D:/BSc_workspace/Bachelor_work/LCD_controller/char_gen_tb.vhd
-- Project Name:  LCD_controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: char_gen
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
 
ENTITY char_gen_tb IS
END char_gen_tb;
 
ARCHITECTURE behavior OF char_gen_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT char_gen
    PORT(
         iDATA : IN  std_logic_vector(7 downto 0);
         oCHAR : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iDATA : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal oCHAR : std_logic_vector(15 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: char_gen PORT MAP (
          iDATA => iDATA,
          oCHAR => oCHAR
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
		
		iDATA <= x"FF";
			
		wait for 100 ns;

		iDATA <= x"AB";
		
		wait for 100 ns;
		
		iDATA <= x"01";

      wait;
   end process;

END;
