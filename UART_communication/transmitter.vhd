----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic
-- 
-- Create Date:    09:03:15 04/17/2018 
-- Design Name: 	 UART transmitter	
-- Module Name:    transmitter - Behavioral 
-- Project Name:   I2C via UART
-- Target Devices: E2LP(Spartan 6)
-- Tool versions:  Xilinx ISE 14.6
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


entity transmitter is
	 Generic (
		DATA_WIDTH 		 : integer := 8;  -- Data bit number
		TC_PERIOD  		 : integer := 16; -- Terminal count period for oversampling
		DATA_CNT_WIDTH  : integer := 3;  -- Width of data bit counter
		TC_CNT_WIDTH	 : integer := 4;  -- Width of terminal count counter
		DATA_BIT_SEL	 : integer := 2	-- Width of data bit number select
	 );
    Port ( iCLK 		 	 : in   std_logic;												-- Clock signal 50MHz
           inRST  	 	 : in   std_logic;												-- Reset signal 
			  iPARITY_EN 	 : in   std_logic;												-- Parity enable signal
			  iPARITY	 	 : in   std_logic;												-- Parity mode signal
			  iHANDSHAKE_EN : in   std_logic;												-- Handshaking enable signal
			  iDATA_SEL  	 : in   std_logic_vector(1 downto 0);						-- Data bits select 
			  iCTS		 	 : in   std_logic;												-- Clear to send signal 
           iTC    	 	 : in   std_logic;												-- Terminal count from clock divider
           iDATA  	 	 : in   std_logic_vector(DATA_WIDTH   - 1 downto 0);  -- Input data
           iSTART 	 	 : in   std_logic;											 	--	Transaction start signal
			  oTX_READY  	 : out  std_logic;												-- Transmitter ready
           oTX    	 	 : out  std_logic);												-- TX ready signal
end transmitter;

architecture Behavioral of transmitter is

	-- Data counter count limit
	constant cDATA_5_BIT     : unsigned(DATA_CNT_WIDTH - 1 downto 0) := "100";
	constant cDATA_6_BIT     : unsigned(DATA_CNT_WIDTH - 1 downto 0) := "101";
	constant cDATA_7_BIT     : unsigned(DATA_CNT_WIDTH - 1 downto 0) := "110";
	constant cDATA_8_BIT     : unsigned(DATA_CNT_WIDTH - 1 downto 0) := "111";
	
	type tSTATES is (IDLE, HANDSHAKE, START, DATA, PARITY, STOP); 				-- Reciver FSM state type

	signal sCURRENT_STATE 	 : tSTATES; 										  		-- Reciver FSM current state 
	signal sNEXT_STATE    	 : tSTATES;	   						      	  		-- Reciver FSM next state
	
	signal sDATA_CNT      	 : unsigned(DATA_CNT_WIDTH - 1 downto 0);   		-- Recived data bits counter 
	signal sTC_CNT        	 : unsigned(TC_CNT_WIDTH   - 1 downto 0);	  		-- Terminal count counter
	signal sDATA_BIT_REG		 : unsigned(2 downto 0);								-- Data bit number register
	signal sDATA_BIT			 : unsigned(DATA_CNT_WIDTH - 1 downto 0);			-- Data bit number 	
	
	
   signal sSHW_REG 		 	 : std_logic_vector(DATA_WIDTH - 1 downto 0);   -- Shift register
	
	signal sDATA_CNT_EN 		 : std_logic;										  		-- Data counter enable
	signal sTC_CNT_EN 		 : std_logic;										  		-- Terminal count counter enable
	signal sSHW_EN				 : std_logic;										  		-- Shifter enable
	signal sDATA_BIT_EN		 : std_logic;											   -- Enable signal for data bit register

	signal sTC_CNT_DONE 		 : std_logic;										  		-- Terminal count counter count done	
	
	signal sDATA_LOAD		    : std_logic;										 		-- Registers data load signal
	
	signal sPARITY_REG 		 : std_logic_vector(DATA_WIDTH - 1 downto 0);	-- Parity register
	signal sPARITY				 : std_logic;												-- Parity signals
	
	
begin

	-- FSM state register process
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then 
			sCURRENT_STATE <= IDLE; -- Reset FSM
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE; -- Move to next state
		end if;
	end process fsm_reg;
	
	-- Reciver FSM next state logic
	fsm_next : process (sCURRENT_STATE, iHANDSHAKE_EN, iCTS, iPARITY_EN, iSTART, sTC_CNT_DONE, sDATA_CNT, sDATA_BIT_REG) begin
		sNEXT_STATE <= sCURRENT_STATE;
		case (sCURRENT_STATE) is 
			when IDLE =>	
				-- Wait for FIFO 
				if (iSTART = '1') then 
					if (iHANDSHAKE_EN = '1') then -- Check does handshaking enabled
						sNEXT_STATE <= HANDSHAKE; -- Start handshaking
					else
						sNEXT_STATE <= START; -- Get for start bit
					end if;
				end if;
			when HANDSHAKE =>	
				-- Wait for CTS signal 
				if (iCTS = '1') then 
					sNEXT_STATE <= START; -- Get for start bit
				end if;			
			when START =>
				-- Check if start sampling period done
				if (sTC_CNT_DONE = '1') then
					sNEXT_STATE <= DATA; -- Get for data bits
				end if;
			when DATA =>
				-- Check if all data bits sent
				if (sDATA_CNT = sDATA_BIT_REG and sTC_CNT_DONE = '1') then
					if (iPARITY_EN = '1') then
						sNEXT_STATE <= PARITY; -- Get for stop bit
					else
						sNEXT_STATE <= STOP; -- Skip parity bit
					end if;
				end if;
			when PARITY =>
				-- Check if sampling period done 
				if (sTC_CNT_DONE = '1') then
					sNEXT_STATE <= STOP; -- Send stop bit
				end if;				
			when STOP =>
				-- Check if sampling period done 
				if (sTC_CNT_DONE = '1') then
					sNEXT_STATE <= IDLE; -- Send next data 
				end if;			
		end case;
	end process fsm_next;	
	
	-- Reciver FSM output logic
	fsm_out : process (sCURRENT_STATE, iHANDSHAKE_EN, sPARITY, sTC_CNT_DONE, sSHW_REG(0)) begin
		sTC_CNT_EN	 		<= '0';
		sDATA_CNT_EN 		<= '0';
		sDATA_BIT_EN		<= '0'; 
		sSHW_EN		 		<= '0';
		sDATA_LOAD	 		<= '0';
		oTX_READY 	 		<= '0';
		oTX 			 		<= '0';
		case (sCURRENT_STATE) is
			when IDLE =>
				sDATA_BIT_EN		<= '1'; -- Enable data bit number register
				oTX 			 		<= '1'; 
			when HANDSHAKE =>
				sDATA_BIT_EN		<= '1';
				oTX 			 		<= '1';				
			when START =>	
				sTC_CNT_EN	 		<= '1'; -- Start countig 
				if (sTC_CNT_DONE = '1') then -- Load form data from FIFO 
					sDATA_LOAD	 <= '1';
					oTX_READY 	 <= '1';				
				end if;			
			when DATA =>	
				sTC_CNT_EN	 		<= '1';  
				sDATA_CNT_EN 		<= '1'; -- Count data bits 				
				sSHW_EN		 		<= '1'; -- Shift data bits  
				oTX 			 		<= sSHW_REG(0); -- LSB of shift register is current data bit to transmitt
			when PARITY =>	
				sTC_CNT_EN	 		<= '1';
				oTX			 		<= sPARITY;	-- Transmitt parity bit			
			when STOP =>	
				sTC_CNT_EN	 		<= '1';
				oTX			 		<= '1';	
		end case;		
	end process fsm_out;	
	
	-- Terminal count counter process
	tc_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sTC_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sTC_CNT = TC_PERIOD - 1) then -- Check counted periods 
				sTC_CNT <= (others => '0'); 
			elsif (iTC = '1' and sTC_CNT_EN = '1') then -- Check for counter enable
				sTC_CNT <= sTC_CNT + 1; -- Count terminal counts 
			end if;		
		end if;
	end process tc_cnt;

	-- Terminal count done statement
	sTC_CNT_DONE <= '1' when sTC_CNT = TC_PERIOD - 1 else 
						 '0';			
						 
	-- Data bits counter process
	data_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sDATA_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sDATA_CNT = sDATA_BIT_REG and sTC_CNT_DONE = '1') then -- Reset counter if all bits was sent
				sDATA_CNT <= (others => '0');
			elsif (sDATA_CNT_EN = '1' and sTC_CNT_DONE = '1') then -- Check for enable signal and for terminal count counter
				sDATA_CNT <= sDATA_CNT + 1; -- Count data bits			
			end if;
		end if;
	end process data_cnt;
	
	-- Shift register process
	shift_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sSHW_REG <= (others => '0'); -- Reset shifter
		elsif (iCLK'event and iCLK = '1') then
			if (sDATA_LOAD = '1') then -- Load data from FIFO
				sSHW_REG <= iDATA;
			elsif (sSHW_EN = '1' and sTC_CNT_DONE = '1') then -- Check for shift enable
				sSHW_REG <= '0' & sSHW_REG(DATA_WIDTH - 1 downto 1); -- Shift data bits
			end if;
		end if;
	end process shift_reg;
	
	-- Data bit number register
	data_bit_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sDATA_BIT_REG <= cDATA_8_BIT;  -- Set to default bit number
		elsif (iCLK'event and iCLK = '1') then	
			if (sDATA_BIT_EN = '1') then
				sDATA_BIT_REG <= sDATA_BIT; -- Set data bit number
			end if;
		end if;
	end process data_bit_reg;
	
	-- Baud data bit signal generator
	data_bit : process (iDATA_SEL) begin
		-- Generate data bits depend on input configurarion
		case (iDATA_SEL) is
			when "00"   =>
				sDATA_BIT <= cDATA_5_BIT;
			when "01"   =>
				sDATA_BIT <= cDATA_6_BIT;
			when "10"   =>
				sDATA_BIT <= cDATA_7_BIT;
			when others =>
				sDATA_BIT <= cDATA_8_BIT;
		end case;
	end process data_bit;	
	
	
	-- Parity bit generator contains register for data and parity generator
	
	-- Parity register process
	parity_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sPARITY_REG <= (others => '0'); -- Reset register
		elsif (iCLK'event and iCLK = '1') then
			if (sDATA_LOAD = '1') then -- Load data from input
				sPARITY_REG <= iDATA;
			end if;	
		end if;	
	end process parity_reg;
	
	-- Parity check signal generator
	parity_gen : process (sSHW_REG, iPARITY, sDATA_BIT_REG, sPARITY_REG) begin
		-- Generate parity bit depend on data bit number
		case (sDATA_BIT_REG) is
			when cDATA_5_BIT =>
				-- Check parity input
				if (iPARITY = '1') then
					sPARITY <=	not (sPARITY_REG(0) xor sPARITY_REG(1) xor sPARITY_REG(2) xor sPARITY_REG(3) xor sPARITY_REG(4) ); -- Odd parity 
				else
					sPARITY <=	     sPARITY_REG(0) xor sPARITY_REG(1) xor sPARITY_REG(2) xor sPARITY_REG(3) xor sPARITY_REG(4) ; -- Even parity
				end if;		
			when cDATA_6_BIT =>	
				-- Check parity input
				if (iPARITY = '1') then
					sPARITY <=	not (sPARITY_REG(0) xor sPARITY_REG(1) xor sPARITY_REG(2) xor sPARITY_REG(3) xor sPARITY_REG(4) xor sPARITY_REG(5) ); -- Odd parity 
				else
					sPARITY <=	     sPARITY_REG(0) xor sPARITY_REG(1) xor sPARITY_REG(2) xor sPARITY_REG(3) xor sPARITY_REG(4) xor sPARITY_REG(5) ; -- Even parity
				end if;									
			when cDATA_7_BIT =>		
				-- Check parity input
				if (iPARITY = '1') then
					sPARITY <=	not (sPARITY_REG(0) xor sPARITY_REG(1) xor sPARITY_REG(2) xor sPARITY_REG(3) xor sPARITY_REG(4) xor sPARITY_REG(5) xor sPARITY_REG(6) ); -- Odd parity 
				else
					sPARITY <=	     sPARITY_REG(0) xor sPARITY_REG(1) xor sPARITY_REG(2) xor sPARITY_REG(3) xor sPARITY_REG(4) xor sPARITY_REG(5) xor sPARITY_REG(6) ; -- Even parity
				end if;				
			when others 	  =>
				-- Check parity input
				if (iPARITY = '1') then
					sPARITY <=	not (sPARITY_REG(0) xor sPARITY_REG(1) xor sPARITY_REG(2) xor sPARITY_REG(3) xor sPARITY_REG(4) xor sPARITY_REG(5) xor sPARITY_REG(6) xor sPARITY_REG(7)); -- Odd parity 
				else
					sPARITY <=	     sPARITY_REG(0) xor sPARITY_REG(1) xor sPARITY_REG(2) xor sPARITY_REG(3) xor sPARITY_REG(4) xor sPARITY_REG(5) xor sPARITY_REG(6) xor sPARITY_REG(7); -- Even parity
				end if;								
		end case;
	end process parity_gen;

	
end Behavioral;

