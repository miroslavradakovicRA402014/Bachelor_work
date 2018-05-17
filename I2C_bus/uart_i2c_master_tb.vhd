--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:36:59 05/15/2018
-- Design Name:   
-- Module Name:   /home/rtrk/Workspace/BSc_workspace/Bachelor_work/I2C_bus/uart_i2c_master_tb.vhd
-- Project Name:  I2C_bus
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: uart_i2c_master
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
 
ENTITY uart_i2c_master_tb IS
END uart_i2c_master_tb;
 
ARCHITECTURE behavior OF uart_i2c_master_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart_i2c_master
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iTC : IN  std_logic;
         iUART_FULL : IN  std_logic;
         iUART_EMPTY : IN  std_logic;
         iUART_DATA : IN  std_logic_vector(7 downto 0);
         oUART_READ : OUT  std_logic;
         oUART_WRITE : OUT  std_logic;
         oUART_DATA : OUT  std_logic_vector(7 downto 0);
         oSCL : OUT  std_logic;
         ioSDA : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iTC : std_logic := '0';
   signal iUART_FULL : std_logic := '0';
   signal iUART_EMPTY : std_logic := '0';
   signal iUART_DATA : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal ioSDA : std_logic;

 	--Outputs
   signal oUART_READ : std_logic;
   signal oUART_WRITE : std_logic;
   signal oUART_DATA : std_logic_vector(7 downto 0);
   signal oSCL : std_logic;

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart_i2c_master PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iTC => iTC,
          iUART_FULL => iUART_FULL,
          iUART_EMPTY => iUART_EMPTY,
          iUART_DATA => iUART_DATA,
          oUART_READ => oUART_READ,
          oUART_WRITE => oUART_WRITE,
          oUART_DATA => oUART_DATA,
          oSCL => oSCL,
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

      wait for iCLK_period*10.5;
		
		inRST <= '1';


      -- insert stimulus here
		iTC <= '1';
		iUART_FULL  <= '0';
		iUART_EMPTY <= '0';
			
		wait for iCLK_period;
	
		-- Start 
		iUART_DATA  <= x"01";
		
		wait for iCLK_period;
		
		-- Slave address/mode
		iUART_DATA  <= x"FB";
		
		wait for iCLK_period;
		
		-- Register address
		iUART_DATA  <= x"AA";

--		wait for iCLK_period;
--		
--		-- Lower data byte
--		iUART_DATA  <= x"11";
--		
--		wait for iCLK_period;
--		
--		-- Upper data byte
--		iUART_DATA  <= x"21";		
		
		wait for iCLK_period;	

		iUART_DATA  <= x"80";
		
		
		--ioSDA <= '1';

      wait;
   end process;

END;
