--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:06:16 04/18/2018
-- Design Name:   
-- Module Name:   D:/BSc_workspace/Bachelor_work/UART_communication/uart_tb.vhd
-- Project Name:  UART_communication
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: uart
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
 
ENTITY uart_tb IS
END uart_tb;
 
ARCHITECTURE behavior OF uart_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iRX : IN  std_logic;
         iUART_DATA : IN  std_logic_vector(7 downto 0);
         iUART_WR : IN  std_logic;
         iUART_RD : IN  std_logic;
         oTX : OUT  std_logic;
         oUART_FULL : OUT  std_logic;
         oUART_EMPTY : OUT  std_logic;
         oUART_DATA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iRX : std_logic := '0';
   signal iUART_DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal iUART_WR : std_logic := '0';
   signal iUART_RD : std_logic := '0';

 	--Outputs
   signal oTX : std_logic;
   signal oUART_FULL : std_logic;
   signal oUART_EMPTY : std_logic;
   signal oUART_DATA : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iRX => iRX,
          iUART_DATA => iUART_DATA,
          iUART_WR => iUART_WR,
          iUART_RD => iUART_RD,
          oTX => oTX,
          oUART_FULL => oUART_FULL,
          oUART_EMPTY => oUART_EMPTY,
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
      wait for 100 ns;	

      wait for iCLK_period*10;

      -- insert stimulus here 
		inRST <= '1';
		
		
		
		
		

      wait;
   end process;

END;
