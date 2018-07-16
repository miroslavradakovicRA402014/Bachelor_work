----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic
-- 
-- Create Date:    12:56:14 04/16/2018 
-- Design Name: 	 FIFO ring buffer
-- Module Name:    fifo - Behavioral 
-- Project Name:   I2C via UART
-- Target Devices: E2LP development board(Spartan 6)
-- Tool versions:  Xilinx ISE 14.6
-- Description: 	 FIFO ring buffer
--
-- Dependencies:   none
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


entity fifo is
	 Generic (
		DATA_WIDTH   : integer := 8; -- Width of FIFO word
		NUM_OF_WORDS : integer := 4  -- Number of FIFO locations (as 2^n where n is, NUM_OF_WORDS)
	 );
    Port ( iCLK    : in  std_logic;												-- Clock signal 50MHz
           inRST   : in  std_logic;												-- Reset signal
           iDATA   : in  std_logic_vector(DATA_WIDTH - 1 downto 0);	-- Data input 
           iWR     : in  std_logic;												-- Write to FIFO signal
           iRD     : in  std_logic;												-- Read from FIFO signal
           oFULL   : out std_logic;												-- FIFO full indication
           oEMPTY  : out std_logic;												-- FIFO empty indication
           oDATA   : out std_logic_vector(DATA_WIDTH - 1 downto 0)); -- Output data
end fifo;

architecture Behavioral of fifo is

	type tFIFO is array(2 ** NUM_OF_WORDS - 1 downto 0) of std_logic_vector(DATA_WIDTH - 1 downto 0); -- FIFO memory type
	
	signal sFIFO : tFIFO; -- FIFO memory signal

	signal sWR_PTR : integer range 0 to 2 ** NUM_OF_WORDS - 1; -- FIFO write pointer
	signal sRD_PTR : integer range 0 to 2 ** NUM_OF_WORDS - 1; -- FIFO write pointer
	
	signal sEMPTY  : std_logic; -- Empty FIFO state signal
	signal sFULL   : std_logic; -- Full FIFO state signal
	
begin
	
	-- FIFO memory process
	fifo_mem : process (iCLK, inRST) begin
		if (inRST = '0') then
			for i in 0 to 2 ** NUM_OF_WORDS - 1  loop
				sFIFO(i) <= (others => '0'); -- Reset FIFO
			end loop;
		elsif (iCLK'event and iCLK = '1') then
			if (iWR = '1' and sFULL = '0') then
				sFIFO(sWR_PTR) <= iDATA;  	  -- Write to FIFO if not full		
			end if;
		end if;
	end process fifo_mem;
	
	-- Data output
	oDATA  <= sFIFO(sRD_PTR) when iRD = '1' and sEMPTY = '0' else
				 (others => '0');
	
	-- FIFO pointer process
	ptr_proc : process (iCLK, inRST) begin
		if (inRST = '0') then
			sWR_PTR <= 0; -- Reset write pointer
			sRD_PTR <= 0; -- Reset read  pointer
		elsif (iCLK'event and iCLK = '1') then
			if (iWR = '1') then -- If FIFO is not full and write enable write to it
				if (sFULL = '0') then
					if (sWR_PTR = 2 ** NUM_OF_WORDS - 1) then
						sWR_PTR <= 0; -- Return pointer to begin
					else
						sWR_PTR <= sWR_PTR + 1;  	  -- Increment write pointer
					end if;	
				end if;	
			elsif (iRD = '1') then
				if (sEMPTY = '0') then  -- If FIFO is not empty and write enable read from it
					if (sRD_PTR = 2 ** NUM_OF_WORDS - 1) then
						sRD_PTR <= 0; -- Return pointer to begin
					else
						sRD_PTR <= sRD_PTR + 1;      -- Increment read pointer
					end if;	
				end if;	
			end if;			
		end if;
	end process ptr_proc;
	
	-- Empty-full FIFO state process
	fifo_state_proc : process (iCLK, inRST) begin
		if (inRST = '0') then  -- Reset FIFO state
			sEMPTY <= '1';
			sFULL  <= '0';
		elsif (iCLK'event and iCLK = '1') then	
			if (iWR = '1') then
				-- Check if next position write of pointer is equal to read pointer - inidicate to FIFO is full 
				if (sWR_PTR = 2 ** NUM_OF_WORDS - 1) then -- Check for last position in buffer
					if (sRD_PTR = 0) then 
						sFULL  <= '1';
					end if;
				else
					if (sRD_PTR = sWR_PTR + 1) then
						sFULL  <= '1';
					end if;
				end if;		
				sEMPTY <= '0';	-- Whenever you write something FIFO won't be empty
			elsif (iRD = '1') then
				-- Check if next position of read pointer is equal to write pointer - inidicate to FIFO is empty
				if (sRD_PTR = 2 ** NUM_OF_WORDS - 1) then -- Check for last position in buffer
					if (sWR_PTR = 0) then
						sEMPTY <= '1';
					end if;
				else
					if (sWR_PTR = sRD_PTR + 1) then
						sEMPTY <= '1';
					end if;	
				end if;
				sFULL <= '0'; -- Whenever you write something FIFO won't be empty
			end if;
		end if;
	end process fifo_state_proc;
	
	-- Ouptut signals
	oEMPTY <= sEMPTY;
	oFULL  <= sFULL;
		
end Behavioral;

