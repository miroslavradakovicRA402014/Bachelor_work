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
			iSLAVE_ADDR : IN 	std_logic_vector(7 downto 0);
			iREG_ADDR   : IN 	std_logic_vector(7 downto 0);
			iLOWER_BYTE : IN  std_logic_vector(7 downto 0);
			iUPPER_BYTE : IN 	std_logic_vector(7 downto 0);
			iMODE 		: IN	std_logic;
			iDATA_EN	  : IN 	std_logic;			
         oE : OUT  std_logic;
         oRS : OUT  std_logic;
         oRW : OUT  std_logic;
			oLED : OUT std_logic_vector(7 downto 0);
         ioD : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
	signal iSLAVE_ADDR : std_logic_vector(7 downto 0) := (others => '0');
	signal iREG_ADDR   : std_logic_vector(7 downto 0) := (others => '0');
	signal iLOWER_BYTE : std_logic_vector(7 downto 0) := (others => '0');
	signal iUPPER_BYTE : std_logic_vector(7 downto 0) := (others => '0');
	signal iMODE 		 : std_logic := '0';
	signal iDATA_EN	 : std_logic := '0';	
	

	--BiDirs
   signal ioD : std_logic_vector(3 downto 0);

 	--Outputs
   signal oE : std_logic;
   signal oRS : std_logic;
   signal oRW : std_logic;
	signal oLED : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant iCLK_period : time := 42 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lcd_driver PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
			 iSLAVE_ADDR => iSLAVE_ADDR,
			 iREG_ADDR   => iREG_ADDR ,
			 iLOWER_BYTE => iLOWER_BYTE,
			 iUPPER_BYTE => iUPPER_BYTE,
			 iMODE 		 => iMODE,
			 iDATA_EN	 => iDATA_EN,				 
          oE => oE,
          oRS => oRS,
          oRW => oRW,
			 oLED => oLED,
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
		iSLAVE_ADDR <= "00001001";
		iREG_ADDR <= "00000001";
		iLOWER_BYTE <= "11110000";
		iUPPER_BYTE <= "11111111";
		iMODE <= '0';
		iDATA_EN <= '1';
		
		for i in 0 to 29 loop
			ioD <= (others => 'Z');
			
			wait for 40 us;
			
			ioD <= "0000";	

			wait for iCLK_period;	
		end loop;
		
		iDATA_EN <= '0';
		ioD <= (others => 'Z');

		
      wait;
   end process;

END;
