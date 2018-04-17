--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:59:56 04/17/2018
-- Design Name:   
-- Module Name:   D:/BSc_workspace/Bachelor_work/UART_communication/transmitter_tb.vhd
-- Project Name:  UART_communication
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: transmitter
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
 
ENTITY transmitter_tb IS
END transmitter_tb;
 
ARCHITECTURE behavior OF transmitter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT transmitter
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iTC : IN  std_logic;
         iDATA : IN  std_logic_vector(7 downto 0);
         iSTART : IN  std_logic;
         oTX_READY : OUT  std_logic;
         oTX : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iTC : std_logic := '0';
   signal iDATA : std_logic_vector(7 downto 0) := (others => '0');
   signal iSTART : std_logic := '0';

 	--Outputs
   signal oTX_READY : std_logic;
   signal oTX : std_logic;

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: transmitter PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iTC => iTC,
          iDATA => iDATA,
          iSTART => iSTART,
          oTX_READY => oTX_READY,
          oTX => oTX
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
		
		iDATA  <= "10101011";
		iSTART <= '0';
		
		iTC    <= '1';
		
      wait for iCLK_period*10;
		
		iSTART <= '1';
		
      wait for iCLK_period*100;


      wait;
   end process;

END;
