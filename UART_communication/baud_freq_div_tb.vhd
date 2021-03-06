--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:31:03 04/16/2018
-- Design Name:   
-- Module Name:   D:/BSc_workspace/Bachelor_work/UART_communication/baud_freq_div_tb.vhd
-- Project Name:  UART_communication
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: baud_freq_div
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
 
ENTITY baud_freq_div_tb IS
END baud_freq_div_tb;
 
ARCHITECTURE behavior OF baud_freq_div_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT baud_freq_div
    Port ( iCLK   	: in  std_logic;
           inRST  	: in  std_logic;
			  iBAUD_SEL : in  std_logic_vector(1 downto 0);
			  iBAUD_EN  : in  std_logic;
           oTC 		: out std_logic);
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
	signal iBAUD_SEL : std_logic_vector(1 downto 0) := "00";
	signal iBAUD_EN  : std_logic := '0';

 	--Outputs
   signal oTC : std_logic;

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: baud_freq_div PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
			 iBAUD_SEL => iBAUD_SEL,
			 iBAUD_EN  => iBAUD_EN ,
          oTC => oTC
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
		inRST 	  <= '1';
		
		iBAUD_SEL  <= "00";
		iBAUD_EN	  <= '0';
		
		wait for iCLK_period*10;
		
		iBAUD_EN	  <= '1';
		
		wait for iCLK_period*2;
		
		iBAUD_SEL  <= "01";
		iBAUD_EN	  <= '0';

		wait for iCLK_period*10;
		
		iBAUD_EN	  <= '1';
		
		wait for iCLK_period*2;
		
		iBAUD_SEL  <= "10";
		iBAUD_EN	  <= '0';	
	
		wait for iCLK_period*10;
		
		iBAUD_EN	  <= '1';
		
		wait for iCLK_period*2;
		
		iBAUD_SEL  <= "11";
		iBAUD_EN	  <= '0';

		wait for iCLK_period*10;
		
		iBAUD_EN	  <= '1';
		
		wait for iCLK_period*2;		

		
		

      wait;
   end process;

END;
