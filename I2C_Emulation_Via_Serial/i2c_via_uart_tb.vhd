--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:15:11 05/24/2018
-- Design Name:   
-- Module Name:   /home/rtrk/Workspace/BSc_workspace/Bachelor_work/I2C_Emulation_Via_Serial/i2c_via_uart_tb.vhd
-- Project Name:  I2C_Emulation_Via_Serial
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i2c_via_uart
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
 
ENTITY i2c_via_uart_tb IS
END i2c_via_uart_tb;
 
ARCHITECTURE behavior OF i2c_via_uart_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2c_via_uart
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
         iPARITY_EN_SW : IN  std_logic;
         iPARITY_SW : IN  std_logic;
         iHANDSHAKE_EN_SW : IN  std_logic;
         iDATA_BIT_SW : IN  std_logic_vector(1 downto 0);
         iBAUD_SW : IN  std_logic_vector(2 downto 0);
         iCTS : IN  std_logic;
         iRX : IN  std_logic;
         oTX : OUT  std_logic;
         oRTS : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iPARITY_EN_SW : std_logic := '0';
   signal iPARITY_SW : std_logic := '0';
   signal iHANDSHAKE_EN_SW : std_logic := '0';
   signal iDATA_BIT_SW : std_logic_vector(1 downto 0) := (others => '0');
   signal iBAUD_SW : std_logic_vector(2 downto 0) := (others => '0');
   signal iCTS : std_logic := '0';
   signal iRX : std_logic := '1';

 	--Outputs
   signal oTX : std_logic;
   signal oRTS : std_logic;

   -- Clock period definitions
   constant iCLK_period : time := 42 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: i2c_via_uart PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
          iPARITY_EN_SW => iPARITY_EN_SW,
          iPARITY_SW => iPARITY_SW,
          iHANDSHAKE_EN_SW => iHANDSHAKE_EN_SW,
          iDATA_BIT_SW => iDATA_BIT_SW,
          iBAUD_SW => iBAUD_SW,
          iCTS => iCTS,
          iRX => iRX,
          oTX => oTX,
          oRTS => oRTS
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
      -- insert stimulus here 
		      -- hold reset state for 100 ns.
      wait for 100 ns;	

		iBAUD_SW <= "010";
		iPARITY_EN_SW <= '1';
		iPARITY_SW <= '1';
		iHANDSHAKE_EN_SW <= '0';
		iDATA_BIT_SW <= "11";

      wait for iCLK_period*16*100;
		
		
		inRST <= '1';


		-- Slave address 11111010
		
	   -- Start bit	
		iRX   <= '0';	
  
		wait for iCLK_period*16*165;
		
	   -- Data bits
		
		-- 0
		iRX  <= '0';
		
		wait for iCLK_period*16*165;
		-- 1
		iRX  <= '1';
		
		wait for iCLK_period*16*165;
		-- 2
		iRX  <= '0';
		
		wait for iCLK_period*16*165;		
		-- 3
		iRX  <= '1';
		
		wait for iCLK_period*16*165;
		-- 4
		iRX  <= '1';
		
		wait for iCLK_period*16*165;	
		-- 5
		iRX  <= '1';
		
		wait for iCLK_period*16*165;		
		-- 6
		iRX  <= '1';
		
		wait for iCLK_period*16*165;	
		-- 7
		iRX  <= '1';
		
		wait for iCLK_period*16*165;

		-- parity
		iRX  <= '1';
		
		wait for iCLK_period*16*165;		
		
		-- Stop bit
		iRX <= '1';
		
		wait for iCLK_period*16*100;
		
		-- Register address 00000001
		
	   -- Start bit	
		iRX   <= '0';	
  
		wait for iCLK_period*16*170;
		
	   -- Data bits
		
		-- 0
		iRX  <= '1';
		
		wait for iCLK_period*16*170;
		-- 1
		iRX  <= '0';
		
		wait for iCLK_period*16*160;
		-- 2
		iRX  <= '0';
		
		wait for iCLK_period*16*160;		
		-- 3
		iRX  <= '0';
		
		wait for iCLK_period*16*160;
		-- 4
		iRX  <= '0';
		
		wait for iCLK_period*16*160;	
		-- 5
		iRX  <= '0';
		
		wait for iCLK_period*16*160;		
		-- 6
		iRX  <= '0';
		
		wait for iCLK_period*16*160;	
		-- 7
		iRX  <= '0';
		
		wait for iCLK_period*16*170;

		-- parity
		iRX  <= '1';
		
		wait for iCLK_period*16*170;		
		
		-- Stop bit
		iRX <= '1';	

		wait for iCLK_period*16*100;	

		-- Lower data byte 00010001
		
	   -- Start bit	
		iRX   <= '0';	
  
		wait for iCLK_period*8*170;
		
	   -- Data bits
		
		-- 0
		iRX  <= '1';
		
		wait for iCLK_period*16*170;
		-- 1
		iRX  <= '0';
		
		wait for iCLK_period*16*160;
		-- 2
		iRX  <= '0';
		
		wait for iCLK_period*16*160;		
		-- 3
		iRX  <= '0';
		
		wait for iCLK_period*16*160;
		-- 4
		iRX  <= '1';
		
		wait for iCLK_period*16*160;	
		-- 5
		iRX  <= '0';
		
		wait for iCLK_period*16*160;		
		-- 6
		iRX  <= '0';
		
		wait for iCLK_period*16*160;	
		-- 7
		iRX  <= '0'; --
	
		wait for iCLK_period*16*170;

		-- parity
		iRX  <= '1';
		
		wait for iCLK_period*16*170;		
		
		-- Stop bit
		iRX <= '1';			
		
		wait for iCLK_period*16*100;
		
		-- Lower data byte 00110001
		
	   -- Start bit	
		iRX   <= '0';	
  
		wait for iCLK_period*8*170;
		
	   -- Data bits
		
		-- 0
		iRX  <= '1';
		
		wait for iCLK_period*16*170;
		-- 1
		iRX  <= '0';
		
		wait for iCLK_period*16*160;
		-- 2
		iRX  <= '0';
		
		wait for iCLK_period*16*160;		
		-- 3
		iRX  <= '0';
		
		wait for iCLK_period*16*160;
		-- 4
		iRX  <= '1';
		
		wait for iCLK_period*16*160;	
		-- 5
		iRX  <= '1';
		
		wait for iCLK_period*16*160;		
		-- 6
		iRX  <= '0';
		
		wait for iCLK_period*16*160;	
		-- 7
		iRX  <= '0';
		
		wait for iCLK_period*16*170;

		-- parity
		iRX  <= '0';
		
		wait for iCLK_period*16*170;		
		
		-- Stop bit
		iRX <= '1';	
		
		-- 16 bit transfter done -------------------------------------------------------------------
		
		wait for iCLK_period*24*100;
		
		-- Slave address 11111010
		
	   -- Start bit	
		iRX   <= '0';	
  
		wait for iCLK_period*16*170;
		
	   -- Data bits
		
		-- 0
		iRX  <= '0';
		
		wait for iCLK_period*8*170;
		-- 1
		iRX  <= '1';
		
		wait for iCLK_period*16*160;
		-- 2
		iRX  <= '0';
		
		wait for iCLK_period*16*160;		
		-- 3
		iRX  <= '1';
		
		wait for iCLK_period*16*160;
		-- 4
		iRX  <= '1';
		
		wait for iCLK_period*16*160;	
		-- 5
		iRX  <= '1';
		
		wait for iCLK_period*16*160;		
		-- 6
		iRX  <= '1';
		
		wait for iCLK_period*16*160;	
		-- 7
		iRX  <= '1';
		
		wait for iCLK_period*16*170;

		-- parity
		iRX  <= '1';
		
		wait for iCLK_period*16*170;		
		
		-- Stop bit
		iRX <= '1';		
		
		wait for iCLK_period*16*100;
		
		-- Register address 00000010
		
	   -- Start bit	
		iRX   <= '0';	
  
		wait for iCLK_period*16*170;
		
	   -- Data bits
		
		-- 0
		iRX  <= '0';
		
		wait for iCLK_period*16*170;
		-- 1
		iRX  <= '1';
		
		wait for iCLK_period*16*160;
		-- 2
		iRX  <= '0';
		
		wait for iCLK_period*16*160;		
		-- 3
		iRX  <= '0';
		
		wait for iCLK_period*16*160;
		-- 4
		iRX  <= '0';
		
		wait for iCLK_period*16*160;	
		-- 5
		iRX  <= '0';
		
		wait for iCLK_period*16*160;		
		-- 6
		iRX  <= '0';
		
		wait for iCLK_period*16*160;	
		-- 7
		iRX  <= '0';
		
		wait for iCLK_period*16*170;

		-- parity
		iRX  <= '1';
		
		wait for iCLK_period*16*170;		
		
		-- Stop bit
		iRX <= '1';	

		wait for iCLK_period*16*100;		

		------------------------------------------------------------------------------------------------------------------------
		
		-- Lower byte data 01010101
		
	   -- Start bit	
		iRX   <= '0';	
  
		wait for iCLK_period*8*170;
		
	   -- Data bits
		
		-- 0
		iRX  <= '1';
		
		wait for iCLK_period*16*170;
		-- 1
		iRX  <= '0';
		
		wait for iCLK_period*16*160;
		-- 2
		iRX  <= '1';
		
		wait for iCLK_period*16*160;		
		-- 3
		iRX  <= '0';
		
		wait for iCLK_period*16*160;
		-- 4
		iRX  <= '1';
		
		wait for iCLK_period*16*160;	
		-- 5
		iRX  <= '0';
		
		wait for iCLK_period*16*160;		
		-- 6
		iRX  <= '1';
		
		wait for iCLK_period*16*160;	
		-- 7
		iRX  <= '0';
		
		wait for iCLK_period*16*170;

		-- parity
		iRX  <= '1';
		
		wait for iCLK_period*16*170;		
		
		-- Stop bit
		iRX <= '1';	

		wait for iCLK_period*16*100;
		
		-- Upper byte data 10101010
		
	   -- Start bit	
		iRX   <= '0';	
  
		wait for iCLK_period*8*170;
		
	   -- Data bits
		
		-- 0
		iRX  <= '0';
		
		wait for iCLK_period*16*170;
		-- 1
		iRX  <= '1';
		
		wait for iCLK_period*16*160;
		-- 2
		iRX  <= '0';
		
		wait for iCLK_period*16*160;		
		-- 3
		iRX  <= '1';
		
		wait for iCLK_period*16*160;
		-- 4
		iRX  <= '0';
		
		wait for iCLK_period*16*160;	
		-- 5
		iRX  <= '1';
		
		wait for iCLK_period*16*160;		
		-- 6
		iRX  <= '0';
		
		wait for iCLK_period*16*160;	
		-- 7
		iRX  <= '1';
		
		wait for iCLK_period*16*170;

		-- parity
		iRX  <= '1';
		
		wait for iCLK_period*16*170;		
		
		-- Stop bit
		iRX <= '1';	

		wait for iCLK_period*16*100;	

		

		

      wait;
   end process;

END;
