--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:06:46 04/16/2018
-- Design Name:   
-- Module Name:   D:/BSc_workspace/Bachelor_work/UART_communication/fifo_tb.vhd
-- Project Name:  UART_communication
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fifo
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
 
ENTITY fifo_tb IS
END fifo_tb;
 
ARCHITECTURE behavior OF fifo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fifo
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iDATA : IN  std_logic_vector(7 downto 0);
         iWR : IN  std_logic;
         iRD : IN  std_logic;
         oFULL : OUT  std_logic;
         oEMPTY : OUT  std_logic;
--			oLED : OUT  std_logic_vector(3 downto 0);
         oDATA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iDATA : std_logic_vector(7 downto 0) := (others => '0');
   signal iWR : std_logic := '0';
   signal iRD : std_logic := '0';

 	--Outputs
   signal oFULL : std_logic;
   signal oEMPTY : std_logic;
   signal oDATA : std_logic_vector(7 downto 0);
--	signal oLED : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fifo PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iDATA => iDATA,
          iWR => iWR,
          iRD => iRD,
          oFULL => oFULL,
          oEMPTY => oEMPTY,
--			 oLED	=> oLED,
          oDATA => oDATA
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

      wait for iCLK_period*10.5;

      -- insert stimulus here 
	
	   inRST <= '1';
		
		
	   iDATA <= x"0F";
		iWR   <= '0';
		iRD   <= '0';
		
      wait for iCLK_period*10;		
		
		iWR   <= '1';
		iRD   <= '0';
		
		wait for iCLK_period;

	   iDATA <= x"F0";	
		iWR   <= '0';
		iRD   <= '0';
		
		wait for iCLK_period*10;

		iWR   <= '1';
		iRD   <= '0';
		
		wait for iCLK_period;
		
		iWR   <= '0';
		iRD   <= '0';
		
		iDATA <= x"FF";
		
		for i in 0 to 15 loop
		
			wait for iCLK_period*10;

			iWR   <= '1';
			iRD   <= '0';
			
			wait for iCLK_period;
			
			iWR   <= '0';
			iRD   <= '0';		
			
		end loop;
		
		wait for iCLK_period*10;

		iDATA <= x"FF";

		iWR   <= '0';
		iRD   <= '0';	
		
		wait for iCLK_period;
		
		iWR   <= '1';
		iRD   <= '0';
		
		for i in 0 to 20 loop
		
			wait for iCLK_period*10;

			iWR   <= '0';
			iRD   <= '1';
			
--			wait for iCLK_period;
--			
--			iWR   <= '0';
--			iRD   <= '0';		
			
		end loop;		
		
--		wait for iCLK_period;
--		
--		iWR   <= '1';
--		iRD   <= '0';		
		

      wait;
   end process;

END;
