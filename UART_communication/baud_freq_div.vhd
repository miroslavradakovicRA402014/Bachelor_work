----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic 
-- 
-- Create Date:    09:58:49 04/16/2018 
-- Design Name: 
-- Module Name:    baud_freq_div - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity baud_freq_div is
	 Generic (
		CLK_FREQUENCY 	: integer := 24000000;	 -- Clock frequency MHz
		BAUD_RATE_SEL	: integer := 3;		 	 -- Num of baud rate select bits
		CLK_CNT_WIDTH  : integer := 10		    -- Width of clock counter
	 );
    Port ( iCLK   	: in  std_logic;
           inRST  	: in  std_logic;
			  iBAUD_SEL : in  std_logic_vector(BAUD_RATE_SEL - 1 downto 0);
			  iBAUD_EN  : in  std_logic;
           oTC 		: out std_logic);
end baud_freq_div;

architecture Behavioral of baud_freq_div is

	constant cBAUD_2400_PERIOD   : unsigned(CLK_CNT_WIDTH - 1 downto 0) := TO_UNSIGNED(CLK_FREQUENCY/(2400*16)   + 25, CLK_CNT_WIDTH);	-- Number of clock periods for baud rate 2400
	constant cBAUD_4800_PERIOD   : unsigned(CLK_CNT_WIDTH - 1 downto 0) := TO_UNSIGNED(CLK_FREQUENCY/(4800*16)   + 25, CLK_CNT_WIDTH);	-- Number of clock periods for baud rate 4800
	constant cBAUD_9600_PERIOD   : unsigned(CLK_CNT_WIDTH - 1 downto 0) := TO_UNSIGNED(CLK_FREQUENCY/(9600*16)   + 9 , CLK_CNT_WIDTH);	-- Number of clock periods for baud rate 9600
	constant cBAUD_14400_PERIOD  : unsigned(CLK_CNT_WIDTH - 1 downto 0) := TO_UNSIGNED(CLK_FREQUENCY/(14400*16)  + 5 , CLK_CNT_WIDTH);	-- Number of clock periods for baud rate 14400
	constant cBAUD_19200_PERIOD  : unsigned(CLK_CNT_WIDTH - 1 downto 0) := TO_UNSIGNED(CLK_FREQUENCY/(19200*16)  + 2 , CLK_CNT_WIDTH);  -- Number of clock periods for baud rate 19200
	constant cBAUD_38400_PERIOD  : unsigned(CLK_CNT_WIDTH - 1 downto 0) := TO_UNSIGNED(CLK_FREQUENCY/(38400*16)  + 1, CLK_CNT_WIDTH);  -- Number of clock periods for baud rate 38400
	constant cBAUD_57600_PERIOD  : unsigned(CLK_CNT_WIDTH - 1 downto 0) := TO_UNSIGNED(CLK_FREQUENCY/(57600*16)  + 1, CLK_CNT_WIDTH);	-- Number of clock periods for baud rate 57600
	constant cBAUD_115200_PERIOD : unsigned(CLK_CNT_WIDTH - 1 downto 0) := TO_UNSIGNED(CLK_FREQUENCY/(115200*16) + 1, CLK_CNT_WIDTH);	-- Number of clock periods for baud rate 115200
	

	signal 	sCLK_CNT 			  : unsigned(CLK_CNT_WIDTH - 1 downto 0); 			-- Clock counter signal
	signal   sBAUD_RATE			  : unsigned(CLK_CNT_WIDTH - 1 downto 0);				-- Baud rate period of clock signal 
	signal 	sBAUD_RATE_REG  	  : unsigned(CLK_CNT_WIDTH - 1 downto 0); 			-- Baud rate reigster

begin

	-- Clock counter process
	clk_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sCLK_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sCLK_CNT = sBAUD_RATE_REG - 1) then
				sCLK_CNT <= (others => '0'); -- Reset counter if was counted period cycles 
			else
				sCLK_CNT <= sCLK_CNT + 1; -- Count clock periods
			end if;
		end if;
	end process clk_cnt;
	
	-- Terminal count statement
	oTC <= '1' when sCLK_CNT = sBAUD_RATE_REG - 1 else
			 '0';
			 		 
	-- Baud rate register
	baud_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sBAUD_RATE_REG <= cBAUD_9600_PERIOD; -- Set to default baud rate
		elsif (iCLK'event and iCLK = '1') then
			if (iBAUD_EN = '1') then
				sBAUD_RATE_REG <= sBAUD_RATE; -- Set baud rate
			end if;	
		end if;
	end process baud_reg;
	
	-- Baud rate period signal generator 
	baud_gen : process (iBAUD_SEL) begin
		-- Generate baud rate period depends on input configurarion
		case (iBAUD_SEL) is
			when "000" 	=> 
				sBAUD_RATE <= cBAUD_2400_PERIOD;  
			when "001" 	=> 
				sBAUD_RATE <= cBAUD_4800_PERIOD;
			when "010" 	=>	
				sBAUD_RATE <= cBAUD_9600_PERIOD;
			when "011" 	=>	
				sBAUD_RATE <= cBAUD_14400_PERIOD;	
			when "100" 	=>	
				sBAUD_RATE <= cBAUD_19200_PERIOD;
			when "101" 	=>	
				sBAUD_RATE <= cBAUD_38400_PERIOD;		
			when "110"	=>
				sBAUD_RATE <= cBAUD_57600_PERIOD;
			when others =>	
				sBAUD_RATE <= cBAUD_115200_PERIOD;
		end case;
	end process baud_gen;
	
end Behavioral;

