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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity i2c_slave is
	 Generic(
		REGISTER_NUM		: integer := 16;  										-- Number of slave registers
		TC_PERIOD			: integer := 12;  										-- Terminal count period for ack start
		TR_PERIOD			: integer := 16;  										-- Slave transmission peirod
		DATA_WIDTH 			: integer := 8; 											-- Data width
		DATA_CNT_WIDTH 	: integer := 4;											-- Data counter width
		PERIOD_CNT_WIDTH  : integer := 4;											-- Data counter width
		SLAVE_ADDRESS  	: std_logic_vector(6 downto 0) := "1010101"     -- Slave address (7 bit address)
	 );
    Port ( iCLK 	: in  	std_logic;
           inRST 	: in  	std_logic;
			  iTC		: in 		std_logic;
           iSCL 	: in  	std_logic;
           ioSDA  : inout  std_logic);
end i2c_slave;

architecture Behavioral of i2c_slave is

	-- ACK and NACK constant 
	constant cACK  : std_logic := '0';
	constant cNACK : std_logic := '1';

	type   tSTATES is (IDLE, START, SLAVE_ADDRESS_MODE, SLAVE_ADDRESS_ACK, REGISTER_ADDRESS, REGISTER_ADDRESS_ACK, 
							 REGISTER_ADDRESS_NACK, READ_DATA, READ_ACK, WRITE_DATA, WRITE_ACK, STOP); 	   		-- Slave FSM states type																

	signal sCURRENT_STATE 	   	: tSTATES;																				 		-- Slave FSM current state
	signal sNEXT_STATE    	   	: tSTATES; 																			 			-- Slave FSM next state

	type   tREGS is array (REGISTER_NUM - 1 downto 0) of std_logic_vector(DATA_WIDTH - 1 downto 0);    		-- Slave registers type
	signal sREGS : tREGS;		
																																				-- Slave registers  
	signal sOUT_BUFF_EN	 	   	: std_logic;																					-- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	   	: std_logic;																					-- Input tri-state buffer enable

	signal sSDA_IN			 	   	: std_logic;																					-- SDA input signal
	signal sSDA_OUT 		 	   	: std_logic;																					-- SDA output signal

	signal sDATA_CNT 		 	   	: unsigned(DATA_CNT_WIDTH - 1 downto 0);												-- Data counter
	signal sDATA_CNT_EN 	 	   	: std_logic;																					-- Data counter enable		
	signal sDATA_CNT_RST				: std_logic;																					-- Data counter reset signal

	signal sPERIOD_CNT 		   	: unsigned(PERIOD_CNT_WIDTH downto 0);													-- Period counter
	signal sPERIOD_CNT_EN 	   	: std_logic;																					-- Period counter enable
	signal sTC_PERIOD_CNT 			: std_logic;

	signal sTR_PERIOD_CNT 			: unsigned(PERIOD_CNT_WIDTH downto 0);													-- Slave transmission period
	signal sTR_PERIOD_CNT_EN 		: std_logic;																					-- Slave transmission period enable
	signal sTC_TR_PERIOD_CNT 		: std_logic;																					-- Slave transmission period terminal count

	signal sSLAVE_ADDRESS_OK   	: std_logic;																					-- Slave address 
	signal sREGISTER_ADDRESS_OK   : std_logic;																					-- Slave address 	
	
	signal sSCL_RISING_EDGE    	: std_logic;																					-- SCL rising edge indication
	signal sSDA_RISING_EDGE    	: std_logic;																					-- SDA rising edge indication
	
	signal sACK							: std_logic;																					-- Acknowelge signal from mux
	signal sACK_SEL					: std_logic;																					-- Acknowelge select signal 
	
	signal sSDA_SEL					: std_logic;																					-- SDA line data select

	signal sISHW_REG					: std_logic_vector(DATA_WIDTH	- 1 downto 0);											-- Input shift register
	signal sISHW_EN					: std_logic;																					-- Input shift register enable	
	signal sOSHW_REG					: std_logic_vector(DATA_WIDTH	- 1 downto 0);											-- Output shift register
	signal sOSHW_EN					: std_logic;																					-- Output shift register enable
	signal sOSHW_LOAD					: std_logic;																					-- Shift load signal
		
	signal sREG_MUX					: std_logic_vector(DATA_WIDTH	    - 1 downto 0);									-- Register multiplexer
	signal sREG_MUX_SEL				: std_logic_vector(3 downto 0);															-- Register multiplexer select
		
	signal sREG_DEC					: std_logic_vector(2 * DATA_WIDTH - 1 downto 0);									-- Register decoder
	signal sREG_DEC_SEL				: std_logic_vector(3 downto 0);															-- Register decoder input
	signal sREG_DEC_EN				: std_logic;																					-- Register decoder enable	
	
	signal sADDR_REG					: std_logic_vector(3 downto 0);															-- Register address register
	signal sADDR_REG_EN				: std_logic;																					-- Register address register enable
	
	signal sMODE_FF					: std_logic;																					-- R/W mode flip-flop
	signal sMODE_FF_EN				: std_logic;																					-- R/W mode flip-flop enable
	
begin

	-- Generate slave registers
	reg_gen : for i in 0 to REGISTER_NUM - 1 generate
		eSLAVE_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sREG_DEC(i),
				iD    => sISHW_REG,
				oQ		=> sREGS(i)
			);
	end generate reg_gen;
	
	-- Register address register
	eREG_ADDR_REG : entity work.reg
		Generic map (
			DATA_WIDTH => 4
		)
		Port map(
			iCLK  => iCLK,
			inRST => inRST,
			iWE   => sADDR_REG_EN,
			iD    => sISHW_REG(3 downto 0),
			oQ		=> sADDR_REG
		);

	-- SCL rising edge detector
	eSCL_EDGE_DET : entity work.rising_edge_det
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iSIG  => iSCL,
				oEDGE => sSCL_RISING_EDGE
			);
			
	-- SDA rising edge detector
	eSDA_EDGE_DET : entity work.rising_edge_det
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iSIG  => ioSDA,
				oEDGE => sSDA_RISING_EDGE
			);			
	
	-- Mode R/W flip-flop 
	mode_ff : process (iCLK, inRST) begin
		if (inRST = '0') then
			sMODE_FF <= '0'; -- Reset flip-flop
		elsif (iCLK'event and iCLK = '1') then
			if (sMODE_FF_EN = '1') then
				sMODE_FF <= sISHW_REG(0); -- Get mode R or W
			end if;
		end if;
	end process mode_ff;

	-- FSM state register process
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then 
			sCURRENT_STATE <= IDLE; -- Reset FSM
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE; -- Move to next state
		end if;
	end process fsm_reg;
	
	-- Slave FSM next state logic
	fsm_next : process (sCURRENT_STATE, iSCL, ioSDA, sSDA_RISING_EDGE, sTC_PERIOD_CNT, sTC_TR_PERIOD_CNT, sMODE_FF) begin
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
				if (sTC_PERIOD_CNT = '1') then
					if (sSLAVE_ADDRESS_OK = '1') then 
						sNEXT_STATE <= SLAVE_ADDRESS_ACK; -- If it is a slave address generate ack
					else
						sNEXT_STATE <= STOP; -- Otherwise wait for stop condition
					end if;
				else
					sNEXT_STATE <= SLAVE_ADDRESS_MODE;	
				end if;
			when SLAVE_ADDRESS_ACK =>
				if (sTC_TR_PERIOD_CNT = '1') then 
					sNEXT_STATE <= REGISTER_ADDRESS;	-- If transmission for ack period done	get register address
				else
					sNEXT_STATE <= SLAVE_ADDRESS_ACK;
				end if;
			when REGISTER_ADDRESS =>
				-- Check if stop condition was generated by master 
				if (iSCL = '1' and sSDA_RISING_EDGE = '1') then
					sNEXT_STATE <= IDLE;
				-- Check if period elapsed 
				elsif (sTC_PERIOD_CNT = '1') then
					if (sREGISTER_ADDRESS_OK = '1') then 
						sNEXT_STATE <= REGISTER_ADDRESS_ACK; -- If it is correct slave register address generate ack
					else
						sNEXT_STATE <= REGISTER_ADDRESS_NACK; -- Otherwise generate nack
					end if;
				else
					sNEXT_STATE <= REGISTER_ADDRESS;	
				end if;	
			when REGISTER_ADDRESS_ACK =>
				-- Check if transmission period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then
					if (sMODE_FF = '0') then
						sNEXT_STATE <= READ_DATA;	-- If transmission for ack period done	get data byte form master
					else 
						sNEXT_STATE <= WRITE_DATA; -- If transmission for ack period done	write register data to master
					end if;	
				else
					sNEXT_STATE <= REGISTER_ADDRESS_ACK;
				end if;			
			when REGISTER_ADDRESS_NACK =>
				if (sTC_TR_PERIOD_CNT = '1') then 
					sNEXT_STATE <= STOP;	-- If transmission for nack period done	
				else
					sNEXT_STATE <= REGISTER_ADDRESS_NACK;
				end if;	
			when READ_DATA	=>
				-- Check if period elapsed if read data form master
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= READ_ACK;
				else
					sNEXT_STATE <= READ_DATA;	
				end if;		
			when READ_ACK =>
				if (sTC_TR_PERIOD_CNT = '1') then 
					sNEXT_STATE <= REGISTER_ADDRESS;	-- If transmission for ack period done	get data byte
				else
					sNEXT_STATE <= READ_ACK;
				end if;
			when WRITE_DATA =>
				-- Check if period elapsed if read data form master
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= WRITE_ACK;
				else
					sNEXT_STATE <= WRITE_DATA;	
				end if;	
			when WRITE_ACK =>
				if (sTC_TR_PERIOD_CNT = '1') then 
					if (ioSDA = '0') then
						sNEXT_STATE <= REGISTER_ADDRESS;	-- If transmission for ack period done	write data byte
					else
						sNEXT_STATE <= STOP;	-- Get stop condition
					end if;	
				else
					sNEXT_STATE <= WRITE_ACK;
				end if;				
			when STOP =>
				-- Wait for stop condition
				if (iSCL = '1' and sSDA_RISING_EDGE = '1') then
					sNEXT_STATE <= IDLE;   
				else
					sNEXT_STATE <= STOP;
				end if;				
			when others =>
				sNEXT_STATE <= IDLE;
		end case;
	end process fsm_next;
	
	-- Reciver FSM output logic
	fsm_out : process (sCURRENT_STATE, sDATA_CNT, sMODE_FF, sADDR_REG) begin
		case (sCURRENT_STATE) is
			-- Slave control signals
			when IDLE =>
				sIN_BUFF_EN	 		<= '1';
				sOUT_BUFF_EN 		<= '0';
				sDATA_CNT_EN   	<= '0';
				sDATA_CNT_RST 		<= '1';
				sPERIOD_CNT_EN 	<= '0';
				sTR_PERIOD_CNT_EN <= '0';
				sADDR_REG_EN		<= '0';
				sMODE_FF_EN			<= '0';
				sISHW_EN				<= '0';
				sOSHW_EN				<= '0';
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';
				sACK_SEL				<= '0';
				sSDA_SEL				<= '0';
			when START => 
				sIN_BUFF_EN	 		<= '1';
				sOUT_BUFF_EN 		<= '0';
				sDATA_CNT_EN 		<= '0';
				sDATA_CNT_RST 		<= '0';
				sPERIOD_CNT_EN 	<= '0';
				sTR_PERIOD_CNT_EN <= '0';
				sADDR_REG_EN		<= '0';
				sMODE_FF_EN			<= '0';
				sISHW_EN				<= '0';
				sOSHW_EN				<= '0';
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';	
				sACK_SEL				<= '0';
				sSDA_SEL				<= '0';				
			when SLAVE_ADDRESS_MODE =>		
				sIN_BUFF_EN	 		<= '1';
				sOUT_BUFF_EN 		<= '0';	
				sDATA_CNT_EN 		<= '1';
				sDATA_CNT_RST 		<= '0';
				sADDR_REG_EN		<= '0';
				if (sDATA_CNT = DATA_WIDTH) then
					sMODE_FF_EN		<= '1';
					sPERIOD_CNT_EN <= '1';
					sISHW_EN			<= '0';
				else
					sMODE_FF_EN		<= '0';
					sPERIOD_CNT_EN <= '0';
					sISHW_EN			<= '1';
				end if;
				sTR_PERIOD_CNT_EN <= '0';
				sOSHW_EN				<= '0';
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';
				sACK_SEL				<= '0';
				sSDA_SEL				<= '0';
			when SLAVE_ADDRESS_ACK =>	
				sIN_BUFF_EN	 		<= '0';
				sOUT_BUFF_EN 		<= '1';
				sDATA_CNT_EN 		<= '0';
				sDATA_CNT_RST 		<= '0';
				sPERIOD_CNT_EN 	<= '0';
				sTR_PERIOD_CNT_EN <= '1';
				sADDR_REG_EN		<= '0';
				sMODE_FF_EN			<= '0';				
				sISHW_EN				<= '0';
				sOSHW_EN				<= '0';
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';	
				sACK_SEL				<= '0';
				sSDA_SEL				<= '0';	
			when REGISTER_ADDRESS =>		
				sIN_BUFF_EN	 		<= '1';
				sOUT_BUFF_EN 		<= '0';	
				sDATA_CNT_EN 		<= '1';
				sDATA_CNT_RST 		<= '0';
				sMODE_FF_EN			<= '0';
				if (sDATA_CNT = DATA_WIDTH) then
					sPERIOD_CNT_EN <= '1';
					sADDR_REG_EN	<= '1';
					sISHW_EN			<= '0';
				else
					sPERIOD_CNT_EN <= '0';
					sADDR_REG_EN	<= '0';
					sISHW_EN			<= '1';
				end if;
				sTR_PERIOD_CNT_EN <= '0';
				sOSHW_EN				<= '0';
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';
				sACK_SEL				<= '0';
				sSDA_SEL				<= '0';	
			when REGISTER_ADDRESS_ACK =>	
				sIN_BUFF_EN	 		<= '0';
				sOUT_BUFF_EN 		<= '1';
				sDATA_CNT_EN 		<= '0';
				sDATA_CNT_RST 		<= '0';
				sPERIOD_CNT_EN 	<= '0';
				sTR_PERIOD_CNT_EN <= '1';
				sADDR_REG_EN		<= '0';
				sMODE_FF_EN			<= '0';
				sISHW_EN				<= '0';
				sOSHW_EN				<= '0';
				if (sMODE_FF = '1') then
					sOSHW_LOAD		<= '1';
					sREG_MUX_SEL	<= sADDR_REG;
				else 
					sOSHW_LOAD		<= '0';
					sREG_MUX_SEL	<= "0000";	
				end if;		
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';	
				sACK_SEL				<= '0';
				sSDA_SEL				<= '0';		
			when REGISTER_ADDRESS_NACK =>	
				sIN_BUFF_EN	 		<= '0';
				sOUT_BUFF_EN 		<= '1';
				sDATA_CNT_EN 		<= '0';
				sDATA_CNT_RST 		<= '0';
				sPERIOD_CNT_EN 	<= '0';
				sTR_PERIOD_CNT_EN <= '1';
				sADDR_REG_EN		<= '0';
				sMODE_FF_EN			<= '0';
				sISHW_EN				<= '0';
				sOSHW_EN				<= '0';
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';	
				sACK_SEL				<= '1';
				sSDA_SEL				<= '0';		
			when READ_DATA =>		
				sIN_BUFF_EN	 		<= '1';
				sOUT_BUFF_EN 		<= '0';	
				sDATA_CNT_EN 		<= '1';
				sDATA_CNT_RST 		<= '0';
				sADDR_REG_EN		<= '0';
				sMODE_FF_EN			<= '0';
				if (sDATA_CNT = DATA_WIDTH) then
					sPERIOD_CNT_EN <= '1';
					sISHW_EN			<= '0';
					sREG_DEC_SEL	<= sADDR_REG;
					sREG_DEC_EN		<= '1';
				else
					sPERIOD_CNT_EN <= '0';
					sISHW_EN			<= '1';
					sREG_DEC_SEL	<= "0000";
					sREG_DEC_EN		<= '0';
				end if;
				sTR_PERIOD_CNT_EN <= '0';
				sOSHW_EN				<= '0';
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sACK_SEL				<= '0';
				sSDA_SEL				<= '0';		
			when READ_ACK =>	
				sIN_BUFF_EN	 		<= '0';
				sOUT_BUFF_EN 		<= '1';
				sDATA_CNT_EN 		<= '0';
				sDATA_CNT_RST 		<= '0';
				sPERIOD_CNT_EN 	<= '0';
				sTR_PERIOD_CNT_EN <= '1';
				sADDR_REG_EN		<= '0';
				sMODE_FF_EN			<= '0';
				sISHW_EN				<= '0';
				sOSHW_EN				<= '0';
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';	
				sACK_SEL				<= '0';
				sSDA_SEL				<= '0';					
			when WRITE_DATA =>		
				sIN_BUFF_EN	 		<= '0';
				sOUT_BUFF_EN 		<= '1';	
				sDATA_CNT_EN 		<= '1';
				sDATA_CNT_RST 		<= '0';
				sADDR_REG_EN		<= '0';
				sMODE_FF_EN			<= '0';
				sISHW_EN				<= '0';
				if (sDATA_CNT = DATA_WIDTH) then
					sPERIOD_CNT_EN 	<= '1';
					sTR_PERIOD_CNT_EN <= '0';
					sOSHW_EN				<= '0';
				else
					sPERIOD_CNT_EN 	<= '0';
					sTR_PERIOD_CNT_EN <= '1';
					sOSHW_EN				<= '1';
				end if;
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';
				sACK_SEL				<= '0';
				sSDA_SEL				<= '1';				
			when WRITE_ACK =>	
				sIN_BUFF_EN	 		<= '1';
				sOUT_BUFF_EN 		<= '0';
				sDATA_CNT_EN 		<= '0';
				sDATA_CNT_RST 		<= '0';
				sPERIOD_CNT_EN 	<= '0';
				sTR_PERIOD_CNT_EN <= '1';
				sADDR_REG_EN		<= '0';
				sMODE_FF_EN			<= '0';
				sISHW_EN				<= '0';
				sOSHW_EN				<= '0';
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';	
				sACK_SEL				<= '0';
				sSDA_SEL				<= '0';				
			when STOP =>
				sIN_BUFF_EN	 		<= '1';
				sOUT_BUFF_EN 		<= '0';
				sDATA_CNT_EN  		<= '0';
				sDATA_CNT_RST 		<= '0';
				sPERIOD_CNT_EN 	<= '0';
				sTR_PERIOD_CNT_EN <= '0';
				sADDR_REG_EN		<= '0';
				sMODE_FF_EN			<= '0';
				sISHW_EN				<= '0';	
				sOSHW_EN				<= '0';
				sOSHW_LOAD			<= '0';
				sREG_MUX_SEL		<= "0000";
				sREG_DEC_SEL		<= "0000";
				sREG_DEC_EN			<= '0';		
				sACK_SEL				<= '0';
				sSDA_SEL				<= '0';							
		end case;
	end process fsm_out;
	
	-- Data counter process						
	data_cnt : process (iCLK, inRST) begin				
		if (inRST = '0') then
			sDATA_CNT <= (others => '0'); -- Reset counter		
		elsif (iCLK'event and iCLK = '1') then	
			if (sTC_PERIOD_CNT = '1' or sDATA_CNT_RST = '1') then 
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
	sTC_PERIOD_CNT <= '1' when sPERIOD_CNT = TC_PERIOD - 1 else
								  '0';
								  
	-- Transmission period counter
	tr_per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sTR_PERIOD_CNT <= (others => '0'); -- Reset counter 
		elsif (iCLK'event and iCLK = '1') then
			if (sTR_PERIOD_CNT = TR_PERIOD - 1) then -- Check counted periods
				sTR_PERIOD_CNT <= (others => '0'); 
			elsif (iTC = '1' and sTR_PERIOD_CNT_EN = '1') then 
				sTR_PERIOD_CNT <= sTR_PERIOD_CNT + 1; -- Count period
			end if;
		end if;
	end process tr_per_cnt;
	
	-- Transmission period counter terminal count 
	sTC_TR_PERIOD_CNT <= '1' when sTR_PERIOD_CNT = TR_PERIOD - 1 else
								'0'; 							  
	
	-- Input shift register process		
	ishift_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sISHW_REG <= (others => '0'); -- Reset shifter
		elsif (iCLK'event and iCLK = '1') then
			if (sISHW_EN = '1' and sSCL_RISING_EDGE = '1') then
				sISHW_REG <= sISHW_REG(DATA_WIDTH - 2 downto 0) & ioSDA; -- Shift data bits
			end if;
		end if;
	end process ishift_reg;
	
	-- Output shift register process
	oshift_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sOSHW_REG <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then	
			if (sOSHW_LOAD = '1') then
				sOSHW_REG <= sREG_MUX; -- Load data to register
			elsif (sOSHW_EN = '1' and sTC_TR_PERIOD_CNT = '1') then -- When data bit transsmited shift for next data bit
				sOSHW_REG <= sOSHW_REG(DATA_WIDTH - 2 downto 0) & '0'; -- Shift data bits
			end if;	
		end if;
	end process oshift_reg;
	
	-- Registers multiplexer process
	reg_mux : process (sREG_MUX_SEL, sREGS) begin
		-- Select register
		case (sREG_MUX_SEL) is
			when "0000" =>
				sREG_MUX <= sREGS(0);
			when "0001" =>
				sREG_MUX <= sREGS(1);
			when "0010" =>
				sREG_MUX <= sREGS(2);
			when "0011" =>
				sREG_MUX <= sREGS(3);
			when "0100" =>
				sREG_MUX <= sREGS(4);
			when "0101" =>
				sREG_MUX <= sREGS(5);
			when "0110" =>
				sREG_MUX <= sREGS(6);
			when "0111" =>
				sREG_MUX <= sREGS(7);
			when "1000" =>
				sREG_MUX <= sREGS(8);
			when "1001" =>
				sREG_MUX <= sREGS(9);
			when "1010" =>
				sREG_MUX <= sREGS(10);
			when "1011" =>
				sREG_MUX <= sREGS(11);
			when "1100" =>
				sREG_MUX <= sREGS(12);
			when "1101" =>
				sREG_MUX <= sREGS(13);				
			when "1110" =>
				sREG_MUX <= sREGS(14);
			when others =>
				sREG_MUX <= sREGS(15);		
		end case;
	end process reg_mux;
	
	-- Register decoder
	sREG_DEC <= "0000000000000000" when sREG_DEC_EN  = '0'     else -- Don't write to registers
					"0000000000000001" when sREG_DEC_SEL = "0000"  else
					"0000000000000010" when sREG_DEC_SEL = "0001"  else
					"0000000000000100" when sREG_DEC_SEL = "0010"  else
					"0000000000001000" when sREG_DEC_SEL = "0011"  else
					"0000000000010000" when sREG_DEC_SEL = "0100"  else	
					"0000000000100000" when sREG_DEC_SEL = "0101"  else
					"0000000001000000" when sREG_DEC_SEL = "0110"  else
					"0000000010000000" when sREG_DEC_SEL = "0111"  else
					"0000000100000000" when sREG_DEC_SEL = "1000"  else
					"0000001000000000" when sREG_DEC_SEL = "1001"  else
					"0000010000000000" when sREG_DEC_SEL = "1010"  else
					"0000100000000000" when sREG_DEC_SEL = "1011"  else
					"0001000000000000" when sREG_DEC_SEL = "1100"  else
					"0010000000000000" when sREG_DEC_SEL = "1101"  else
					"0100000000000000" when sREG_DEC_SEL = "1110"  else
					"1000000000000000";
	
	-- Check slave address
	sSLAVE_ADDRESS_OK 	<= '1' when sISHW_REG(7 downto 1)   = SLAVE_ADDRESS else
									'0';
								
	-- Check slave register address
	sREGISTER_ADDRESS_OK <= '1' when CONV_INTEGER(sISHW_REG) < REGISTER_NUM  else
									'0';							
	
	-- Acknowelge multiplexer
	sACK 		<= cACK 		when sACK_SEL = '0' else
					cNACK;
	
	-- Output data multiplexer
	sSDA_OUT	<= sACK  	when sSDA_SEL = '0' else 		  
					sOSHW_REG(7);
		
	-- Input tri-state buffer
	sSDA_IN  <= ioSDA 	when sIN_BUFF_EN  = '1' else  
				   'Z';
	-- Output tri-state buffer
	ioSDA    <= sSDA_OUT when sOUT_BUFF_EN = '1' else  
				   'Z';				  

end Behavioral;

