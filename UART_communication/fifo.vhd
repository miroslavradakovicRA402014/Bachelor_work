----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:56:14 04/16/2018 
-- Design Name: 
-- Module Name:    fifo - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fifo is
	 Generic (
		DATA_WIDTH   : integer := 8; -- Widht of FIFO word
		NUM_OF_WORDS : integer := 16 -- Number of FIFO locations
	 );
    Port ( iCLK   : in  std_logic;
           inRST  : in  std_logic;
           iDATA  : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
           iWR    : in  std_logic;
           iRD    : in  std_logic;
           oFULL  : out std_logic;
           oEMPTY : out std_logic;
           oDATA  : out std_logic_vector(DATA_WIDTH - 1 downto 0));
end fifo;

architecture Behavioral of fifo is

	type tFIFO is array(NUM_OF_WORDS - 1 downto 0) of std_logic_vector(DATA_WIDTH - 1 downto 0); -- FIFO memory type
	
	signal sFIFO : tFIFO := (
		others => CONV_STD_LOGIC_VECTOR(0, DATA_WIDTH)
	); -- FIFO memory signal

	signal sWR_PTR : integer range 0 to NUM_OF_WORDS - 1; -- FIFO write pointer
	
	signal sEMPTY  : std_logic; -- Empty FIFO state signal
	signal sFULL   : std_logic; -- Full FIFO state signal

begin

	-- Empty FIFO statement 
	sEMPTY <= '1' when sWR_PTR = 0 else
				 '0';
	-- Full FIFO statement
	sFULL  <= '1' when sWR_PTR = NUM_OF_WORDS else
				 '0';

	-- FIFO memory process
	fifo_mem : process (iCLK, inRST) begin
		if (inRST = '0') then
			for i in 0 to NUM_OF_WORDS - 1  loop
				sFIFO(i) <= (others => '0'); -- Reset FIFO
			end loop;
		elsif (iCLK'event and iCLK = '1') then
			if (iWR = '1' and sFULL = '0') then
				sFIFO(sWR_PTR) <= iDATA;  	  -- Write to FIFO 
			elsif (iRD = '1' and sEMPTY = '0') then
				for i in 0 to NUM_OF_WORDS - 2 loop 
					sFIFO(i) <= sFIFO(i + 1); -- Read form FIFO and update memory
				end loop;
			end if;
		end if;
	end process fifo_mem;
	
	-- FIFO pointer process
	ptr_proc : process (iCLK, inRST) begin
		if (inRST = '0') then
			sWR_PTR <= 0; -- Reset pointer
		elsif (iCLK'event and iCLK = '1') then
			if (iWR = '1' and sFULL = '0') then
				sWR_PTR <= sWR_PTR + 1;  	  -- Increment write pointer 
			elsif (iRD = '1' and sEMPTY = '0') then
				sWR_PTR <= sWR_PTR - 1;      -- Decrement wirte pointer
			end if;		
		end if;
	end process ptr_proc;
	
	-- Ouptut signals
	oEMPTY <= sEMPTY;
	oFULL  <= sFULL;
	
	-- Data output
	oDATA  <= sFIFO(0) when iRD = '1' and sEMPTY = '0' else
				 (others => 'Z');	

end Behavioral;

