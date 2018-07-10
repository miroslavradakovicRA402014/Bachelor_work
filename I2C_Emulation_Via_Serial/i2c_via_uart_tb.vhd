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
USE ieee.numeric_std.ALL;
 
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
	
	-- Loop iteration variable
	signal sLOOP_I : integer range 0 to 20 := 0;	
	
	--  Data signals
	signal sSLAVE_ADDR 	  : std_logic_vector(6 downto 0) :=  "0110001";
	signal sSLAVE_REG_ADDR : std_logic_vector(7 downto 0) :=  "00000001";
	signal sBYTE_NUM	  	  : std_logic_vector(7 downto 0) :=  "00000010";
	signal sDATA_BYTE 	  : std_logic_vector(7 downto 0) :=  (others => '0'); 
	signal sMODE 			  : std_logic							:=  '0';

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
	
	-- Data process 
	data_process : process (sLOOP_I)
		begin
		case (sLOOP_I) is
			when 0 => 
				sSLAVE_REG_ADDR <= x"00";
				sDATA_BYTE <= x"FF";	
			when 1 =>
				sSLAVE_REG_ADDR <= x"01";
				sDATA_BYTE <= x"EE";	
			when 2 =>
				sSLAVE_REG_ADDR <= x"02";
				sDATA_BYTE <= x"DD";
			when 3 =>
				sSLAVE_REG_ADDR <= x"03";
				sDATA_BYTE <= x"CC";
			when 4 =>
				sSLAVE_REG_ADDR <= x"04";
				sDATA_BYTE <= x"BB";
			when 5 =>
				sSLAVE_REG_ADDR <= x"05";
				sDATA_BYTE <= x"AA";
			when 6 =>
				sSLAVE_REG_ADDR <= x"06";
				sDATA_BYTE <= x"99";
			when 7 =>
				sSLAVE_REG_ADDR <= x"07";
				sDATA_BYTE <= x"88";
			when 8 =>
				sSLAVE_REG_ADDR <= x"08";
				sDATA_BYTE <= x"77";				
			when 9 =>
				sSLAVE_REG_ADDR <= x"09";
				sDATA_BYTE <= x"66";				
			when 10 =>
				sSLAVE_REG_ADDR <= x"0A";
				sDATA_BYTE <= x"55";				
			when 11 =>
				sSLAVE_REG_ADDR <= x"0B";
				sDATA_BYTE <= x"44";				
			when 12 =>
				sSLAVE_REG_ADDR <= x"0C";
				sDATA_BYTE <= x"33";				
			when 13 =>
				sSLAVE_REG_ADDR <= x"0D";
				sDATA_BYTE <= x"22";				
			when 14 =>
				sSLAVE_REG_ADDR <= x"0E";
				sDATA_BYTE <= x"11";				
			when 15 =>
				sSLAVE_REG_ADDR <= x"0F";	
				sDATA_BYTE <= x"FF";	
			when others =>
				sSLAVE_REG_ADDR <= x"10";
				sDATA_BYTE <= x"EE";				
		end case;
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

		wait for 50us;

		sLOOP_I <= 0;

		for i in 0 to 15 loop
		
			wait for 1 ms;

			-- Slave address 
				
			-- Start bit	
			iRX   <= '0';	
		  
			wait for iCLK_period*8*170;
				
			-- Data bits
				
			-- 0
			iRX  <= sMODE;
				
			wait for iCLK_period*16*170;
			-- 1
			iRX  <= sSLAVE_ADDR(0);
				
			wait for iCLK_period*16*160;
			-- 2
			iRX  <= sSLAVE_ADDR(1);
				
			wait for iCLK_period*16*160;		
			-- 3
			iRX  <= sSLAVE_ADDR(2);
				
			wait for iCLK_period*16*160;
			-- 4
			iRX  <= sSLAVE_ADDR(3);
				
			wait for iCLK_period*16*160;	
			-- 5
			iRX  <= sSLAVE_ADDR(4);
				
			wait for iCLK_period*16*160;		
			-- 6
			iRX  <= sSLAVE_ADDR(5);
				
			wait for iCLK_period*16*160;	
			-- 7
			iRX  <= sSLAVE_ADDR(6);
				
			wait for iCLK_period*16*170;

			-- parity
			iRX  <= not ((sMODE xor sSLAVE_ADDR(0) xor sSLAVE_ADDR(1) xor sSLAVE_ADDR(2) xor sSLAVE_ADDR(3) xor sSLAVE_ADDR(4) xor sSLAVE_ADDR(5) xor sSLAVE_ADDR(6)));
				
			wait for iCLK_period*16*170;		
					
			-- Stop bit
			iRX <= '1';		

			wait for iCLK_period*16*170;	
			
			-- Register address
			
			-- Start bit	
			iRX   <= '0';	
	  
			wait for iCLK_period*16*170;
			
			-- Data bits
			
			-- 0
			iRX  <= sSLAVE_REG_ADDR(0);
			
			wait for iCLK_period*16*170;
			-- 1
			iRX  <= sSLAVE_REG_ADDR(1);
			
			wait for iCLK_period*16*160;
			-- 2
			iRX  <= sSLAVE_REG_ADDR(2);
			
			wait for iCLK_period*16*160;		
			-- 3
			iRX  <= sSLAVE_REG_ADDR(3);
			
			wait for iCLK_period*16*160;
			-- 4
			iRX  <= sSLAVE_REG_ADDR(4);
			
			wait for iCLK_period*16*160;	
			-- 5
			iRX  <= sSLAVE_REG_ADDR(5);
			
			wait for iCLK_period*16*160;		
			-- 6
			iRX  <= sSLAVE_REG_ADDR(6);
			
			wait for iCLK_period*16*160;	
			-- 7
			iRX  <= sSLAVE_REG_ADDR(7);
			
			wait for iCLK_period*16*170;

			-- parity
			iRX  <=  not ((sSLAVE_REG_ADDR(0) xor sSLAVE_REG_ADDR(1) xor sSLAVE_REG_ADDR(2) xor sSLAVE_REG_ADDR(3) xor sSLAVE_REG_ADDR(4) xor sSLAVE_REG_ADDR(5) xor sSLAVE_REG_ADDR(6) xor sSLAVE_REG_ADDR(7)));
			
			wait for iCLK_period*16*170;		
			
			-- Stop bit
			iRX <= '1';	

			wait for iCLK_period*16*100;	

			-- Number data byte
			
			-- Start bit	
			iRX   <= '0';	
	  
			wait for iCLK_period*8*170;
			
			-- Data bits
			
			-- 0
			iRX  <= sBYTE_NUM(0);
			
			wait for iCLK_period*16*170;
			-- 1
			iRX  <= sBYTE_NUM(1);
			
			wait for iCLK_period*16*160;
			-- 2
			iRX  <= sBYTE_NUM(2);
			
			wait for iCLK_period*16*160;		
			-- 3
			iRX  <= sBYTE_NUM(3);
			
			wait for iCLK_period*16*160;
			-- 4
			iRX  <= sBYTE_NUM(4);
			
			wait for iCLK_period*16*160;	
			-- 5
			iRX  <= sBYTE_NUM(5);
			
			wait for iCLK_period*16*160;		
			-- 6
			iRX  <= sBYTE_NUM(6);
			
			wait for iCLK_period*16*160;	
			-- 7
			iRX  <= sBYTE_NUM(7);
		
			wait for iCLK_period*16*170;

			-- parity
			iRX  <= not ((sBYTE_NUM(0) xor sBYTE_NUM(1) xor sBYTE_NUM(2) xor sBYTE_NUM(3) xor sBYTE_NUM(4) xor sBYTE_NUM(5) xor sBYTE_NUM(6) xor sBYTE_NUM(7)));
			
			wait for iCLK_period*16*170;		
			
			-- Stop bit
			iRX <= '1';			
			
			wait for iCLK_period*16*100;
			
			
			for i in 0 to 1 loop 
			
				-- Data byte 
				
				-- Start bit	
				iRX   <= '0';	
		  
				wait for iCLK_period*8*170;
				
				-- Data bits
				
				-- 0
				iRX  <= sDATA_BYTE(0);
				
				wait for iCLK_period*16*170;
				-- 1
				iRX  <= sDATA_BYTE(1);
				
				wait for iCLK_period*16*160;
				-- 2
				iRX  <= sDATA_BYTE(2);
				
				wait for iCLK_period*16*160;		
				-- 3
				iRX  <= sDATA_BYTE(3);
				
				wait for iCLK_period*16*160;
				-- 4
				iRX  <= sDATA_BYTE(4);
				
				wait for iCLK_period*16*160;	
				-- 5
				iRX  <= sDATA_BYTE(5);
				
				wait for iCLK_period*16*160;		
				-- 6
				iRX  <= sDATA_BYTE(6);
				
				wait for iCLK_period*16*160;	
				-- 7
				iRX  <= sDATA_BYTE(7);
				
				wait for iCLK_period*16*170;

				-- parity
				iRX  <= not ((sDATA_BYTE(0) xor sDATA_BYTE(1) xor sDATA_BYTE(2) xor sDATA_BYTE(3) xor sDATA_BYTE(4) xor sDATA_BYTE(5) xor sDATA_BYTE(6) xor sDATA_BYTE(7)));
				
				wait for iCLK_period*16*170;		
				
				-- Stop bit
				iRX <= '1';	
				
				wait for iCLK_period*16*100;
			end loop;	
			
			sLOOP_I <= sLOOP_I + 1;
		
		end loop;

		sLOOP_I <= 0;	
		sMODE <= '1';

		for i in 0 to 15 loop
		
			wait for 1 ms;
			
			-- Slave address 
				
			-- Start bit	
			iRX   <= '0';	
		  
			wait for iCLK_period*8*170;
				
			-- Data bits
				
			-- 0
			iRX  <= sMODE;
				
			wait for iCLK_period*16*170;
			-- 1
			iRX  <= sSLAVE_ADDR(0);
				
			wait for iCLK_period*16*160;
			-- 2
			iRX  <= sSLAVE_ADDR(1);
				
			wait for iCLK_period*16*160;		
			-- 3
			iRX  <= sSLAVE_ADDR(2);
				
			wait for iCLK_period*16*160;
			-- 4
			iRX  <= sSLAVE_ADDR(3);
				
			wait for iCLK_period*16*160;	
			-- 5
			iRX  <= sSLAVE_ADDR(4);
				
			wait for iCLK_period*16*160;		
			-- 6
			iRX  <= sSLAVE_ADDR(5);
				
			wait for iCLK_period*16*160;	
			-- 7
			iRX  <= sSLAVE_ADDR(6);
				
			wait for iCLK_period*16*170;

			-- parity
			iRX  <= not ((sMODE xor sSLAVE_ADDR(0) xor sSLAVE_ADDR(1) xor sSLAVE_ADDR(2) xor sSLAVE_ADDR(3) xor sSLAVE_ADDR(4) xor sSLAVE_ADDR(5) xor sSLAVE_ADDR(6)));
				
			wait for iCLK_period*16*170;		
					
			-- Stop bit
			iRX <= '1';		

			wait for iCLK_period*16*170;	
			
			-- Register address
			
			-- Start bit	
			iRX   <= '0';	
	  
			wait for iCLK_period*16*170;
			
			-- Data bits
			
			-- 0
			iRX  <= sSLAVE_REG_ADDR(0);
			
			wait for iCLK_period*16*170;
			-- 1
			iRX  <= sSLAVE_REG_ADDR(1);
			
			wait for iCLK_period*16*160;
			-- 2
			iRX  <= sSLAVE_REG_ADDR(2);
			
			wait for iCLK_period*16*160;		
			-- 3
			iRX  <= sSLAVE_REG_ADDR(3);
			
			wait for iCLK_period*16*160;
			-- 4
			iRX  <= sSLAVE_REG_ADDR(4);
			
			wait for iCLK_period*16*160;	
			-- 5
			iRX  <= sSLAVE_REG_ADDR(5);
			
			wait for iCLK_period*16*160;		
			-- 6
			iRX  <= sSLAVE_REG_ADDR(6);
			
			wait for iCLK_period*16*160;	
			-- 7
			iRX  <= sSLAVE_REG_ADDR(7);
			
			wait for iCLK_period*16*170;

			-- parity
			iRX  <=  not ((sSLAVE_REG_ADDR(0) xor sSLAVE_REG_ADDR(1) xor sSLAVE_REG_ADDR(2) xor sSLAVE_REG_ADDR(3) xor sSLAVE_REG_ADDR(4) xor sSLAVE_REG_ADDR(5) xor sSLAVE_REG_ADDR(6) xor sSLAVE_REG_ADDR(7)));
			
			wait for iCLK_period*16*170;		
			
			-- Stop bit
			iRX <= '1';	

			wait for iCLK_period*16*100;	

			-- Number data byte
			
			-- Start bit	
			iRX   <= '0';	
	  
			wait for iCLK_period*8*170;
			
			-- Data bits
			
			-- 0
			iRX  <= sBYTE_NUM(0);
			
			wait for iCLK_period*16*170;
			-- 1
			iRX  <= sBYTE_NUM(1);
			
			wait for iCLK_period*16*160;
			-- 2
			iRX  <= sBYTE_NUM(2);
			
			wait for iCLK_period*16*160;		
			-- 3
			iRX  <= sBYTE_NUM(3);
			
			wait for iCLK_period*16*160;
			-- 4
			iRX  <= sBYTE_NUM(4);
			
			wait for iCLK_period*16*160;	
			-- 5
			iRX  <= sBYTE_NUM(5);
			
			wait for iCLK_period*16*160;		
			-- 6
			iRX  <= sBYTE_NUM(6);
			
			wait for iCLK_period*16*160;	
			-- 7
			iRX  <= sBYTE_NUM(7);
		
			wait for iCLK_period*16*170;

			-- parity
			iRX  <= not ((sBYTE_NUM(0) xor sBYTE_NUM(1) xor sBYTE_NUM(2) xor sBYTE_NUM(3) xor sBYTE_NUM(4) xor sBYTE_NUM(5) xor sBYTE_NUM(6) xor sBYTE_NUM(7)));
			
			wait for iCLK_period*16*170;		
			
			-- Stop bit
			iRX <= '1';			
			
			wait for iCLK_period*16*100;
				
			sLOOP_I <= sLOOP_I + 1;
			
			end loop;
		
		wait for 100 us;
		
      wait;
   end process;

END;
