----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:19:15 06/01/2018 
-- Design Name: 
-- Module Name:    lcd_driver - Behavioral 
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


entity lcd_driver is
	 Generic(
		INIT_SEQ_NUMBER : integer := 4;	-- Init commands sequence
		CMD_SEQ_NUMBER  : integer := 3;	-- Command of 4-bit sequence number
		LCD_BUS_WIDTH	 : integer := 4;	-- LCD controler interface width 
		DATA_WIDTH		 : integer := 8;	-- Input data width
		CHAR_NUMBER 	 : integer := 27  -- Number of characters
	 );
    Port ( iCLK   	  : in 		std_logic;
           inRST  	  : in 		std_logic;
			  iSLAVE_ADDR : in 		std_logic_vector(DATA_WIDTH - 1 downto 0);
			  iREG_ADDR   : in 		std_logic_vector(DATA_WIDTH - 1 downto 0);
			  iLOWER_BYTE : in  		std_logic_vector(DATA_WIDTH - 1 downto 0);
			  iUPPER_BYTE : in 		std_logic_vector(DATA_WIDTH - 1 downto 0);
			  iMODE 		  : in		std_logic;
			  iDATA_EN	  : in 		std_logic;
           oE 	   	  : out 		std_logic;
           oRS    	  : out		std_logic;
           oRW   		  : out 		std_logic;
			  oLED		  : out     std_logic_vector(7 downto 0); 
           ioD 		  : inout   std_logic_vector(LCD_BUS_WIDTH - 1 downto 0));
end lcd_driver;

architecture Behavioral of lcd_driver is

	type   tSTATES is (IDLE, LCD_INIT_SEQ, LCD_CONFIG, DISPLAY_CONFIG, 
							 DISPLAY_CONFIG_BF, CLEAR_SCREEN_BF, CLEAR_SCREEN, 
							 ENTRY_MODE_BF, ENTRY_MODE, READ_INPUT_DATA, CHECK_CURSOR,
							 ADDRESS_SET_BF , ADDRESS_SET, 
							 PRINT_CHAR_BF, PRINT_CHAR, 
							 CURSOR_NEW_LINE, CURSOR_BACK,
							 STOP_PRINT); 		-- LCD controller FSM states type																

	signal sCURRENT_STATE 	   	: tSTATES;									  			-- LCD controller FSM current state
	signal sNEXT_STATE    	   	: tSTATES; 									  			-- LCD controller FSM next state

	signal sOUT_BUFF_EN	 	   	: std_logic;								   		-- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	   	: std_logic;	   						  			-- Input tri-state buffer enable

	signal sOUT_DATA					: std_logic_vector(3 downto 0);	     			-- Output data
	signal sIN_DATA					: std_logic_vector(3 downto 0);					-- Input data

	signal sINIT_PERIOD_EN			: std_logic;											-- Init period delay timer enable
	signal sINIT_PERIOD_TC			: std_logic;											-- Init period delay timer treminal count
	
	signal sCMD_PERIOD_EN			: std_logic;											-- Command period timer enable
	signal sCMD_PERIOD_TC			: std_logic;											-- Command period timer treminal count

	signal sSEQ_CNT 					: unsigned(2 downto 0);								-- Command sequence number counter		
	signal sSEQ_CNT_EN 				: std_logic;											-- Command sequence number counter enable
	signal sSEQ_CNT_RST				: std_logic;											-- Command sequence number counter reset
	
	signal sCMD_PER_CNT 				: unsigned(1 downto 0);								-- Command period counter		 
	signal sCMD_PER_CNT_EN			: std_logic;											-- Command period counter enable
	signal sCMD_PER_CNT_RST			: std_logic;											-- Command period counter reset	
	
	signal sCHAR_CNT 					: unsigned(4 downto 0);								-- Character counter
	signal sCHAR_CNT_EN 				: std_logic;											-- Character counter enable
	signal sCHAR_CNT_RST				: std_logic;											-- Character counter reset
	
	signal sSLAVE_ADDR_REG			: std_logic_vector(DATA_WIDTH - 1 downto 0); -- Slave address register	
	signal sREG_ADDR_REG				: std_logic_vector(DATA_WIDTH - 1 downto 0); -- Register address register
	signal sUPPER_BYTE_REG			: std_logic_vector(DATA_WIDTH - 1 downto 0); -- Uppper byte register	
	signal sLOWER_BYTE_REG			: std_logic_vector(DATA_WIDTH - 1 downto 0); -- Lower byte register
	signal sMODE_FF 					: std_logic;											-- Mode register
	
	signal sCHAR_CODE 				: std_logic_vector(DATA_WIDTH - 1 downto 0); -- Character code at display
	
	signal sSLAVE_ADDR_CHAR			: std_logic_vector(15 downto 0); 				-- Slave address char	
	signal sREG_ADDR_CHAR			: std_logic_vector(15 downto 0); 				-- Register address char
	signal sUPPER_BYTE_CHAR			: std_logic_vector(15 downto 0); 				-- Uppper byte char
	signal sLOWER_BYTE_CHAR			: std_logic_vector(15 downto 0); 				-- Lower byte char

	
begin


	-- LCD init delay timer
	eLCD_INIT_TIMER : entity work.lcd_timer
			Generic map (
				CLK_PERIOD_NUMBER => 2160000,
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
				CLK_PERIOD_NUMBER => 12000,
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
	
	-- Upper byte register
	eUPPER_BYTE_REG : entity work.reg
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => iDATA_EN,
				iD 	=> iUPPER_BYTE,
				oQ		=> sUPPER_BYTE_REG
			);
	
	-- Lower byte register	
	eLOWER_BYTE_REG : entity work.reg
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => iDATA_EN,
				iD 	=> iLOWER_BYTE,
				oQ		=> sLOWER_BYTE_REG
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
			
	-- Upper byte char generator		
	eUPPER_BYTE_CHAR_GEN : entity work.char_gen
			Port map(
				iDATA => sUPPER_BYTE_REG,
				oCHAR => sUPPER_BYTE_CHAR
			);	

	-- Lower byte char generator		
	eLOWER_BYTE_CHAR_GEN : entity work.char_gen
			Port map(
				iDATA => sLOWER_BYTE_REG,
				oCHAR => sLOWER_BYTE_CHAR
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
	fsm_next : process (sCURRENT_STATE, sSEQ_CNT, sINIT_PERIOD_TC, sIN_DATA, iDATA_EN, sCHAR_CNT) begin
		case (sCURRENT_STATE) is
			when IDLE =>
				if (sINIT_PERIOD_TC = '1') then
					sNEXT_STATE <= LCD_INIT_SEQ;
				else
					sNEXT_STATE <= IDLE;
				end if;
				
			when LCD_INIT_SEQ => 	
				if (sSEQ_CNT = INIT_SEQ_NUMBER) then
					sNEXT_STATE <= LCD_CONFIG;
				else
					sNEXT_STATE <= LCD_INIT_SEQ;
				end if;
				
			when LCD_CONFIG =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= DISPLAY_CONFIG_BF;
				else
					sNEXT_STATE <= LCD_CONFIG;
				end if;		
				
			when DISPLAY_CONFIG_BF =>
				if (sIN_DATA(3) = '0') then 
					sNEXT_STATE <= DISPLAY_CONFIG; 
				else
					sNEXT_STATE <= DISPLAY_CONFIG_BF;	
				end if;
				
			when  DISPLAY_CONFIG =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= CLEAR_SCREEN_BF;
				else
					sNEXT_STATE <= DISPLAY_CONFIG;
				end if;
				
			when CLEAR_SCREEN_BF =>
				if (sIN_DATA(3) = '0') then 
					sNEXT_STATE <= CLEAR_SCREEN; 
				else
					sNEXT_STATE <= CLEAR_SCREEN_BF;	
				end if;
				
			when  CLEAR_SCREEN =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= ENTRY_MODE_BF;
				else
					sNEXT_STATE <= CLEAR_SCREEN;
				end if;	
					
			when ENTRY_MODE_BF =>
				if (sIN_DATA(3) = '0') then 
					sNEXT_STATE <= ENTRY_MODE; 
				else
					sNEXT_STATE <= ENTRY_MODE_BF;	
				end if;
				
			when ENTRY_MODE =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= ADDRESS_SET_BF;
				else
					sNEXT_STATE <= ENTRY_MODE;
				end if;		
				
			when ADDRESS_SET_BF =>
				if (sIN_DATA(3) = '0') then 
					sNEXT_STATE <= ADDRESS_SET; 
				else
					sNEXT_STATE <= ADDRESS_SET_BF;	
				end if;	
				
			when ADDRESS_SET =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= READ_INPUT_DATA;
				else
					sNEXT_STATE <= ADDRESS_SET;
				end if;	
			
			when READ_INPUT_DATA =>
				if (iDATA_EN = '1') then 
					sNEXT_STATE <= PRINT_CHAR_BF;
				else 
					sNEXT_STATE <= READ_INPUT_DATA;
				end if;
				
			when CHECK_CURSOR => 	
				if (sCHAR_CNT = 16) then
					sNEXT_STATE <= CURSOR_NEW_LINE;
				else
					sNEXT_STATE <= PRINT_CHAR_BF;
				end if;
			
			when PRINT_CHAR_BF =>
				if (sIN_DATA(3) = '0') then 
					sNEXT_STATE <= PRINT_CHAR; 
				else
					sNEXT_STATE <= PRINT_CHAR_BF;	
				end if;
				
			when PRINT_CHAR => 
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= STOP_PRINT;
				else
					sNEXT_STATE <= PRINT_CHAR;
				end if;	
				
			when CURSOR_NEW_LINE =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= PRINT_CHAR_BF;
				else
					sNEXT_STATE <= CURSOR_NEW_LINE;
				end if;		

			when CURSOR_BACK =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= READ_INPUT_DATA;
				else
					sNEXT_STATE <= CURSOR_BACK;
				end if;
				
			when STOP_PRINT =>
				if (sCHAR_CNT = CHAR_NUMBER - 1) then
					sNEXT_STATE <= CURSOR_BACK;
				else
					sNEXT_STATE <= CHECK_CURSOR;
				end if;
								
		end case;
	end process fsm_next;	
	
	oLED <= sSLAVE_ADDR_REG;
	
	-- LCD controller FSM output logic
	fsm_out : process (sCURRENT_STATE, sINIT_PERIOD_TC, sSEQ_CNT, sCMD_PER_CNT, sCHAR_CNT, sCHAR_CODE) begin
		sIN_BUFF_EN	 	 	<= '0';
		sOUT_BUFF_EN	 	<= '1';
		sSEQ_CNT_EN 	 	<= '0';
		sSEQ_CNT_RST 	 	<= '0';
		sCMD_PER_CNT_EN	<= '0';	
		sCMD_PER_CNT_RST	<= '0';
		sCHAR_CNT_EN		<= '0';
		sCHAR_CNT_RST		<= '0';
		sINIT_PERIOD_EN 	<= '0';	
		sCMD_PERIOD_EN  	<= '0';	
		sOUT_DATA		 	<= (others => '0');
		oE 	  			 	<= '0'; 
      oRS    			 	<= '0';
      oRW   			 	<= '0';
		
		--oLED <= (others => '0');
		case (sCURRENT_STATE) is
			when IDLE =>
				sINIT_PERIOD_EN	 <= '1';
			when LCD_INIT_SEQ =>
				if (sINIT_PERIOD_TC = '1') then
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PER_CNT_RST <= '1';
				else
					sSEQ_CNT_EN 	  <= '0';
					sCMD_PER_CNT_RST <= '0';
				end if;	
				
				sINIT_PERIOD_EN <= '1';
				
				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;				
				
				if (sCMD_PER_CNT = 3) then
					sCMD_PERIOD_EN  <= '0';
					sCMD_PER_CNT_EN <= '0';
				else
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';
				end if;	
				
				if (sSEQ_CNT > 2) then					
					if (sSEQ_CNT = 4) then
						sCMD_PERIOD_EN  <= '0';
						sSEQ_CNT_RST 	 <= '1';
					else						
						sSEQ_CNT_RST 	 <= '0';
					end if;					
					sOUT_DATA 		 <= "0010";
				else  
					sOUT_DATA 		 <= "0011";				
				end if;
							
			when LCD_CONFIG =>
			
				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;		
			
				if (sSEQ_CNT = 1) then		

					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	  <= '0';
						sCMD_PER_CNT_RST <= '0';						
					end if;
					
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';
					
					sOUT_DATA 		 <= "0010";
				elsif (sSEQ_CNT = 2) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	 <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	 <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';				
					
					sOUT_DATA 		 <= "1000";
				else
					if (sINIT_PERIOD_TC = '1') then
						sSEQ_CNT_EN 	 <= '1';
					else
						sSEQ_CNT_EN 	 <= '0';
					end if;	
					
					sCMD_PERIOD_EN  <= '0';
					sCMD_PER_CNT_EN <= '0';
					
					sOUT_DATA 		 <= "0000";
				end if;
				
				sINIT_PERIOD_EN <= '1';	
						
			when DISPLAY_CONFIG_BF =>
			
				sIN_BUFF_EN	 	 <= '1';
				sOUT_BUFF_EN	 <= '0';
				oRW   			 <= '1';
				sSEQ_CNT_RST 	 <= '1';
				
				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sCMD_PER_CNT = 3) then
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
				else
					sCMD_PERIOD_EN   <= '1';
					sCMD_PER_CNT_EN  <= '1';
				end if;
			
			when DISPLAY_CONFIG =>
			
				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sSEQ_CNT = 1) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	 <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	 <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';			
					sOUT_DATA 		 <= "0000";
				elsif (sSEQ_CNT = 2) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	  <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';			
					sOUT_DATA 		 <= "1100";
				else
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
					sCMD_PER_CNT_RST <= '1';
					sOUT_DATA 		  <= "0000";
				end if;
				
								
			when CLEAR_SCREEN_BF =>

				sIN_BUFF_EN	 	 <= '1';
				sOUT_BUFF_EN	 <= '0';
				oRW   			 <= '1';
				sSEQ_CNT_RST 	 <= '1';
				
				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sCMD_PER_CNT = 3) then
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
				else
					sCMD_PERIOD_EN   <= '1';
					sCMD_PER_CNT_EN  <= '1';
				end if;
		
			when CLEAR_SCREEN =>

				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sSEQ_CNT = 1) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	 <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	 <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';			
					sOUT_DATA 		 <= "0000";
				elsif (sSEQ_CNT = 2) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	  <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';			
					sOUT_DATA 		 <= "0001";
				else
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
					sCMD_PER_CNT_RST <= '1';
					sOUT_DATA 		  <= "0000";
				end if;

			when ENTRY_MODE_BF =>

				sIN_BUFF_EN	 	 <= '1';
				sOUT_BUFF_EN	 <= '0';
				oRW   			 <= '1';
				sSEQ_CNT_RST 	 <= '1';
				
				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sCMD_PER_CNT = 3) then
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
				else
					sCMD_PERIOD_EN   <= '1';
					sCMD_PER_CNT_EN  <= '1';
				end if;

			when ENTRY_MODE =>
			
				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sSEQ_CNT = 1) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	 <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	 <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';			
					sOUT_DATA 		 <= "0000";
				elsif (sSEQ_CNT = 2) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	  <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';			
					sOUT_DATA 		 <= "0110";
				else
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
					sCMD_PER_CNT_RST <= '1';
					sOUT_DATA 		  <= "0000";
				end if;
				
			when ADDRESS_SET_BF =>

				sIN_BUFF_EN	 	 <= '1';
				sOUT_BUFF_EN	 <= '0';
				oRW   			 <= '1';
				sSEQ_CNT_RST 	 <= '1';
				
				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sCMD_PER_CNT = 3) then
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
				else
					sCMD_PERIOD_EN   <= '1';
					sCMD_PER_CNT_EN  <= '1';
				end if;	

			when ADDRESS_SET =>
			
				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sSEQ_CNT = 1) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	 <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	 <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';			
					sOUT_DATA 		 <= "1000";
				elsif (sSEQ_CNT = 2) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	  <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';			
					sOUT_DATA 		 <= "0000";
				else
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
					sCMD_PER_CNT_RST <= '1';
					sOUT_DATA 		  <= "0000";
				end if;		
				
			when READ_INPUT_DATA =>

				sCHAR_CNT_RST <= '1';
				--oLED <= (others => '1');
			
			when PRINT_CHAR_BF =>

				sIN_BUFF_EN	 	 <= '1';
				sOUT_BUFF_EN	 <= '0';
				oRW   			 <= '1';
				sSEQ_CNT_RST 	 <= '1';
				
				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sCMD_PER_CNT = 3) then
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
				else
					sCMD_PERIOD_EN   <= '1';
					sCMD_PER_CNT_EN  <= '1';
				end if;
				
			when PRINT_CHAR =>

				oRS <= '1';

				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sSEQ_CNT = 1) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	 <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	 <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';		
					sCHAR_CNT_EN	 <= '0';					
					sOUT_DATA 		 <= sCHAR_CODE(DATA_WIDTH - 1 downto 4);
				elsif (sSEQ_CNT = 2) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	  <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';		
					sCHAR_CNT_EN	 <= '0';	
					sOUT_DATA 		 <= sCHAR_CODE(3 downto 0);
				else
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
					sCMD_PER_CNT_RST <= '1';
					if (sSEQ_CNT = 3) then
						sCHAR_CNT_EN	  <= '1';
					else
						sCHAR_CNT_EN	  <= '0';
					end if;
					sOUT_DATA 		  <= "0000";
				end if;	

			when CURSOR_NEW_LINE =>

				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sSEQ_CNT = 1) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	 <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	 <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';
					sOUT_DATA 		 <= "1100";
				elsif (sSEQ_CNT = 2) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	  <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';			
					sOUT_DATA 		 <= "0000";
				else
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
					sCMD_PER_CNT_RST <= '1';
					sOUT_DATA 		  <= "0000";
				end if;

			when CURSOR_BACK =>

				if (sCMD_PER_CNT = 1) then 
					oE <= '1';
				else
					oE <= '0';
				end if;
				
				if (sSEQ_CNT = 1) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	 <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	 <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';
					sOUT_DATA 		 <= "0000";
				elsif (sSEQ_CNT = 2) then
				
					if (sCMD_PER_CNT = 3) then
						sSEQ_CNT_EN 	  <= '1';
						sCMD_PER_CNT_RST <= '1';
					else
						sSEQ_CNT_EN 	  <= '0';
						sCMD_PER_CNT_RST <= '0';
					end if;
				
					sCMD_PERIOD_EN  <= '1';
					sCMD_PER_CNT_EN <= '1';			
					sOUT_DATA 		 <= "0010";
				else
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
					sCMD_PER_CNT_RST <= '1';
					sOUT_DATA 		  <= "0000";
				end if;		
				
			when CHECK_CURSOR =>
			
	
			when STOP_PRINT =>
					
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
	
	-- Char code process 
	char_code : process (sCHAR_CNT, sSLAVE_ADDR_CHAR, sREG_ADDR_CHAR, sMODE_FF, sUPPER_BYTE_CHAR, sLOWER_BYTE_CHAR) begin
		case (sCHAR_CNT) is
			when "00000" =>
				sCHAR_CODE <= "01010011"; -- S
			when "00001" =>
				sCHAR_CODE <= "01000001"; -- A
			when "00010" =>
				sCHAR_CODE <= "00111010"; -- :
			when "00011" =>
				sCHAR_CODE <= "00110000"; -- 0
			when "00100" =>
				sCHAR_CODE <= "01111000"; -- x
			when "00101" =>
				sCHAR_CODE <= sSLAVE_ADDR_CHAR(15 downto 8); -- _
			when "00110" =>
				sCHAR_CODE <= sSLAVE_ADDR_CHAR(7  downto 0);  -- _	
			when "00111" =>
				sCHAR_CODE <= "01111100"; -- |
			when "01000" =>
				sCHAR_CODE <= "01010010"; -- R
			when "01001" =>
				sCHAR_CODE <= "01000001"; -- A
			when "01010" =>
				sCHAR_CODE <= "00111010"; -- :
			when "01011" =>
				sCHAR_CODE <= "00110000"; -- 0
			when "01100" =>
				sCHAR_CODE <= "01111000"; -- x
			when "01101" =>
				sCHAR_CODE <= sREG_ADDR_CHAR(15 downto 8); -- _	 	
			when "01110" =>
				sCHAR_CODE <= sREG_ADDR_CHAR(7  downto 0); -- _				
			when "01111" =>
				if (sMODE_FF = '1') then
					sCHAR_CODE <= "01010010"; -- R
				else 
					sCHAR_CODE <= "01010111"; -- W
				end if;
			when "10000" =>
				sCHAR_CODE <= "01000100"; -- D
			when "10001" =>
				sCHAR_CODE <= "01000001"; -- A
			when "10010" =>
				sCHAR_CODE <= "01010100"; -- T
			when "10011" =>
				sCHAR_CODE <= "00111010"; -- :
			when "10100" =>
				sCHAR_CODE <= "00110000"; -- 0	
			when "10101" =>
				sCHAR_CODE <= "01111000"; -- x
			when "10110" =>
				sCHAR_CODE <= sUPPER_BYTE_CHAR(15 downto 8); -- _
			when "10111" =>
				sCHAR_CODE <= sUPPER_BYTE_CHAR(7  downto 0); -- _
			when "11000" =>
				sCHAR_CODE <= sLOWER_BYTE_CHAR(15 downto 8); -- _
			when others =>
				sCHAR_CODE <= sLOWER_BYTE_CHAR(7  downto 0); -- _
		end case;	
	end process char_code;
	
	-- Input tri-state buffer
	sIN_DATA  <= ioD 		 when sIN_BUFF_EN  = '1' else  
				   (others => 'Z');
					
	-- Output tri-state buffer
	ioD       <= sOUT_DATA when sOUT_BUFF_EN = '1' else  
				   (others  => 'Z');	


end Behavioral;


