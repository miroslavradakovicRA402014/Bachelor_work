--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:41:44 05/20/2018
-- Design Name:   
-- Module Name:   /home/mika/Projects/projects_workspace/Bachelor_work/I2C_bus/i2c_bus_tb.vhd
-- Project Name:  I2C_bus
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i2c_bus
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
 
ENTITY i2c_bus_tb IS
END i2c_bus_tb;
 
ARCHITECTURE behavior OF i2c_bus_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2c_bus
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iUART_FULL : IN  std_logic;
         iUART_EMPTY : IN  std_logic;
         iUART_DATA : IN  std_logic_vector(7 downto 0);
         oUART_READ : OUT  std_logic;
         oUART_WRITE : OUT  std_logic;
         oUART_DATA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iUART_FULL : std_logic := '0';
   signal iUART_EMPTY : std_logic := '0';
   signal iUART_DATA : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal oUART_READ : std_logic;
   signal oUART_WRITE : std_logic;
   signal oUART_DATA : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: i2c_bus PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iUART_FULL => iUART_FULL,
          iUART_EMPTY => iUART_EMPTY,
          iUART_DATA => iUART_DATA,
          oUART_READ => oUART_READ,
          oUART_WRITE => oUART_WRITE,
          oUART_DATA => oUART_DATA
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
      wait for iCLK_period*10.5;
		
		inRST <= '1';


      -- insert stimulus here
		iUART_FULL  <= '0';
		iUART_EMPTY <= '0';
			
--		wait for iCLK_period;
	
		-- Start 
--		iUART_DATA  <= x"01";
--		
--		wait for iCLK_period;
		
		-- Slave address/mode
		iUART_DATA  <= x"FA";
		
		wait for iCLK_period;
		
		-- Register address
		iUART_DATA  <= x"01";

		wait for iCLK_period;
	
		-- Lower data byte
		iUART_DATA  <= x"11";
		
		wait for iCLK_period;
		
		-- Upper data byte
		iUART_DATA  <= x"21";		
		
----		wait for iCLK_period;	
----
----		iUART_DATA  <= x"80";
				
		wait for iCLK_period*10;
		
		iUART_EMPTY <= '1';
		
		wait for 100 us;
		
      -- insert stimulus here
		iUART_FULL  <= '0';
		iUART_EMPTY <= '0';
			
--		wait for iCLK_period;
	
		-- Start 
--		iUART_DATA  <= x"01";
--		
--		wait for iCLK_period;
		
		-- Slave address/mode
		wait for iCLK_period;
		
		iUART_DATA  <= x"FA";
		
		wait for iCLK_period;
		
		-- Register address
		iUART_DATA  <= x"02";

		wait for iCLK_period;
	
		-- Lower data byte
		iUART_DATA  <= x"21";
		
		wait for iCLK_period;
		
		-- Upper data byte
		iUART_DATA  <= x"31";		

		wait for iCLK_period*10;
		
		iUART_EMPTY <= '1';		

		wait for 100 us;
		
      -- insert stimulus here
		iUART_FULL  <= '0';
		iUART_EMPTY <= '0';
			
--		wait for iCLK_period;
	
		-- Start 
--		iUART_DATA  <= x"01";
--		
--		wait for iCLK_period;
		
		-- Slave address/mode
		wait for iCLK_period;
		
		iUART_DATA  <= x"FB";
		
		wait for iCLK_period;
		
		-- Register address
		iUART_DATA  <= x"01";

		wait for iCLK_period*10;
		
		iUART_EMPTY <= '1';		

		wait for 100 us;
		
      -- insert stimulus here
		iUART_FULL  <= '0';
		iUART_EMPTY <= '0';
			
--		wait for iCLK_period;
	
		-- Start 
--		iUART_DATA  <= x"01";
--		
--		wait for iCLK_period;
		
		-- Slave address/mode
		wait for iCLK_period;
		
		iUART_DATA  <= x"FB";
		
		wait for iCLK_period;
		
		-- Register address
		iUART_DATA  <= x"02";

		wait for iCLK_period * 2;
		
		iUART_EMPTY <= '1';
		
		
		
		
	
		
		
				

      wait;
   end process;

END;
