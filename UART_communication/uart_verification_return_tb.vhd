--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:51:16 04/23/2018
-- Design Name:   
-- Module Name:   D:/BSc_workspace/Bachelor_work/UART_communication/uart_verification_return_tb.vhd
-- Project Name:  UART_communication
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: uart_verification_return
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
 
ENTITY uart_verification_return_tb IS
END uart_verification_return_tb;
 
ARCHITECTURE behavior OF uart_verification_return_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart_verification_return
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iRX : IN  std_logic;
         oTX : OUT  std_logic;
         oLED_DATA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iRX : std_logic := '1';

 	--Outputs
   signal oTX : std_logic;
   signal oLED_DATA : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart_verification_return PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iRX => iRX,
          oTX => oTX,
          oLED_DATA => oLED_DATA
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

      wait for iCLK_period*100;

      -- insert stimulus here 
		inRST <= '1';
		
		wait for iCLK_period*170;
		
	   -- Start bit	
		iRX   <= '0';	
  
		wait for iCLK_period*170;
		
	   -- Data bits
		
		-- 0
		iRX  <= '0';
		
		wait for iCLK_period*170;
		-- 1
		iRX  <= '1';
		
		wait for iCLK_period*160;
		-- 2
		iRX  <= '0';
		
		wait for iCLK_period*160;		
		-- 3
		iRX  <= '0';
		
		wait for iCLK_period*160;
		-- 4
		iRX  <= '0';
		
		wait for iCLK_period*160;	
		-- 5
		iRX  <= '1';
		
		wait for iCLK_period*160;		
		-- 6
		iRX  <= '1';
		
		wait for iCLK_period*160;	
		-- 7
		iRX  <= '0';
		
		wait for iCLK_period*170;

		-- parity
		iRX  <= '0';
		
		wait for iCLK_period*170;		
		
		-- Stop bit
		iRX <= '1';

      wait;
   end process;

END;
