--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:48:32 04/16/2018
-- Design Name:   
-- Module Name:   D:/BSc_workspace/Bachelor_work/UART_communication/reciver_tb.vhd
-- Project Name:  UART_communication
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reciver
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
 
ENTITY reciver_tb IS
END reciver_tb;
 
ARCHITECTURE behavior OF reciver_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reciver
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iRX : IN  std_logic;
         iTC : IN  std_logic;
			iPARITY : IN  std_logic;
			iPARITY_EN : IN  std_logic;
			iDATA_SEL : IN std_logic_vector(1 downto 0);
         iFULL : IN  std_logic;
			oBAUD_EN : OUT std_logic;
         oDATA : OUT  std_logic_vector(7 downto 0);
         oRX_DONE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iRX : std_logic := '1';
   signal iTC : std_logic := '0';
   signal iFULL : std_logic := '0';
	signal iPARITY : std_logic := '0';
	signal iPARITY_EN : std_logic := '0';
	signal iDATA_SEL : std_logic_vector(1 downto 0) := "11";

 	--Outputs
   signal oDATA : std_logic_vector(7 downto 0);
   signal oRX_DONE : std_logic;
	signal oBAUD_EN : std_logic;

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reciver PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iRX => iRX,
          iTC => iTC,
          iFULL => iFULL,
			 iPARITY_EN => iPARITY_EN,
			 iPARITY => iPARITY,
			 iDATA_SEL => iDATA_SEL,
			 oBAUD_EN => oBAUD_EN,
          oDATA => oDATA,
          oRX_DONE => oRX_DONE
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
		inRST     <= '1';
		
		iPARITY_EN <= '0';
		iPARITY    <= '1';
		iTC        <= '1';
		iFULL      <= '0';
		iDATA_SEL  <= "11";
		
		wait for iCLK_period*10;
		
	   -- Start bit	
		iRX   <= '0';	
		--iTC   <= '1';
	  
		wait for iCLK_period*17;
		
	   -- Data bits
		--"100010101"
		
		
		-- 0
		iRX  <= '1';
		
		wait for iCLK_period*17;
		-- 1
		iRX  <= '0';
		
		wait for iCLK_period*16;
		-- 2
		iRX  <= '1';
		
		wait for iCLK_period*16;		
		-- 3
		iRX  <= '0';
		
		wait for iCLK_period*16;
		-- 4
		iRX  <= '1';
		
		wait for iCLK_period*16;	
		-- 5
		iRX  <= '0';
		
		wait for iCLK_period*16;		
		-- 6
		iRX  <= '0';
		
		wait for iCLK_period*16;	
		-- 7
		iRX  <= '0';
		
		wait for iCLK_period*17;

--		-- parity
--		iRX  <= '0';
--		
--		wait for iCLK_period*17;		
		
		-- Stop bit
		iRX <= '1';


      wait;
   end process;

END;
