--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:05:15 05/04/2018
-- Design Name:   
-- Module Name:   /home/rtrk/Workspace/BSc_workspace/Bachelor_work/I2C_bus/i2c_slave_tb.vhd
-- Project Name:  I2C_bus
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i2c_slave
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
 
ENTITY i2c_slave_tb IS
END i2c_slave_tb;
 
ARCHITECTURE behavior OF i2c_slave_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2c_slave
	 GENERIC (
		SLAVE_ADDRESS  : std_logic_vector(6 downto 0) := "1010101"
	 );
    PORT(
         iCLK : IN  std_logic;
         inRST : IN  std_logic;
			iTC	: IN std_logic;
         iSCL : IN  std_logic;
         ioSDA : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iCLK : std_logic := '0';
   signal inRST : std_logic := '0';
   signal iSCL : std_logic := '1';
	signal iTC : std_logic := '1';

	--BiDirs
   signal ioSDA : std_logic := '1';

   -- Clock period definitions
   constant iCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: i2c_slave
			GENERIC MAP (
				SLAVE_ADDRESS => "1010101"
			)
			PORT MAP (
          iCLK => iCLK,
          inRST => inRST,
			 iTC  => iTC,
          iSCL => iSCL,
          ioSDA => ioSDA
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
		ioSDA <= '1';
		iSCL  <= '1';
		iTC   <= '1';
		
		wait for iCLK_period*10;
		
		-- Start condition
		ioSDA <= '0';
		
		wait for iCLK_period*10;
		
		-- SCL 0		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '1'; -- Data 0
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;			

		-- SCL 1		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 1
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;		

		-- SCL 2		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '1'; -- Data 2
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 3		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 3

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 4		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 4

		wait for iCLK_period*4;	
			
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 5		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 5

		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 6		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 6

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 7		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 7 -- Mode R/W

		wait for iCLK_period*4;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	
		
		-- SCL 8
		iSCL <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 8
		
		wait for iCLK_period*1.5;

		ioSDA <= 'Z';

		wait for iCLK_period*3;
		
		iSCL <= '1';
		
		wait for iCLK_period*8;
		
		iSCL <= '0';

		wait for iCLK_period*4;
		
		-- Register address

		iSCL <= '0';
		ioSDA <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 0
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;			

		-- SCL 1		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 1
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;		

		-- SCL 2		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 2
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 3		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 3

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 4		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 4

		wait for iCLK_period*4;	
			
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 5		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 5

		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 6		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 6

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 7		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 7

		wait for iCLK_period*4;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	
		
		-- SCL 8
		iSCL <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 8
		
		-- Register ack/nack

		wait for iCLK_period*2;

		ioSDA <= 'Z';

		wait for iCLK_period*3;
		
		iSCL <= '1';
		
		wait for iCLK_period*8;
		
		iSCL <= '0';

		wait for iCLK_period*4;		
		
		-- Data byte 10000001
		iSCL <= '0';
		ioSDA <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '1'; -- Data 0
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;			

		-- SCL 1		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 1
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;		

		-- SCL 2		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 2
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 3		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 3

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 4		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 4

		wait for iCLK_period*4;	
			
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 5		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 5

		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 6		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 6

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 7		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 7

		wait for iCLK_period*4;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	
		
		-- SCL 8
		iSCL <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 8		
		
		-- Data read ack/nack

		wait for iCLK_period*2;

		ioSDA <= 'Z'; -- Change for later test bench

		wait for iCLK_period*3;
		
		iSCL <= '1';
		
		wait for iCLK_period*8;
		
		iSCL <= '0';

		wait for iCLK_period*4;		

--		-- Stop condition
--		
--		iSCL <= '1';
--		
--		wait for iCLK_period*3;
--
--		ioSDA <= '1';

		iSCL <= '0';
		ioSDA <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 0
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;			

		-- SCL 1		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 1
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;		

		-- SCL 2		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 2
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 3		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 3

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 4		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 4

		wait for iCLK_period*4;	
			
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 5		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 5

		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 6		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 6

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 7		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 7

		wait for iCLK_period*4;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	
		
		-- SCL 8
		iSCL <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 8
		
		-- Register ack/nack

		wait for iCLK_period*2;

		ioSDA <= 'Z';

		wait for iCLK_period*3;
		
		iSCL <= '1';
		
		wait for iCLK_period*8;
		
		iSCL <= '0';

		wait for iCLK_period*4;		
		
	-- Data byte 10000011
		iSCL <= '0';
		ioSDA <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '1'; -- Data 0
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;			

		-- SCL 1		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 1
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;		

		-- SCL 2		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 2
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 3		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 3

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 4		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 4

		wait for iCLK_period*4;	
			
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 5		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 5

		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 6		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 6

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 7		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 7

		wait for iCLK_period*4;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	
		
		-- SCL 8
		iSCL <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 8		
		
		-- Data read ack/nack

		wait for iCLK_period*2;

		ioSDA <= 'Z'; -- Change for later test bench

		wait for iCLK_period*1;
		
		ioSDA <= '0';
		
		wait for iCLK_period*2;
		
		iSCL <= '1';
		
		wait for iCLK_period*8;
		
		iSCL <= '0';

		wait for iCLK_period*4;		
		
		-- Stop condition
		
		iSCL <= '1';
		
		wait for iCLK_period*3;

		ioSDA <= '1';		
		
		wait for iCLK_period*150;
		
		-- Read form slave -------------------------------------------------------------------------------------------
		
		-- Start condition
		ioSDA <= '0';
		
		wait for iCLK_period*10;
		
		-- SCL 0		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '1'; -- Data 0
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;			

		-- SCL 1		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 1
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;		

		-- SCL 2		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '1'; -- Data 2
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 3		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 3

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 4		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 4

		wait for iCLK_period*4;	
			
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 5		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 5

		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 6		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 6

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 7		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 7 -- Mode R/W

		wait for iCLK_period*4;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	
		
		-- SCL 8
		iSCL <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 8
		
		wait for iCLK_period*2;

		ioSDA <= 'Z';

		wait for iCLK_period*3;
		
		iSCL <= '1';
		
		wait for iCLK_period*8;
		
		iSCL <= '0';

		wait for iCLK_period*4;
		
		-- Register address

		iSCL <= '0';
		ioSDA <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 0
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;			

		-- SCL 1		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 1
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;		

		-- SCL 2		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 2
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 3		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 3

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 4		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 4

		wait for iCLK_period*4;	
			
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 5		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 5

		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 6		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 6

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 7		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 7

		wait for iCLK_period*4;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	
		
		-- SCL 8
		iSCL <= '0';
		
		wait for iCLK_period*6;

		ioSDA <= 'Z'; -- Data 8	

		-- Read period ----------------------------------------------------------------
	
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;			

		-- SCL 1		
		iSCL  <= '0';
		
		wait for iCLK_period*8;
				
		iSCL  <= '1';
		
		wait for iCLK_period*8;		

		-- SCL 2		
		iSCL  <= '0';
		
		wait for iCLK_period*8;
				
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 3		
		iSCL  <= '0';
		
		wait for iCLK_period*8;
	
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 4		
		iSCL  <= '0';
		
	   wait for iCLK_period*8;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 5		
		iSCL  <= '0';
		
	   wait for iCLK_period*8;
	
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 6		
		iSCL  <= '0';
		
	   wait for iCLK_period*8;

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 7		
		iSCL  <= '0';
		
		wait for iCLK_period*8;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	
		
		-- SCL 8
		iSCL <= '0';
		
		wait for iCLK_period*8;
		
		iSCL <= '1';
		
		wait for iCLK_period*8;
		
		iSCL <= '0';
		
		wait for iCLK_period*6;
		
		ioSDA <= '0'; -- ACK/NACK
		
		wait for iCLK_period*4;
		
		iSCL <= '1';
		
		wait for iCLK_period*8;

		iSCL <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0';
		
		wait for iCLK_period*4;
		
		iSCL <= '1';
		
		wait for iCLK_period*8;		
		
		iSCL <= '0';
			
		wait for iCLK_period*4;
		
		-- Register address 
		
		ioSDA <= '0'; -- Data 0
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;			

		-- SCL 1		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 1
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;		

		-- SCL 2		
		iSCL  <= '0';
		
		wait for iCLK_period*4;
		
		ioSDA <= '0'; -- Data 2
		
		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 3		
		iSCL  <= '0';
		
		wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 3

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 4		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '0'; -- Data 4

		wait for iCLK_period*4;	
			
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 5		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 5

		wait for iCLK_period*4;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 6		
		iSCL  <= '0';
		
	   wait for iCLK_period*4;

		ioSDA <= '1'; -- Data 6

		wait for iCLK_period*4;	

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 7		
		iSCL  <= '0';
		
		wait for iCLK_period*6;

		ioSDA <= 'Z'; -- Data 7

		wait for iCLK_period*4;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	
		
		-- SCL 8
		iSCL <= '0';
	
		-- Read period ----------------------------------------------------------------
	
		wait for iCLK_period*8;		

		iSCL  <= '1';
		
		wait for iCLK_period*8;			

		-- SCL 1		
		iSCL  <= '0';
		
		wait for iCLK_period*8;
				
		iSCL  <= '1';
		
		wait for iCLK_period*8;		

		-- SCL 2		
		iSCL  <= '0';
		
		wait for iCLK_period*8;
				
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 3		
		iSCL  <= '0';
		
		wait for iCLK_period*8;
	
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 4		
		iSCL  <= '0';
		
	   wait for iCLK_period*8;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 5		
		iSCL  <= '0';
		
	   wait for iCLK_period*8;
	
		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 6		
		iSCL  <= '0';
		
	   wait for iCLK_period*8;

		iSCL  <= '1';
		
		wait for iCLK_period*8;	

		-- SCL 7		
		iSCL  <= '0';
		
		wait for iCLK_period*8;
		
		iSCL  <= '1';
		
		wait for iCLK_period*8;	
		
--		-- SCL 8
--		iSCL <= '0';
--		
--		wait for iCLK_period*8;
--		
--		iSCL <= '1';
--		
--		wait for iCLK_period*8;
--		
--		iSCL <= '0';
--		
--		wait for iCLK_period*6;

		iSCL <= '0';

		wait for iCLK_period*4;

		ioSDA <= '1';
		
		wait for iCLK_period*4;
		
		iSCL <= '1';
		
		wait for iCLK_period*8;	
--
--		wait for iCLK_period*8;
--		
--		iSCL <= '0';
--
--		wait for iCLK_period*4;	
--	
--		ioSDA <= '1';
--		
--		wait for iCLK_period*4;	
	
		-- Stop condition
		ioSDA <= '0';
		
		iSCL <= '1';
		
		wait for iCLK_period*3;

		ioSDA <= '1';			


      wait;
   end process;

END;
