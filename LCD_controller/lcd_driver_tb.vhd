--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:24:25 06/04/2018
-- Design Name:   
-- Module Name:   /home/rtrk/Workspace/BSc_workspace/Bachelor_work/LCD_controller/lcd_driver_tb.vhd
-- Project Name:  LCD_controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lcd_driver
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
 
ENTITY lcd_driver_tb IS
END lcd_driver_tb;
 
ARCHITECTURE behavior OF lcd_driver_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lcd_driver
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         oE : OUT  std_logic;
         oRS : OUT  std_logic;
         oRW : OUT  std_logic;
         ioD : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';

	--BiDirs
   signal ioD : std_logic_vector(3 downto 0);

 	--Outputs
   signal oE : std_logic;
   signal oRS : std_logic;
   signal oRW : std_logic;

   -- Clock period definitions
   constant iCLK_period : time := 42 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lcd_driver PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          oE => oE,
          oRS => oRS,
          oRW => oRW,
          ioD => ioD
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
      wait for 10000 ns;	

      wait for iCLK_period*10;

      -- insert stimulus here 
		inRST <= '1';
		ioD <= (others => 'Z');
		
		wait for 40 us;
		
		ioD <= "0000";
			
		wait for iCLK_period;	
		
		ioD <= (others => 'Z');
		
		wait for 40 us;
		
		ioD <= "0000";
			
		wait for iCLK_period;	
		
		ioD <= (others => 'Z'); 
		
		wait for 40 us;
		
		ioD <= "0000";
			
		wait for iCLK_period;	
		
		ioD <= (others => 'Z'); 
		
		wait for 40 us;
		
		ioD <= "0000";
			
		wait for iCLK_period;	
		
		ioD <= (others => 'Z');		
		
		wait for 40 us;
		
		ioD <= "0000";
			
		wait for iCLK_period;	
		
		ioD <= (others => 'Z');		
		
      wait;
   end process;

END;
