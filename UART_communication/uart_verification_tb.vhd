--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:31:52 04/18/2018
-- Design Name:   
-- Module Name:   D:/BSc_workspace/Bachelor_work/UART_communication/uart_verification_tb.vhd
-- Project Name:  UART_communication
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: uart_verification
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
 
ENTITY uart_verification_tb IS
END uart_verification_tb;
 
ARCHITECTURE behavior OF uart_verification_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart_verification
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iRX : IN  std_logic;
         inREAD : IN  std_logic;
         inWRITE : IN  std_logic;
         iSW_DATA : IN  std_logic_vector(7 downto 0);
         oTX : OUT  std_logic;
         oLED_DATA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iRX : std_logic := '0';
   signal inREAD : std_logic := '0';
   signal inWRITE : std_logic := '0';
   signal iSW_DATA : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal oTX : std_logic;
   signal oLED_DATA : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart_verification PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iRX => iRX,
          inREAD => inREAD,
          inWRITE => inWRITE,
          iSW_DATA => iSW_DATA,
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

      wait for iCLK_period*10;

      -- insert stimulus here 
		inRST <= '1';
		
		iRX   	<= '1';
		iSW_DATA <= x"61";

		inREAD   <= '1';
		inWRITE  <= '1';
		
		wait for iCLK_period*10;
		
		inWRITE   <= '0';
				
		wait for iCLK_period;
		
		inWRITE   <= '1';
		
      wait;
   end process;

END;
