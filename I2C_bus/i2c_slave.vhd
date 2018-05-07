----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:59:01 05/04/2018 
-- Design Name: 
-- Module Name:    i2c_slave - Behavioral 
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


entity i2c_slave is
	 Generic(
		REGISTER_NUM	: integer := 16;  										-- Number of slave registers
		TC_PERIOD		: integer := 12;  										-- Terminal count period for ack state
		DATA_WIDTH 		: integer := 8; 											-- Data width
		SLAVE_ADDRESS  : std_logic_vector(6 downto 0) := "1010101"     -- Slave address (7 bit address)
	 );
    Port ( iCLK 	: in  	std_logic;
           inRST 	: in  	std_logic;
			  iTC		: in 		std_logic;
           iSCL 	: in  	std_logic;
           ioSDA  : inout  std_logic);
end i2c_slave;

architecture Behavioral of i2c_slave is

	type   tSTATES is (IDLE, START, SLAVE_ADDRESS_MODE, SLAVE_ADDRESS_ACK, REGISTER_ADDRESS, STOP, 
							 REGISTER_ACK, REGISTER_NACK, READ_DATA, READ_ACK, WRITE_DATA, WRITE_ACK); 	      -- Slave FSM states type																

	signal sCURRENT_STATE 	   : tSTATES;																				 		-- Slave FSM current state
	signal sNEXT_STATE    	   : tSTATES; 																			 		-- Slave FSM next state

	signal sDEC  			 	   : std_logic_vector(REGISTER_NUM - 1 downto 0);
	signal sISHW_REG				: std_logic_vector(DATA_WIDTH	  - 1 downto 0);
	signal sISHW_EN				: std_logic;

	type   tREGS is array (REGISTER_NUM - 1 downto 0) of std_logic_vector(DATA_WIDTH - 1 downto 0);    -- Slave registers type
	signal sREGS : tREGS;		
																																	   -- Slave registers  
	signal sOUT_BUFF_EN	 	   : std_logic;																					-- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	   : std_logic;																					-- Input tri-state buffer enable

	signal sSDA_IN			 	   : std_logic;																					-- SDA input signal
	signal sSDA_OUT 		 	   : std_logic;																					-- SDA output signal

	signal sDATA_CNT 		 	   : unsigned(3 downto 0);																	-- Data counter
	signal sDATA_CNT_EN 	 	   : std_logic;																					-- Data counter enable		

	signal sPERIOD_CNT 		   : unsigned(3 downto 0);																	-- Data counter
	signal sPERIOD_CNT_EN 	   : std_logic;																					-- Data counter enable

	signal sSLAVE_ADDRESS_OK   : std_logic;
	
	signal sTC_PERIOD_CNT_DONE : std_logic;
	signal sSCL_RISING_EDGE    : std_logic;
	
begin

	-- Generate slave registers
	reg_gen : for i in 0 to REGISTER_NUM - 1 generate
		eSLAVE_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sDEC(i),
				iD    => sISHW_REG,
				oQ		=> sREGS(i)
			);
	end generate reg_gen;
	
	-- Rising edge detector
	eEDGE_DET : entity work.rising_edge_det
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iSIG  => iSCL,
				oEDGE => sSCL_RISING_EDGE
			);

	-- FSM state register process
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then 
			sCURRENT_STATE <= IDLE; -- Reset FSM
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE; -- Move to next state
		end if;
	end process fsm_reg;
	
	-- Slave FSM next state logic
	fsm_next : process (sCURRENT_STATE, iSCL, ioSDA, sTC_PERIOD_CNT_DONE) begin
		case (sCURRENT_STATE) is
			when IDLE =>
				-- Wait for start condition
				if (iSCL = '1' and ioSDA = '0') then
					sNEXT_STATE <= START;   
				else
					sNEXT_STATE <= IDLE;
				end if;
			when START =>
				-- Wait for slave address
				if (iSCL = '0' and ioSDA = '0') then
					sNEXT_STATE <= SLAVE_ADDRESS_MODE; -- Get slave address and operation 
				else 
					sNEXT_STATE <= START;
				end if;
			when SLAVE_ADDRESS_MODE =>
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT_DONE = '1') then
					if (sSLAVE_ADDRESS_OK = '1') then 
						sNEXT_STATE <= SLAVE_ADDRESS_ACK; -- If it is a slave address generate ack
					else
						sNEXT_STATE <= STOP; -- Otherwise wait for stop condition
					end if;
				else
					sNEXT_STATE <= SLAVE_ADDRESS_MODE;
				end if;
			when others =>
				sNEXT_STATE <= IDLE;
		end case;
	end process fsm_next;
	
	-- Reciver FSM output logic
	fsm_out : process (sCURRENT_STATE, sDATA_CNT) begin
		case (sCURRENT_STATE) is
			when IDLE   				=>
				sIN_BUFF_EN	 	<= '1';
				sOUT_BUFF_EN 	<= '0';
				sDATA_CNT_EN   <= '0';
				sPERIOD_CNT_EN <= '0';
				sISHW_EN			<= '0';
			when START  				=> 
				sIN_BUFF_EN	 	<= '1';
				sOUT_BUFF_EN 	<= '0';
				sDATA_CNT_EN 	<= '0';
				sPERIOD_CNT_EN <= '0';
				sISHW_EN			<= '0';
			when SLAVE_ADDRESS_MODE =>		
				sIN_BUFF_EN	 	<= '1';
				sOUT_BUFF_EN 	<= '0';	
				sDATA_CNT_EN 	<= '1';
				if (sDATA_CNT = DATA_WIDTH) then
					sPERIOD_CNT_EN <= '1';
					sISHW_EN			<= '0';
				else
					sPERIOD_CNT_EN <= '0';
					sISHW_EN			<= '1';
				end if;
			when SLAVE_ADDRESS_ACK =>	
				sIN_BUFF_EN	 	<= '0';
				sOUT_BUFF_EN 	<= '1';
				sDATA_CNT_EN 	<= '0';
				sPERIOD_CNT_EN <= '0';
				sISHW_EN			<= '0';				
			when others =>	
				sIN_BUFF_EN	 	<= '1';
				sOUT_BUFF_EN 	<= '0';
				sDATA_CNT_EN 	<= '0';
				sPERIOD_CNT_EN <= '0';
				sISHW_EN			<= '0';
		end case;
	end process fsm_out;
	
	-- Data counter process						
	data_cnt : process (iCLK, inRST) begin				
		if (inRST = '0') then
			sDATA_CNT <= (others => '0'); -- Reset counter		
		elsif (iCLK'event and iCLK = '1') then	
			if (sTC_PERIOD_CNT_DONE = '1') then 
				sDATA_CNT <= (others => '0'); -- Reset counter when all data recived and period elapsed
			elsif (sSCL_RISING_EDGE = '1' and sDATA_CNT_EN = '1') then
				sDATA_CNT <= sDATA_CNT + 1; -- Count data bits
			end if;	
		end if;
	end process data_cnt;
	
	-- Period counter
	per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sPERIOD_CNT <= (others => '0'); -- Reset counter 
		elsif (iCLK'event and iCLK = '1') then
			if (sPERIOD_CNT = TC_PERIOD - 1) then -- Check counted periods
				sPERIOD_CNT <= (others => '0'); 
			elsif (iTC = '1' and sPERIOD_CNT_EN = '1') then 
				sPERIOD_CNT <= sPERIOD_CNT + 1; -- Count period
			end if;
		end if;
	end process per_cnt;
	
	-- Period counter terminal count 
	sTC_PERIOD_CNT_DONE <= '1' when sPERIOD_CNT = TC_PERIOD - 1 else
								  '0';
	
	-- Shift register process		
	shift_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sISHW_REG <= (others => '0'); -- Reset shifter
		elsif (iCLK'event and iCLK = '1') then
			if (sISHW_EN = '1' and sSCL_RISING_EDGE = '1') then
				sISHW_REG <= sISHW_REG(DATA_WIDTH - 2 downto 0) & ioSDA; -- Shift data bits
			end if;
		end if;
	end process shift_reg;
	
	-- Check slave address
	sSLAVE_ADDRESS_OK <= '1' when sISHW_REG(7 downto 1) = SLAVE_ADDRESS else
								'0';
	
	sDEC <= (others => '0');	
	sSDA_OUT <= '1'; 
	

	-- Input tri-state buffer
	sSDA_IN  <= ioSDA 	when sIN_BUFF_EN  = '1' else  
				   'Z';
	-- Output tri-state buffer
	ioSDA    <= sSDA_OUT when sOUT_BUFF_EN = '1' else  
				   'Z';				  

end Behavioral;

