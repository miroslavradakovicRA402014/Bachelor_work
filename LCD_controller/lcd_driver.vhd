----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic
-- 
-- Create Date:    12:19:15 06/01/2018 
-- Design Name: 	 LCD driver
-- Module Name:    lcd_driver - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity lcd_driver is
	 Generic(
		INIT_SEQ_NUMBER 	 	: integer := 4;		  -- Init commands sequence
		CMD_SEQ_NUMBER  	 	: integer := 3;		  -- Command of 4-bit sequence number
		CMD_PERIOD_CNT_WIDTH : integer := 2;		  -- Command period counter width
		DATA_BYTE_CNT_WIDTH	: integer := 3;		  -- Byte enable counter 
		SEQ_CNT_WIDTH 		 	: integer := 3;		  -- Sequence command widht
		LCD_BUS_WIDTH	 	 	: integer := 4;		  -- LCD controler interface width 
		DATA_WIDTH		 	 	: integer := 8;		  -- Input data width
		CHAR_WIDTH   		 	: integer := 8;		  -- Data character width	
		CHAR_NUMBER_WIDTH		: integer := 6;		  -- Char number width
		INIT_PERIOD 		 	: integer := 2160000;  -- Clock cycles number for 45ms period
	   CMD_SEQ_PERIOD 	 	: integer := 12000;	  -- Clock cycles number for 250us period		
		CHAR_NUMBER 	 	 	: integer := 22  	  	  -- Number of characters without data characters
	 );
    Port ( iCLK   	  : in 		std_logic;												 -- Clock signal 50MHz
           inRST  	  : in 		std_logic;												 -- Reset signal
			  iSLAVE_ADDR : in 		std_logic_vector(DATA_WIDTH - 1 downto 0);	 -- Slave address
			  iREG_ADDR   : in 		std_logic_vector(DATA_WIDTH - 1 downto 0);    -- Slave register address
			  iDATA_BYTE  : in  		std_logic_vector(DATA_WIDTH - 1 downto 0); 	 -- Data byte
			  iBYTE_NUM   : in 		std_logic_vector(DATA_WIDTH - 1 downto 0); 	 -- Data byte number 
			  iMODE 		  : in		std_logic;												 -- Mode R/W signal
			  iDATA_EN	  : in 		std_logic;												 -- Data enable signal
			  iBYTE_EN	  : in      std_logic;												 -- Data byte enable signal
           oE 	   	  : out 		std_logic;												 -- LCD display enable control signal
           oRS    	  : out		std_logic;												 -- LCD display register select control signal
           oRW   		  : out 		std_logic;												 -- LCD display read-write control signal
           ioD 		  : inout   std_logic_vector(LCD_BUS_WIDTH - 1 downto 0));-- LCD display data
end lcd_driver;

architecture Behavioral of lcd_driver is
	
	-- LCD command constants upper and lower command sequence
	constant cLCD_INIT_H  	    : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0010";
	constant cLCD_INIT_L   		 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0011";
	constant cLCD_CONFIG_H 		 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0010";
	constant cLCD_CONFIG_L 		 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "1000";
	constant cDISPLAY_CONFIG_H  : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0000";
	constant cDISPLAY_CONFIG_L  : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "1100";	
	constant cCLEAR_SCREEN_H 	 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0000";
	constant cCLEAR_SCREEN_L 	 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0001";
	constant cENTRY_MODE_H 		 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0000";
	constant cENTRY_MODE_L 		 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0110";	
	constant cADDRESS_SET_H 	 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "1000";
	constant cADDRESS_SET_L 	 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0000";
	constant cCURSOR_NEW_LINE_H : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "1100";
	constant cCURSOR_NEW_LINE_L : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0000";
	constant cCURSOR_BACK_H 	 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0000";
	constant cCURSOR_BACK_L 	 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0) := "0010";	
	
	-- Characters code constants
	constant cCHAR_S 				: std_logic_vector(CHAR_WIDTH - 1 downto 0) := "01010011";
	constant cCHAR_A 				: std_logic_vector(CHAR_WIDTH - 1 downto 0) := "01000001";
	constant cCHAR_DOTS			: std_logic_vector(CHAR_WIDTH - 1 downto 0) := "00111010";
	constant cCHAR_0 				: std_logic_vector(CHAR_WIDTH - 1 downto 0) := "00110000";
	constant cCHAR_x 				: std_logic_vector(CHAR_WIDTH - 1 downto 0) := "01111000";
	constant cCHAR_VER_LINE 	: std_logic_vector(CHAR_WIDTH - 1 downto 0) := "01111100";
	constant cCHAR_R 				: std_logic_vector(CHAR_WIDTH - 1 downto 0) := "01010010";
	constant cCHAR_W 				: std_logic_vector(CHAR_WIDTH - 1 downto 0) := "01010111";
	constant cCHAR_D 				: std_logic_vector(CHAR_WIDTH - 1 downto 0) := "01000100";
	constant cCHAR_T 				: std_logic_vector(CHAR_WIDTH - 1 downto 0) := "01010100";
	
	type   tSTATES is (IDLE, LCD_INIT_SEQ, LCD_CONFIG, DISPLAY_CONFIG, DISPLAY_CONFIG_BF, CLEAR_SCREEN_BF, CLEAR_SCREEN, 
							 ENTRY_MODE_BF, ENTRY_MODE, READ_INPUT_DATA, CHECK_CURSOR, ADDRESS_SET_BF , ADDRESS_SET,  READ_INPUT_CHAR, 
							 CLEAR_PRINT_BF, CLEAR_PRINT ,PRINT_CHAR_BF, PRINT_CHAR, CURSOR_BACK_BF, CURSOR_BACK, CURSOR_NEW_LINE, STOP_PRINT); -- LCD controller FSM states type																

	signal sCURRENT_STATE 	   	: tSTATES;									  					-- LCD controller FSM current state
	signal sNEXT_STATE    	   	: tSTATES; 									  					-- LCD controller FSM next state

	signal sOUT_BUFF_EN	 	   	: std_logic;								   				-- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	   	: std_logic;	   						  					-- Input tri-state buffer enable

	signal sOUT_DATA					: std_logic_vector(LCD_BUS_WIDTH - 1 downto 0);	   -- Output data
	signal sIN_DATA					: std_logic_vector(LCD_BUS_WIDTH - 1 downto 0);		-- Input data

	signal sINIT_PERIOD_EN			: std_logic;													-- Init period delay timer enable
	signal sINIT_PERIOD_TC			: std_logic;													-- Init period delay timer treminal count
	
	signal sCMD_PERIOD_EN			: std_logic;													-- Command period timer enable
	signal sCMD_PERIOD_TC			: std_logic;													-- Command period timer treminal count

	signal sSEQ_CNT 					: unsigned(SEQ_CNT_WIDTH - 1 downto 0);				-- Command sequence number counter		
	signal sSEQ_CNT_EN 				: std_logic;													-- Command sequence number counter enable
	signal sSEQ_CNT_RST				: std_logic;													-- Command sequence number counter reset
	
	signal sCMD_PER_CNT 				: unsigned(CMD_PERIOD_CNT_WIDTH - 1 downto 0);		-- Command period counter		 
	signal sCMD_PER_CNT_EN			: std_logic;													-- Command period counter enable
	signal sCMD_PER_CNT_RST			: std_logic;													-- Command period counter reset	
	
	signal sCHAR_CNT 					: unsigned(5 downto 0);										-- Character counter
	signal sCHAR_CNT_EN 				: std_logic;													-- Character counter enable
	signal sCHAR_CNT_RST				: std_logic;													-- Character counter reset
		
	signal sCHAR_BYTE 				: std_logic;													-- Character byte counter 
	signal sCHAR_BYTE_EN 			: std_logic;													-- Character byte counter enable 
	
	signal sBYTE_EN_CNT 				: unsigned(DATA_BYTE_CNT_WIDTH - 1 downto 0);		-- Data byte counter				
	signal sBYTE_EN_CNT_RST			: std_logic;													-- Data byte counter reset
	
	signal sCHAR_NUM 					: std_logic_vector(CHAR_NUMBER_WIDTH - 1 downto 0);-- Number of characters
	signal sBYTE_NUM_LIM				: std_logic_vector(CHAR_NUMBER_WIDTH - 1 downto 0);-- Byte number limiter
	
	signal sSLAVE_ADDR_REG			: std_logic_vector(DATA_WIDTH - 1 downto 0); 		-- Slave address register	
	signal sREG_ADDR_REG				: std_logic_vector(DATA_WIDTH - 1 downto 0); 		-- Register address register
	signal sDATA_BYTE					: std_logic_vector(DATA_WIDTH - 1 downto 0);		 	-- Data byte 	
	signal sBYTE_NUM_REG				: std_logic_vector(DATA_WIDTH - 1 downto 0); 		-- Byte number register
	signal sDATA_BYTE_REG			: std_logic_vector(DATA_WIDTH - 1 downto 0);		 	-- Data byte register
	signal sDATA_BYTE_REG_EN		: std_logic;		 											-- Data byte register enable
	signal sMODE_FF 					: std_logic;													-- Mode register

	signal sDATA_FIFO_FULL			: std_logic;													-- Data FIFO full indication 
	signal sDATA_FIFO_EMPTY			: std_logic;													-- Data FIFO empty indication
	signal sDATA_FIFO_WRITE			: std_logic;													-- Data FIFO write signal
	signal sDATA_FIFO_READ			: std_logic;													-- Data FIFO read signal
	
	signal sCHAR_CODE 				: std_logic_vector(CHAR_WIDTH - 1 downto 0); 		-- Character code at display
	
	signal sSLAVE_ADDR_CHAR			: std_logic_vector(2 * CHAR_WIDTH - 1 downto 0); 	-- Slave address char	
	signal sREG_ADDR_CHAR			: std_logic_vector(2 * CHAR_WIDTH - 1 downto 0);	-- Register address char
	signal sDATA_BYTE_CHAR			: std_logic_vector(2 * CHAR_WIDTH - 1 downto 0); 	-- Data byte char

begin

	-- LCD init delay timer
	eLCD_INIT_TIMER : entity work.lcd_timer
			Generic map (
				CLK_PERIOD_NUMBER => INIT_PERIOD,  
				CLK_CNT_WIDHT		=> 22
			)
			Port map(
				iCLK  	  => iCLK,
				inRST 	  => inRST,
				iTIMER_EN  => sINIT_PERIOD_EN,
				oTC 	  	  => sINIT_PERIOD_TC
			);
	
	-- LCD R/W command timer
	eLCD_CMD_TIMER : entity work.lcd_timer
			Generic map (
				CLK_PERIOD_NUMBER => CMD_SEQ_PERIOD,
				CLK_CNT_WIDHT		=> 14
			)
			Port map(
				iCLK  	  => iCLK,
				inRST 	  => inRST,
				iTIMER_EN  => sCMD_PERIOD_EN,
				oTC 	  	  => sCMD_PERIOD_TC
			);	
	
	-- Slave address register
	eSLAVE_ADDR_REG : entity work.reg
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => iDATA_EN,
				iD 	=> iSLAVE_ADDR,
				oQ		=> sSLAVE_ADDR_REG
			);
	
	-- Register address register	
	eREG_ADDR_REG : entity work.reg
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => iDATA_EN,
				iD 	=> iREG_ADDR,
				oQ		=> sREG_ADDR_REG
			);
	
	-- Data byte FIFO
	eDATA_BYTE_FIFO : entity work.fifo 
			Generic map(
				NUM_OF_WORDS => 2
			)
			Port map(
				iCLK   	=> iCLK,
				inRST  	=> inRST,
				iDATA  	=> iDATA_BYTE,
				iWR    	=> sDATA_FIFO_WRITE,
				iRD    	=> sDATA_FIFO_READ,
				oFULL  	=> sDATA_FIFO_FULL,
				oEMPTY 	=> sDATA_FIFO_EMPTY,
				oDATA  	=> sDATA_BYTE
			);
	
	-- Byte number register	
	eBYTE_NUM_REG : entity work.reg
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => iDATA_EN,
				iD 	=> iBYTE_NUM,
				oQ		=> sBYTE_NUM_REG
			);	
			
	-- Data byte register	
	eDATA_BYTE_REG : entity work.reg
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sDATA_BYTE_REG_EN,
				iD 	=> sDATA_BYTE,
				oQ		=> sDATA_BYTE_REG
			);			

	-- Slave address char generator		
	eSLAVE_ADDR_CHAR_GEN : entity work.char_gen
			Port map(
				iDATA => sSLAVE_ADDR_REG,
				oCHAR => sSLAVE_ADDR_CHAR
			);
			
	-- Register address char generator		
	eREG_ADDR_CHAR_GEN : entity work.char_gen
			Port map(
				iDATA => sREG_ADDR_REG,
				oCHAR => sREG_ADDR_CHAR
			);		
			
	-- Data byte char generator		
	eDATA_BYTE_CHAR_GEN : entity work.char_gen
			Port map(
				iDATA => sDATA_BYTE_REG,
				oCHAR => sDATA_BYTE_CHAR
			);	
	
	-- Mode flip-flop
	mode_ff : process (iCLK, inRST) begin
		if (inRST = '0') then
			sMODE_FF <= '0'; -- Reset FF
		elsif (iCLK'event and iCLK = '1') then
			if (iDATA_EN = '1') then
				sMODE_FF <= iMODE; -- Write mode
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
	
	-- LCD controller FSM next state logic
	fsm_next : process (sCURRENT_STATE, sSEQ_CNT, sDATA_FIFO_EMPTY, sINIT_PERIOD_TC, sIN_DATA, iDATA_EN, sCHAR_CNT, sCHAR_NUM) begin
		sNEXT_STATE <= sCURRENT_STATE;
		case (sCURRENT_STATE) is
			when IDLE =>
				if (sINIT_PERIOD_TC = '1') then -- Wait for init period 
					sNEXT_STATE <= LCD_INIT_SEQ;
				end if;				
			when LCD_INIT_SEQ => 	
				if (sSEQ_CNT = INIT_SEQ_NUMBER) then -- Wait for all init commands
					sNEXT_STATE <= LCD_CONFIG;
				end if;			
			when LCD_CONFIG =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then -- Wait for command sequence done  
					sNEXT_STATE <= DISPLAY_CONFIG_BF;  
				end if;				
			when DISPLAY_CONFIG_BF =>	 
				if (sIN_DATA(3) = '0') then -- Check busy flag for next command 
					sNEXT_STATE <= DISPLAY_CONFIG; 
				end if;		
			when  DISPLAY_CONFIG =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then -- Wait for command sequence done
					sNEXT_STATE <= CLEAR_SCREEN_BF;
				end if;		
			when CLEAR_SCREEN_BF =>
				if (sIN_DATA(3) = '0') then -- Check busy flag for next command 
					sNEXT_STATE <= CLEAR_SCREEN; 	
				end if;			
			when  CLEAR_SCREEN =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then -- Wait for command sequence done 
					sNEXT_STATE <= ENTRY_MODE_BF;
				end if;					
			when ENTRY_MODE_BF =>
				if (sIN_DATA(3) = '0') then -- Check busy flag for next command 
					sNEXT_STATE <= ENTRY_MODE; 	
				end if;
			when ENTRY_MODE =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then -- Wait for command sequence done  
					sNEXT_STATE <= ADDRESS_SET_BF;
				end if;						
			when ADDRESS_SET_BF =>
				if (sIN_DATA(3) = '0') then -- Check busy flag for next command 
					sNEXT_STATE <= ADDRESS_SET; 
				end if;			
			when ADDRESS_SET =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then -- Wait for command sequence done
					sNEXT_STATE <= READ_INPUT_DATA;
				end if;	
			when READ_INPUT_DATA =>
				if (iDATA_EN = '1') then -- Wait for input data from master
					sNEXT_STATE <= CLEAR_PRINT_BF;	
				end if;
			when CLEAR_PRINT_BF =>
				if (sIN_DATA(3) = '0') then -- Check busy flag for next command 
					sNEXT_STATE <= CLEAR_PRINT; 
				end if;				
			when CLEAR_PRINT =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then -- Wait for command sequence done 
					sNEXT_STATE <= CURSOR_BACK_BF;
				end if;		
			when CURSOR_BACK_BF =>
				if (sIN_DATA(3) = '0') then -- Check busy flag for next command 
					sNEXT_STATE <= CURSOR_BACK; 
				end if;	
			when CURSOR_BACK =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then -- Wait for command sequence done 
					sNEXT_STATE <= PRINT_CHAR_BF;
				end if;					
			when READ_INPUT_CHAR =>
				sNEXT_STATE <= PRINT_CHAR_BF; 
			when CHECK_CURSOR => 	
				if (sCHAR_CNT = 16) then -- If cursor position is on end of first line move to second line
					sNEXT_STATE <= CURSOR_NEW_LINE;
				else
					if (sCHAR_CNT >= 22) then -- If have to wait data bytes
						if (sDATA_FIFO_EMPTY = '1') then
							sNEXT_STATE <= READ_INPUT_CHAR;
						end if;	
					else
						sNEXT_STATE <= PRINT_CHAR_BF;
					end if;	
				end if;		
			when PRINT_CHAR_BF =>
				if (sIN_DATA(3) = '0') then  -- Check busy flag for next command 
					sNEXT_STATE <= PRINT_CHAR; 
				end if;		
			when PRINT_CHAR => 
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then -- Wait for command sequence done  
					sNEXT_STATE <= STOP_PRINT;
				end if;		
			when CURSOR_NEW_LINE =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then -- Wait for command sequence done 
					sNEXT_STATE <= PRINT_CHAR_BF;
				end if;				
			when STOP_PRINT =>
				if (CONV_STD_LOGIC_VECTOR(sCHAR_CNT, 5) = sCHAR_NUM) then -- Wait to print all characters
					sNEXT_STATE <= READ_INPUT_DATA;	-- Read another data
				else
					sNEXT_STATE <= CHECK_CURSOR;	-- Check cursor position
				end if;							
		end case;
	end process fsm_next;	
	
	
	-- LCD controller FSM output logic
	fsm_out : process (sCURRENT_STATE, sINIT_PERIOD_TC, sSEQ_CNT, sCMD_PER_CNT, sCHAR_CNT, sCHAR_BYTE, sCHAR_CODE) begin
		sIN_BUFF_EN	 	 	<= '0';
		sOUT_BUFF_EN	 	<= '0';
		sSEQ_CNT_EN 	 	<= '0';
		sSEQ_CNT_RST 	 	<= '0';
		sCMD_PER_CNT_EN	<= '0';	
		sCMD_PER_CNT_RST	<= '0';
		sCHAR_CNT_EN		<= '0';
		sCHAR_CNT_RST		<= '0';
		sBYTE_EN_CNT_RST	<= '0';
		sCHAR_BYTE_EN 		<= '0';
		sINIT_PERIOD_EN 	<= '0';	
		sCMD_PERIOD_EN  	<= '0';	
		sDATA_BYTE_REG_EN	<= '0';
		sOUT_DATA		 	<= (others => '0');
		sDATA_FIFO_READ	<= '0';
		oE 	  			 	<= '0'; 
      oRS    			 	<= '0';
      oRW   			 	<= '0';	
		case (sCURRENT_STATE) is
			when IDLE =>
				sOUT_BUFF_EN	 	<= '1';
				sINIT_PERIOD_EN	<= '1';	-- Start init period
			when LCD_INIT_SEQ =>
				sOUT_BUFF_EN	 	<= '1';	
				if (sINIT_PERIOD_TC = '1') then	-- If init period elapsed move no next init sequence
					sSEQ_CNT_EN 	  <= '1';		-- Increment command sequence 
					sCMD_PER_CNT_RST <= '1';		-- Reset command sequence period counter
				end if;						
				sINIT_PERIOD_EN <= '1';	-- Enable init period			
				if (sCMD_PER_CNT = 1) then -- Enable LCD command inputs are stable
					oE <= '1';
				end if;							
				if (sCMD_PER_CNT /= 3) then -- If all command sequences are't executed
					sCMD_PERIOD_EN  <= '1';	-- Enable command sequence counter
					sCMD_PER_CNT_EN <= '1'; -- Count command sequence periods
				end if;				
				if (sSEQ_CNT > 2) then				 			
					if (sSEQ_CNT = 4) then
						sCMD_PERIOD_EN  <= '0'; 
						sSEQ_CNT_RST 	 <= '1';	-- Reset sequence counter 
					end if;					
					sOUT_DATA 		 <= cLCD_INIT_H; -- Upper command sequence data
				else  
					sOUT_DATA 		 <= cLCD_INIT_L; -- Lower command sequence data			
				end if;						
			when LCD_CONFIG =>
				sOUT_BUFF_EN	 	<= '1';
				if (sCMD_PER_CNT = 1) then -- Enable LCD command, inputs are stable
					oE <= '1';
				end if;		
				if (sSEQ_CNT = 1) then		-- First command sequence 
					if (sCMD_PER_CNT = 3) then	 -- If is sequence executed
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command 						
					end if;			
					sCMD_PERIOD_EN  <= '1'; -- Enable command period
					sCMD_PER_CNT_EN <= '1'; -- Count command period				
					sOUT_DATA 		 <= cLCD_CONFIG_H; -- Send command to controller 
				elsif (sSEQ_CNT = 2) then	-- Second command sequence
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter
					end if;	
					sCMD_PERIOD_EN  <= '1';					-- Enable command period
					sCMD_PER_CNT_EN <= '1';					--	Count command period  		
					sOUT_DATA 		 <= cLCD_CONFIG_L;	-- Lower command sequence data
				else
					if (sINIT_PERIOD_TC = '1') then		-- Command wait period for init delay
						sSEQ_CNT_EN 	 <= '1';				-- Move to first sequence
					end if;	
				end if;			
				sINIT_PERIOD_EN <= '1';		
			when DISPLAY_CONFIG_BF | ENTRY_MODE_BF | CLEAR_SCREEN_BF | CLEAR_PRINT_BF  | ADDRESS_SET_BF | PRINT_CHAR_BF | CURSOR_BACK_BF =>	
				sIN_BUFF_EN	 	 <= '1';						
				oRW   			 <= '1';						-- Write command 
				sSEQ_CNT_RST 	 <= '1';						-- Reset command sequence counter, next sequnce
				if (sCMD_PER_CNT = 1) then 				-- Enable LCD command, inputs are stable 
					oE <= '1';
				end if;
				if (sCMD_PER_CNT /= 3) then				-- Check command exexuted, all of three periods done
					sCMD_PERIOD_EN   <= '1';				-- Count command period
					sCMD_PER_CNT_EN  <= '1';				-- Enable command period
				end if;				
			when DISPLAY_CONFIG =>	
				sOUT_BUFF_EN	 	<= '1';
				if (sCMD_PER_CNT = 1) then -- Enable LCD command, inputs are stable
					oE <= '1';
				end if;
				if (sSEQ_CNT = 1) then		-- First command sequence 
					if (sCMD_PER_CNT = 3) then	 -- If is sequence executed
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter						
					end if;	
					sCMD_PERIOD_EN  <= '1'; -- Enable command period
					sCMD_PER_CNT_EN <= '1'; -- Count command period				 	
					sOUT_DATA 		 <= cDISPLAY_CONFIG_H; -- Send command to controller 
				elsif (sSEQ_CNT = 2) then	-- Second command sequence
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter
					end if;	
					sCMD_PERIOD_EN  <= '1';					-- Enable command period
					sCMD_PER_CNT_EN <= '1';					--	Count command period  				
					sOUT_DATA 		 <= cDISPLAY_CONFIG_L; -- Send command to controller 
				else
					sSEQ_CNT_EN 	  <= '1';	-- Count command sequence
					sCMD_PER_CNT_RST <= '1';	-- Reset command sequence
				end if;							
			when CLEAR_SCREEN | CLEAR_PRINT =>
				sOUT_BUFF_EN	 	<= '1';
				if (sCMD_PER_CNT = 1) then -- Enable LCD command, inputs are stable
					oE <= '1';
				end if;
				if (sSEQ_CNT = 1) then		-- First command sequence 
					if (sCMD_PER_CNT = 3) then	 -- If is sequence executed
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter						
					end if;	
					sCMD_PERIOD_EN  <= '1'; -- Enable command period
					sCMD_PER_CNT_EN <= '1'; -- Count command period				 	
					sOUT_DATA 		 <= cCLEAR_SCREEN_H; -- Send command to controller 
				elsif (sSEQ_CNT = 2) then	-- Second command sequence
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter
					end if;	
					sCMD_PERIOD_EN  <= '1';					-- Enable command period
					sCMD_PER_CNT_EN <= '1';					--	Count command period  		
					sOUT_DATA 		 <= cCLEAR_SCREEN_L; -- Send command to controller
				else
					sSEQ_CNT_EN 	  <= '1';	-- Count command sequence
					sCMD_PER_CNT_RST <= '1';	-- Reset command sequence
				end if;
			when ENTRY_MODE =>
				sOUT_BUFF_EN	 	<= '1';
				if (sCMD_PER_CNT = 1) then -- Enable LCD command, inputs are stables
					oE <= '1';
				end if;
				if (sSEQ_CNT = 1) then		-- First command sequence 
					if (sCMD_PER_CNT = 3) then	 -- If is sequence executed
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter						
					end if;	
					sCMD_PERIOD_EN  <= '1'; -- Enable command period
					sCMD_PER_CNT_EN <= '1'; -- Count command period				 	
					sOUT_DATA 		 <= cENTRY_MODE_H; -- Send command to controller 
				elsif (sSEQ_CNT = 2) then	-- Second command sequence
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter
					end if;	
					sCMD_PERIOD_EN  <= '1';					-- Enable command period
					sCMD_PER_CNT_EN <= '1';					--	Count command period  		
					sOUT_DATA 		 <= cENTRY_MODE_L; -- Send command to controller 
				else
					sSEQ_CNT_EN 	  <= '1';	-- Count command sequence
					sCMD_PER_CNT_RST <= '1';	-- Reset command sequence
				end if;
			when ADDRESS_SET =>
				sOUT_BUFF_EN	 	<= '1';
				if (sCMD_PER_CNT = 1) then -- Enable LCD command, inputs are stable
					oE <= '1';
				end if;
				if (sSEQ_CNT = 1) then		-- First command sequence 
					if (sCMD_PER_CNT = 3) then	 -- If is sequence executed
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter						
					end if;	
					sCMD_PERIOD_EN  <= '1'; -- Enable command period
					sCMD_PER_CNT_EN <= '1'; -- Count command period				 	
					sOUT_DATA 		 <= cADDRESS_SET_H; -- Send command to controller 
				elsif (sSEQ_CNT = 2) then	-- Second command sequence
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter
					end if;	
					sCMD_PERIOD_EN  <= '1';					-- Enable command period
					sCMD_PER_CNT_EN <= '1';					--	Count command period  		
					sOUT_DATA 		 <= cADDRESS_SET_L; -- Send command to controller 
				else
					sSEQ_CNT_EN 	  <= '1';	-- Count command sequence
					sCMD_PER_CNT_RST <= '1';	-- Reset command sequence
				end if;			
			when READ_INPUT_DATA =>
				sCHAR_CNT_RST 	  <= '1';			-- Reset char counter
				sBYTE_EN_CNT_RST <= '1';			-- Reset byte enable counter
			when READ_INPUT_CHAR =>
				sCHAR_BYTE_EN <= '1';
				if (sCHAR_BYTE = '0') then	-- Check if print first char of data byte 
					sDATA_FIFO_READ 	<= '1';			-- Read data byte form FIFO
					sDATA_BYTE_REG_EN <= '1';	
				end if;		
			when PRINT_CHAR =>
				sOUT_BUFF_EN	 	 <= '1';					
				oRS <= '1';										-- Rerister select assert to one
				if (sCMD_PER_CNT = 1) then -- Enable LCD command, inputs are stable
					oE <= '1';
				end if;
				if (sSEQ_CNT = 1) then		-- First command sequence 
					if (sCMD_PER_CNT = 3) then	 -- If is sequence executed
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter						
					end if;	
					sCMD_PERIOD_EN  <= '1'; -- Enable command period
					sCMD_PER_CNT_EN <= '1'; -- Count command period							
					sOUT_DATA 		 <= sCHAR_CODE(DATA_WIDTH - 1 downto 4); -- Send character code
				elsif (sSEQ_CNT = 2) then	-- Second command sequence
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter
					end if;	
					sCMD_PERIOD_EN  <= '1';					-- Enable command period
					sCMD_PER_CNT_EN <= '1';					--	Count command period  			
					sOUT_DATA 		 <= sCHAR_CODE(3 downto 0); -- Send character code
				else
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PER_CNT_RST <= '1';
					if (sSEQ_CNT = 3) then
						sCHAR_CNT_EN	  <= '1';
					end if;
				end if;	
			when CURSOR_NEW_LINE =>
				sOUT_BUFF_EN	 	<= '1';
				if (sCMD_PER_CNT = 1) then -- Enable LCD command, inputs are stable
					oE <= '1';
				end if;
				if (sSEQ_CNT = 1) then		-- First command sequence 
					if (sCMD_PER_CNT = 3) then	 -- If is sequence executed
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter						
					end if;	
					sCMD_PERIOD_EN  <= '1'; -- Enable command period
					sCMD_PER_CNT_EN <= '1'; -- Count command period				 	
					sOUT_DATA 		 <= cCURSOR_NEW_LINE_H; -- Send command to controller 
				elsif (sSEQ_CNT = 2) then	-- Second command sequence
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter
					end if;	
					sCMD_PERIOD_EN  <= '1';					-- Enable command period
					sCMD_PER_CNT_EN <= '1';					--	Count command period  		
					sOUT_DATA 		 <= cCURSOR_NEW_LINE_L; -- Send command to controller 
				else
					sSEQ_CNT_EN 	  <= '1';	-- Count command sequence
					sCMD_PER_CNT_RST <= '1';	-- Reset command sequence
				end if;
			when CURSOR_BACK =>
				sOUT_BUFF_EN	 	<= '1';
				if (sCMD_PER_CNT = 1) then -- Enable LCD command, inputs are stable
					oE <= '1';
				end if;
				if (sSEQ_CNT = 1) then		-- First command sequence 
					if (sCMD_PER_CNT = 3) then	 -- If is sequence executed
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter						
					end if;	
					sCMD_PERIOD_EN  <= '1'; -- Enable command period
					sCMD_PER_CNT_EN <= '1'; -- Count command period				 	
					sOUT_DATA 		 <= cCURSOR_BACK_H; -- Send command to controller 
				elsif (sSEQ_CNT = 2) then	-- Second command sequence
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1'; -- Move to next command sequence
						sCMD_PER_CNT_RST <= '1'; -- Reset command period counter
					end if;	
					sCMD_PERIOD_EN  <= '1';					-- Enable command period
					sCMD_PER_CNT_EN <= '1';					--	Count command period  		
					sOUT_DATA 		 <= cCURSOR_BACK_L; -- Send command to controller 
				else
					sSEQ_CNT_EN 	  <= '1';	-- Count command sequence
					sCMD_PER_CNT_RST <= '1';	-- Reset command sequence
				end if; 			
			when others =>
								
		end case;
	end process fsm_out;	
	
	-- Command sequence number counter process 
	seq_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sSEQ_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sSEQ_CNT_RST = '1') then
				sSEQ_CNT <= (others => '0');	-- Reset counter
			elsif (sSEQ_CNT_EN = '1') then
				sSEQ_CNT <= sSEQ_CNT + 1; -- Count command sequence
			end if;
		end if;
	end process seq_cnt;
	
	-- Command period number counter process 
	cmd_per_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sCMD_PER_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sCMD_PER_CNT_RST = '1') then
				sCMD_PER_CNT <= (others => '0'); -- Reset counter  
			elsif (sCMD_PER_CNT_EN = '1' and sCMD_PERIOD_TC = '1') then
				sCMD_PER_CNT <= sCMD_PER_CNT + 1; -- Count period if one command period elapsed
			end if;
		end if;
	end process cmd_per_cnt;	
	
	-- Character counter process 
	char_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sCHAR_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then
			if (sCHAR_CNT_RST = '1') then
				sCHAR_CNT <= (others => '0'); -- Reset counter  
			elsif (sCHAR_CNT_EN = '1') then
				sCHAR_CNT <= sCHAR_CNT + 1; -- Count period if one command period elapsed
			end if;
		end if;
	end process char_cnt;
	
	-- Byte enable counter
	byte_en_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sBYTE_EN_CNT <= (others => '0'); -- Reset counter
		elsif (iCLK'event and iCLK = '1') then  
			if (sBYTE_EN_CNT_RST = '1') then
				sBYTE_EN_CNT <= (others => '0'); -- Reset counter
			elsif (iBYTE_EN = '1') then
				sBYTE_EN_CNT <= sBYTE_EN_CNT + 1; -- Count byte enable
			end if;
		end if;
	end process byte_en_cnt;
	
	-- Char byte character flip-flop
	char_byte : process (iCLK, inRST) begin
		if (inRST = '0') then
			sCHAR_BYTE <= '0'; -- Reset counter
		elsif (iCLK'event and iCLK = '1') then  
			if (sCHAR_BYTE_EN = '1') then
				sCHAR_BYTE <= not (sCHAR_BYTE); -- Move to next char
			end if;
		end if;
	end process char_byte;
		
	-- Byte number limiter
	sBYTE_NUM_LIM <= sBYTE_NUM_REG(5 downto 0) when sBYTE_NUM_REG < 5  else
						  "000100";
	
	-- Characters number (byte num is multiplie with 2, every byte is 2 chars)
	sCHAR_NUM <= CHAR_NUMBER + (sBYTE_NUM_LIM(4 downto 0) & '0');
	
	-- Data FIFO write mux, can't write if FIFO is full
	sDATA_FIFO_WRITE  <= iBYTE_EN when sDATA_FIFO_FULL = '0' and sBYTE_EN_CNT < 4 else
								'0';
	
	-- Char code process 
	char_code : process (sCHAR_CNT, sSLAVE_ADDR_CHAR, sREG_ADDR_CHAR, sMODE_FF, sDATA_BYTE_CHAR) begin
	   -- Generate char code depends on positon in display
		case (sCHAR_CNT) is
			when "000000" =>
				sCHAR_CODE <= cCHAR_S; -- S
			when "000001" =>
				sCHAR_CODE <= cCHAR_A; -- A
			when "000010" =>
				sCHAR_CODE <= cCHAR_DOTS; -- :
			when "000011" =>
				sCHAR_CODE <= cCHAR_0; -- 0
			when "000100" =>
				sCHAR_CODE <= cCHAR_x; -- x
			when "000101" =>
				sCHAR_CODE <= sSLAVE_ADDR_CHAR(2 * CHAR_WIDTH - 1  downto CHAR_WIDTH); -- _
			when "000110" =>
				sCHAR_CODE <= sSLAVE_ADDR_CHAR(CHAR_WIDTH - 1  downto 0);  -- _	
			when "000111" =>
				sCHAR_CODE <= cCHAR_VER_LINE; -- |
			when "001000" =>
				sCHAR_CODE <= cCHAR_R; -- R
			when "001001" =>
				sCHAR_CODE <= cCHAR_A; -- A
			when "001010" =>
				sCHAR_CODE <= cCHAR_DOTS; -- :
			when "001011" =>
				sCHAR_CODE <= cCHAR_0; -- 0
			when "001100" =>
				sCHAR_CODE <= cCHAR_x; -- x
			when "001101" =>
				sCHAR_CODE <= sREG_ADDR_CHAR(2 * CHAR_WIDTH - 1  downto CHAR_WIDTH); -- _	 	
			when "001110" =>
				sCHAR_CODE <= sREG_ADDR_CHAR(CHAR_WIDTH - 1  downto 0); -- _				
			when "001111" =>
				if (sMODE_FF = '1') then
					sCHAR_CODE <= cCHAR_R; -- R
				else 
					sCHAR_CODE <= cCHAR_W; -- W
				end if;
			when "010000" =>
				sCHAR_CODE <= cCHAR_D; -- D
			when "010001" =>
				sCHAR_CODE <= cCHAR_A; -- A
			when "010010" =>
				sCHAR_CODE <= cCHAR_T; -- T
			when "010011" =>
				sCHAR_CODE <= cCHAR_DOTS; -- :
			when "010100" =>
				sCHAR_CODE <= cCHAR_0; -- 0	
			when "010101" =>
				sCHAR_CODE <= cCHAR_x; -- x
			when "010110" =>
				sCHAR_CODE <= sDATA_BYTE_CHAR(2 * CHAR_WIDTH - 1  downto CHAR_WIDTH); -- _
			when "010111" =>
				sCHAR_CODE <= sDATA_BYTE_CHAR(CHAR_WIDTH - 1  downto 0); -- _
			when "011000" =>
				sCHAR_CODE <= sDATA_BYTE_CHAR(2 * CHAR_WIDTH - 1  downto CHAR_WIDTH); -- _
			when "011001" =>
				sCHAR_CODE <= sDATA_BYTE_CHAR(CHAR_WIDTH - 1  downto 0); -- _
			when "011010" =>
				sCHAR_CODE <= sDATA_BYTE_CHAR(2 * CHAR_WIDTH - 1  downto CHAR_WIDTH); -- _
			when "011011" =>
				sCHAR_CODE <= sDATA_BYTE_CHAR(CHAR_WIDTH - 1  downto 0); -- _
			when "011100" =>
				sCHAR_CODE <= sDATA_BYTE_CHAR(2 * CHAR_WIDTH - 1  downto CHAR_WIDTH); -- _
			when "011101" =>
				sCHAR_CODE <= sDATA_BYTE_CHAR(CHAR_WIDTH - 1  downto 0); -- _	
			when "011110" =>
				sCHAR_CODE <= sDATA_BYTE_CHAR(2 * CHAR_WIDTH - 1  downto CHAR_WIDTH); -- _
			when "011111" =>
				sCHAR_CODE <= sDATA_BYTE_CHAR(CHAR_WIDTH - 1  downto 0); -- _	
			when others =>
				sCHAR_CODE <= (others => '0');
		end case;	
	end process char_code;
	
	-- Input tri-state buffer
	sIN_DATA  <= ioD 		 when sIN_BUFF_EN  = '1' else  
				   (others => 'Z');
					
	-- Output tri-state buffer
	ioD       <= sOUT_DATA when sOUT_BUFF_EN = '1' else  
				   (others  => 'Z');	


end Behavioral;


