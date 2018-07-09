----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic
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
		REGISTER_NUM		 		: integer := 16;  										 -- Number of slave registers
		TC_PERIOD			 		: integer := 13;  										 -- Terminal count period for ack start
		TR_PERIOD			 		: integer := 17;  										 -- Slave transmission peirod
		REP_START_PERIOD 			: integer := 9;											 -- Repeated start period
		DATA_WIDTH 			 		: integer := 8; 											 -- Data width
		DATA_CNT_WIDTH 	 		: integer := 4;											 -- Data counter width
		PERIOD_CNT_WIDTH   		: integer := 4;											 -- Period counter width
		RSTART_PERIOD_CNT_WIDTH : integer := 4;									 		 -- Repeat start period counter width
		TR_PERIOD_CNT_WIDTH  	: integer := 5;											 -- Transmission period counter width
		REGISTER_SEL_WIDTH 		: integer := 4; 											 -- Decoder selection width
		SLAVE_ADDRESS  	 		: std_logic_vector(6 downto 0) := "0110001"      -- Slave address (7 bit address)
	 );
    Port ( iCLK 	: in  	std_logic;														 -- Clock signal 50MHz
           inRST 	: in  	std_logic;														 -- Reset signal
           iSCL 	: in  	std_logic;														 -- SCL signal
           ioSDA  : inout  std_logic);														 -- SDA signal
end i2c_slave;

architecture Behavioral of i2c_slave is

	-- ACK and NACK constant 
	constant cACK  : std_logic := '0';  
	constant cNACK : std_logic := '1';

	type   tSTATES is (IDLE, START, SLAVE_ADDRESS_MODE, SLAVE_ADDRESS_ACK, REGISTER_ADDRESS, REGISTER_ADDRESS_ACK, 
							 REGISTER_ADDRESS_NACK, REPEATED_START, READ_DATA, READ_ACK, WRITE_DATA, WRITE_ACK, STOP);  	-- Slave FSM states type																

	signal sCURRENT_STATE 	   	: tSTATES;																				 		-- Slave FSM current state
	signal sNEXT_STATE    	   	: tSTATES; 																			 			-- Slave FSM next state

	type   tREGS is array (REGISTER_NUM - 1 downto 0) of std_logic_vector(2 * DATA_WIDTH - 1 downto 0);    	-- Slave registers type
	signal sREGS : tREGS;		
																																				-- Slave registers  
	signal sOUT_BUFF_EN	 	   	: std_logic;																					-- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	   	: std_logic;																					-- Input tri-state buffer enable

	signal sSDA_IN			 	   	: std_logic;																					-- SDA input signal
	signal sSDA_OUT 		 	   	: std_logic;																					-- SDA output signal

	signal sTC							: std_logic;																					-- Frequency clock divider terminal count 
	signal sFREQ_EN					: std_logic;																					-- Frequency clock divider enable 
	signal sFREQ_RST					: std_logic;																					-- Frequency clock divider reset multiplexer
	signal sFREQ_RST_SEL				: std_logic;																					-- Frequency clock divider reset multiplexer select

	signal sDATA_CNT 		 	   	: unsigned(DATA_CNT_WIDTH - 1 downto 0);												-- Data counter
	signal sDATA_CNT_EN 	 	   	: std_logic;																					-- Data counter enable		
	signal sDATA_CNT_RST				: std_logic;																					-- Data counter reset signal
	
	signal sBYTE_CNT 		 	   	: std_logic_vector(0 downto 0);															-- Data byte counter
	signal sBYTE_CNT_EN 	 	   	: std_logic;																					-- Data byte counter enable		
	signal sBYTE_CNT_RST				: std_logic;																					-- Data byte counter reset signal	

	signal sPERIOD_CNT 		   	: unsigned(PERIOD_CNT_WIDTH - 1 downto 0);											-- Period counter
	signal sPERIOD_CNT_EN 	   	: std_logic;																					-- Period counter enable
	signal sTC_PERIOD_CNT 			: std_logic;																					-- Period counter terminal count

	signal sRSTART_PERIOD_CNT   	: unsigned(RSTART_PERIOD_CNT_WIDTH - 1 downto 0);									-- Repeated start period counter
	signal sRSTART_PERIOD_CNT_EN 	: std_logic;																					-- Repeated start period counter enable
	signal sTC_RSTART_PERIOD_CNT  : std_logic;																					-- Repeated start period counter terminal count

	signal sTR_PERIOD_CNT 			: unsigned(TR_PERIOD_CNT_WIDTH - 1 downto 0);										-- Slave transmission period
	signal sTR_PERIOD_CNT_EN 		: std_logic;																					-- Slave transmission period enable
	signal sTC_TR_PERIOD_CNT 		: std_logic;																					-- Slave transmission period terminal count
	signal sTR_PERIOD_CNT_RST		: std_logic;																					-- Slave transmission period counter reset signal

	signal sSLAVE_ADDRESS_OK   	: std_logic;																					-- Slave address correct indication
	signal sREGISTER_ADDRESS_OK   : std_logic;																					-- Slave address correct indication	
	
	signal sSCL_RISING_EDGE    	: std_logic;																					-- SCL rising edge indication
	signal sSDA_RISING_EDGE    	: std_logic;																					-- SDA rising edge indication
	signal sSDA_FALLING_EDGE    	: std_logic;																					-- SDA falling edge indication
	
	signal sACK							: std_logic;																					-- Acknowelge signal from mux
	signal sACK_SEL					: std_logic;																					-- Acknowelge select signal 
	signal sSDA_SEL					: std_logic;																					-- SDA selection signal
	signal sACK_FF						: std_logic;																					-- Acknowelge flip-flop  
	signal sACK_FF_EN					: std_logic;																					-- Acknowelge flip-flop enable 	

	signal sISHW_REG					: std_logic_vector(DATA_WIDTH	- 1 downto 0);											-- Input shift register
	signal sISHW_EN					: std_logic;																					-- Input shift register enable	
	signal sOSHW_REG					: std_logic_vector(DATA_WIDTH	- 1 downto 0);											-- Output shift register
	signal sOSHW_EN					: std_logic;																					-- Output shift register enable
	signal sOSHW_LOAD					: std_logic;																					-- Shift load signal
		
	signal sREG_MUX					: std_logic_vector(2 * DATA_WIDTH - 1 downto 0);									-- Register byte multiplexer
	signal sREG_BYTE_MUX				: std_logic_vector(DATA_WIDTH		 - 1 downto 0);									-- Registers multiplexer
	signal sREG_MUX_SEL				: std_logic_vector(3 downto 0);															-- Registers multiplexer select
		
	signal sREG_DEC					: std_logic_vector(2 * DATA_WIDTH     - 1 downto 0);								-- Register decoder
	signal sREG_DEC_SEL				: std_logic_vector(REGISTER_SEL_WIDTH - 1 downto 0);								-- Register decoder input
	signal sREG_DEC_EN				: std_logic;																					-- Register decoder enable	
	
	signal sADDR_REG					: std_logic_vector(REGISTER_SEL_WIDTH - 1 downto 0);								-- Register address register
	signal sADDR_REG_EN				: std_logic;																					-- Register address register enable
	
	signal sMODE_FF					: std_logic;																					-- R/W mode flip-flop
	signal sMODE_FF_EN				: std_logic;																					-- R/W mode flip-flop enable
	
	signal sBYTE_SEL					: std_logic;																					-- Upper, lower byte selection signal
	
begin

	-- Generate slave registers
	reg_gen : for i in 0 to REGISTER_NUM - 1 generate
		eSLAVE_REG : entity work.slave_reg 
			Port map(
				iCLK  	 => iCLK,
				inRST 	 => inRST,
				iWE   	 => sREG_DEC(i),
				iBYTE_SEL => sBYTE_SEL,
				iD    	 => sISHW_REG,
				oQ			 => sREGS(i)
			);
	end generate reg_gen;
	
	-- SCL rising edge detector
	eSCL_REDGE_DET : entity work.rising_edge_det
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iSIG  => iSCL,
				oEDGE => sSCL_RISING_EDGE
			);
			
	-- SDA rising edge detector
	eSDA_REDGE_DET : entity work.rising_edge_det
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iSIG  => ioSDA,
				oEDGE => sSDA_RISING_EDGE
			);			
	
	-- SDA falling edge detector
	eSDA_FEDGE_DET : entity work.falling_edge_det
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iSIG  => ioSDA,
				oEDGE => sSDA_FALLING_EDGE
			);
	
	-- I2C bus clock frequency divider		
	eCLK_FREQ_DIV : entity work.i2c_clk_freq_div
			Port map(
				iCLK		=> iCLK,
				inRST 	=> sFREQ_RST,
				iFREQ_EN => sFREQ_EN,
				oTC   	=>	sTC		
			);	

	-- I2C bus clock frequency divider reset
	sFREQ_RST <= '0' when sFREQ_RST_SEL = '1' else
					 inRST;	
						
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
	
	-- Register address register
	addr_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sADDR_REG <= (others => '0'); -- Reset register
		elsif (iCLK'event and iCLK = '1') then
			if (sADDR_REG_EN = '1') then
				sADDR_REG <= sISHW_REG(3 downto 0); -- Write register address
			end if;
		end if;
	end process addr_reg;
	
	-- FSM state register process
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then 
			sCURRENT_STATE <= IDLE; -- Reset FSM
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE; -- Move to next state
		end if;
	end process fsm_reg;
	
	-- Slave FSM next state logic
	fsm_next : process (sCURRENT_STATE, iSCL, ioSDA, sSLAVE_ADDRESS_OK, sREGISTER_ADDRESS_OK, sSDA_RISING_EDGE, sSDA_FALLING_EDGE, sTC_PERIOD_CNT, sTC_RSTART_PERIOD_CNT, sTC_TR_PERIOD_CNT, sMODE_FF, sACK_FF) begin
		sNEXT_STATE <= sCURRENT_STATE;
		case (sCURRENT_STATE) is
			when IDLE =>
				-- Wait for start condition
				if (iSCL = '1' and ioSDA = '0') then
					sNEXT_STATE <= START;   
				end if;
			when START =>
				-- Wait for slave address
				if (iSCL = '0') then
					sNEXT_STATE <= SLAVE_ADDRESS_MODE; -- Get slave address and operation 
				end if;
			when SLAVE_ADDRESS_MODE =>
				-- Check if period elapsed 
				if (sTC_PERIOD_CNT = '1') then
					if (sSLAVE_ADDRESS_OK = '1') then 
						sNEXT_STATE <= SLAVE_ADDRESS_ACK; -- If it is a slave address generate ack
					else
						sNEXT_STATE <= STOP; -- Otherwise wait for stop condition
					end if;	
				end if;
			when SLAVE_ADDRESS_ACK =>
				if (sTC_TR_PERIOD_CNT = '1') then 
					if (sMODE_FF = '0') then
						sNEXT_STATE <= REGISTER_ADDRESS;	-- If transmission for ack period done	get register address
					else
						sNEXT_STATE <= WRITE_DATA; -- Read data if is LSB of slave address is 1  
					end if;
				end if;
			when REGISTER_ADDRESS =>
				-- Check if period elapsed
				if (sTC_PERIOD_CNT = '1') then
					if (sREGISTER_ADDRESS_OK = '1') then 
						sNEXT_STATE <= REGISTER_ADDRESS_ACK; -- If it is correct slave register address generate ack
					else
						sNEXT_STATE <= REGISTER_ADDRESS_NACK; -- Otherwise generate nack
					end if;
				end if;	
			when REGISTER_ADDRESS_ACK =>
				-- Check if transmission period elapsed 
				if (sTC_TR_PERIOD_CNT = '1') then
					sNEXT_STATE <= READ_DATA;	-- If transmission for ack period done	get data byte form master
				end if;			
			when REGISTER_ADDRESS_NACK =>
				if (sTC_TR_PERIOD_CNT = '1') then 
					sNEXT_STATE <= STOP;	-- If transmission for nack period done	
				end if;	
			when REPEATED_START =>
			   if (sTC_RSTART_PERIOD_CNT = '1') then
					sNEXT_STATE <= SLAVE_ADDRESS_MODE; -- Get slave address mode after repeated start 
				end if;
			when READ_DATA	=>
				-- Check for repeated start condition
				if (iSCL = '1' and sSDA_FALLING_EDGE = '1') then
					sNEXT_STATE <= REPEATED_START; 
				-- Check if stop condition was generated by master 
				elsif (iSCL = '1' and sSDA_RISING_EDGE = '1') then
					sNEXT_STATE <= IDLE;			
				-- Check if period elapsed if is read data form master
				elsif (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= READ_ACK;
				end if;		
			when READ_ACK =>
				if (sTC_TR_PERIOD_CNT = '1') then 
					sNEXT_STATE <= READ_DATA;	-- If transmission for ack period done	get data byte
				end if;
			when WRITE_DATA =>
				-- Check if period elapsed if read data form master
				if (sTC_PERIOD_CNT = '1') then
					sNEXT_STATE <= WRITE_ACK;	
				end if;	
			when WRITE_ACK =>
				if (sTC_TR_PERIOD_CNT = '1') then 
					if (sACK_FF = '0') then
						sNEXT_STATE <= WRITE_DATA;	-- If transmission for ack period done	write data byte
					else
						sNEXT_STATE <= STOP;	-- Get stop condition
					end if;	
				end if;				
			when STOP =>
				-- Wait for stop condition
				if (iSCL = '1' and sSDA_RISING_EDGE = '1') then
					sNEXT_STATE <= IDLE;   
				end if;				
		end case;
	end process fsm_next;
	
	-- Slave FSM output logic
	fsm_out : process (sCURRENT_STATE, sDATA_CNT, sMODE_FF, sADDR_REG) begin
		sIN_BUFF_EN	 		 	 <= '0';
		sOUT_BUFF_EN 		 	 <= '0';
		sFREQ_EN					 <= '0';
		sFREQ_RST_SEL			 <= '0';
		sDATA_CNT_EN   	 	 <= '0';
		sDATA_CNT_RST 		 	 <= '0'; 
		sBYTE_CNT_EN   	 	 <= '0';
		sBYTE_CNT_RST 		 	 <= '0';			
		sPERIOD_CNT_EN 	 	 <= '0';
		sRSTART_PERIOD_CNT_EN <= '0';
		sTR_PERIOD_CNT_EN  	 <= '0';
		sTR_PERIOD_CNT_RST 	 <= '0';
		sADDR_REG_EN		 	 <= '0';
		sMODE_FF_EN			 	 <= '0';
		sISHW_EN				 	 <= '0';
		sOSHW_EN				 	 <= '0';
		sOSHW_LOAD			 	 <= '0';
		sREG_MUX_SEL		  	 <= "0000";
		sREG_DEC_SEL		 	 <= "0000";
		sREG_DEC_EN			 	 <= '0';
		sACK_SEL				 	 <= '0';
		sACK_FF_EN				 <= '0';
		sSDA_SEL				 	 <= '0';		
		case (sCURRENT_STATE) is
			-- Slave control signals
			when IDLE =>
				sIN_BUFF_EN	 		 <= '1';
				sFREQ_RST_SEL		 <= '1'; -- Reset clock divider	
				sDATA_CNT_RST 		 <= '1'; -- Reset data counters
				sBYTE_CNT_RST 		 <= '1';	-- Reset byte counters			
			when START => 
				sIN_BUFF_EN	 		 <= '1';	
				sFREQ_EN				 <= '1';	
			when SLAVE_ADDRESS_MODE =>		
				sIN_BUFF_EN	 		 <= '1';	
				sFREQ_EN				 <= '1';
				sDATA_CNT_EN 		 <= '1'; -- Count slave address and mode bits
				if (sDATA_CNT = DATA_WIDTH) then -- If all address bit and mode recived  get mode and start sync period
					sMODE_FF_EN		 <= '1'; -- Get R/W mode, write to register 
					sPERIOD_CNT_EN  <= '1'; -- Start sync period
				else
					sISHW_EN			 <= '1'; -- Get data bit and shift register
				end if;
			when SLAVE_ADDRESS_ACK =>	
				sOUT_BUFF_EN 		 <= '1'; -- Get SDA line 
				sFREQ_EN				 <= '1';
				sTR_PERIOD_CNT_EN  <= '1'; -- Start transmission period
				if (sMODE_FF = '1') then	
					sOSHW_LOAD			 <= '1';
					sREG_MUX_SEL		 <= sADDR_REG;
				end if;
			when REGISTER_ADDRESS =>		
				sIN_BUFF_EN	 		 <= '1';
				sFREQ_EN				 <= '1';
				sDATA_CNT_EN 		 <= '1'; -- Count register address bits
				if (sDATA_CNT = DATA_WIDTH) then -- If all register address bits recived start sync period
					sPERIOD_CNT_EN  <= '1';	-- Start sync period
					sADDR_REG_EN	 <= '1';	-- Write register address to register
				else
					sISHW_EN			 <= '1'; -- Get register address bit 
				end if;
			when REGISTER_ADDRESS_ACK =>	
				sOUT_BUFF_EN 		 <= '1'; -- Get SDA line
				sFREQ_EN				 <= '1';
				sTR_PERIOD_CNT_EN  <= '1'; -- Start transmission period
				if (sMODE_FF = '1') then	-- If mode is read load data to output shift register
					sOSHW_LOAD		 <= '1'; -- Load data to shift register
					sREG_MUX_SEL	 <= sADDR_REG; -- Get register addres
				end if;				
			when REGISTER_ADDRESS_NACK =>	
				sOUT_BUFF_EN 		 <= '1'; -- Get SDA line
				sFREQ_EN				 <= '1';
				sTR_PERIOD_CNT_EN  <= '1'; -- Start transsmision period
				sACK_SEL				 <= '1';		
			when REPEATED_START =>
				sIN_BUFF_EN	 		 	 <= '1';
				sFREQ_EN				 	 <= '1';
				sDATA_CNT_RST 		 	 <= '1';
				sRSTART_PERIOD_CNT_EN <= '1'; -- Start repeated start period	
			when READ_DATA =>		
				sIN_BUFF_EN	 		 <= '1';	
				sFREQ_EN				 <= '1';
				sDATA_CNT_EN 		 <= '1'; -- Count data bits
				if (sDATA_CNT = DATA_WIDTH) then -- If all data bits recived write data form shift register to register
					sPERIOD_CNT_EN  <= '1'; -- Start snyc period
					sREG_DEC_SEL	 <= sADDR_REG; -- Select register
					sREG_DEC_EN		 <= '1'; -- Enable decoder
				else
					sISHW_EN			 <= '1'; -- Get data bits
				end if;		
			when READ_ACK =>	
				sOUT_BUFF_EN 		 <= '1'; -- Get SDA line
				sFREQ_EN				 <= '1';
				sBYTE_CNT_EN   	 <= '1'; -- Reset byte number
				sTR_PERIOD_CNT_EN  <= '1'; -- Start transsmison period					
			when WRITE_DATA =>		
				sOUT_BUFF_EN 		 <= '1';	-- Get SDA line
				sFREQ_EN				 <= '1';	
				sDATA_CNT_EN 		 <= '1'; -- Count sent data
				if (sDATA_CNT = DATA_WIDTH) then -- If all data bits sent to master 
					sPERIOD_CNT_EN 	 <= '1'; -- Start sync period
					sTR_PERIOD_CNT_RST <= '1'; -- Reset transsmison period counter 
				else
					sTR_PERIOD_CNT_EN  <= '1'; -- For each data bit start transsmison period 
					sOSHW_EN				 <= '1';
				end if;
				sSDA_SEL				 <= '1';	  -- Select data bit from output shift register 		
			when WRITE_ACK =>	
				sIN_BUFF_EN	 		 <= '1'; 
				sFREQ_EN				 <= '1';
				sBYTE_CNT_EN   	 <= '1';
				sTR_PERIOD_CNT_EN  <= '1'; -- Start transsmision counter to get acknowelge
				sOSHW_LOAD			 <= '1'; -- Load data form registers
				sREG_MUX_SEL		 <= sADDR_REG; -- Select register with register address		
				sACK_FF_EN			 <= '1';	-- Enable for acknowelge enable				
			when STOP =>
				sIN_BUFF_EN	 		 <= '1';						
		end case;
	end process fsm_out;

	-- Acknowelge flip-flop  
	ack_ff : process (iCLK, inRST) begin
		if (inRST = '0') then
			sACK_FF <= '0'; -- Reset flip-flop
		elsif (iCLK'event and iCLK = '1') then
			if (sACK_FF_EN = '1') then -- If ack enabled
				if (sSCL_RISING_EDGE = '1') then 
					sACK_FF <= ioSDA; -- Write ack or nack form bus to flip-flop
				end if;	
			end if;
		end if;
	end process ack_ff;
	
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
	
	-- Byte counter process						
	byte_cnt : process (iCLK, inRST) begin				
		if (inRST = '0') then
			sBYTE_CNT <= (others => '0'); -- Reset counter		
		elsif (iCLK'event and iCLK = '1') then	
			if (sBYTE_CNT_RST = '1') then 
				sBYTE_CNT <= (others => '0'); -- Reset counter when all data recived and period elapsed
			elsif (sSCL_RISING_EDGE = '1' and sBYTE_CNT_EN = '1') then
				sBYTE_CNT <= sBYTE_CNT + 1; -- Count data bits
			end if;	
		end if;
	end process byte_cnt;	
	
	-- Select register byte
	sBYTE_SEL <= sBYTE_CNT(0);
		
	-- Period counter
	per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sPERIOD_CNT <= (others => '0'); -- Reset counter 
		elsif (iCLK'event and iCLK = '1') then
			if (sPERIOD_CNT = TC_PERIOD - 1) then -- Check counted periods
				sPERIOD_CNT <= (others => '0'); 
			elsif (sTC = '1' and sPERIOD_CNT_EN = '1') then 
				sPERIOD_CNT <= sPERIOD_CNT + 1; -- Count period
			end if;
		end if;
	end process per_cnt;
	
	-- Period counter terminal count 
	sTC_PERIOD_CNT <= '1' when sPERIOD_CNT = TC_PERIOD - 1 else
							'0';
								  
	-- Repeated start period counter
	rep_start_per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sRSTART_PERIOD_CNT <= (others => '0'); -- Reset counter 
		elsif (iCLK'event and iCLK = '1') then
			if (sRSTART_PERIOD_CNT = REP_START_PERIOD - 1) then -- Check counted periods
				sRSTART_PERIOD_CNT <= (others => '0'); 
			elsif (sTC = '1' and sRSTART_PERIOD_CNT_EN = '1') then 
				sRSTART_PERIOD_CNT <= sRSTART_PERIOD_CNT + 1; -- Count period
			end if;
		end if;
	end process rep_start_per_cnt;
	
	-- Period counter terminal count 
	sTC_RSTART_PERIOD_CNT <= '1' when sRSTART_PERIOD_CNT = REP_START_PERIOD - 1 else
									 '0';							  
								  
	-- Transmission period counter
	tr_per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sTR_PERIOD_CNT <= (others => '0'); -- Reset counter 
		elsif (iCLK'event and iCLK = '1') then
			if (sTR_PERIOD_CNT = TR_PERIOD - 1 or sTR_PERIOD_CNT_RST = '1') then -- Check counted periods
				sTR_PERIOD_CNT <= (others => '0'); 
			elsif (sTC = '1' and sTR_PERIOD_CNT_EN = '1') then 
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
				sISHW_REG <= sISHW_REG(DATA_WIDTH - 2 downto 0) & sSDA_IN; -- Shift data bits
			end if;
		end if;
	end process ishift_reg;
	
	-- Output shift register process
	oshift_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sOSHW_REG <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then	
			if (sOSHW_LOAD = '1') then
				sOSHW_REG <= sREG_BYTE_MUX; -- Load data to register
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
	
	-- Register byte multiplexer
	sREG_BYTE_MUX <= sREG_MUX(DATA_WIDTH - 1 downto 0) when sBYTE_SEL = '0' else -- Select lower bits
						  sREG_MUX(2 * DATA_WIDTH - 1 downto DATA_WIDTH); -- Select upper bits	
							
	
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

