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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lcd_driver is
	 Generic(
		INIT_SEQ_NUMBER : integer := 4;	-- Init commands sequence
		CMD_SEQ_NUMBER  : integer := 3	-- Command of 4-bit sequence number
	 );
    Port ( iCLK   : in 		std_logic;
           inRST  : in 		std_logic;
           oE 	   : out 	std_logic;
           oRS    : out		std_logic;
           oRW   	: out 	std_logic;
			  oLED	: out 	std_logic_vector(7 downto 0);
           ioD 	: inout  std_logic_vector (3 downto 0));
end lcd_driver;

architecture Behavioral of lcd_driver is

	type   tSTATES is (IDLE, LCD_INIT_SEQ, LCD_CONFIG, DISPLAY_CONFIG, 
							 DISPLAY_CONFIG_BF, CLEAR_SCREEN_BF, CLEAR_SCREEN, 
							 CURSOR_CONFIG_BF, CURSOR_CONFIG, DISPLAY_ON_BF, DISPLAY_ON,
							 PRINT_H_BF, PRINT_H ,STOP_PRINT); 		-- LCD controller FSM states type																

	signal sCURRENT_STATE 	   	: tSTATES;									  	-- LCD controller FSM current state
	signal sNEXT_STATE    	   	: tSTATES; 									  	-- LCD controller FSM next state

	signal sOUT_BUFF_EN	 	   	: std_logic;								   -- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	   	: std_logic;	   						  	-- Input tri-state buffer enable

	signal sOUT_DATA					: std_logic_vector(3 downto 0);	     	-- Output data
	signal sIN_DATA					: std_logic_vector(3 downto 0);			-- Input data

	signal sINIT_PERIOD_EN			: std_logic;									-- Init period delay timer enable
	signal sINIT_PERIOD_TC			: std_logic;									-- Init period delay timer treminal count
	
	signal sCMD_PERIOD_EN			: std_logic;									-- Command period timer enable
	signal sCMD_PERIOD_TC			: std_logic;									-- Command period timer treminal count

	signal sSEQ_CNT 					: unsigned(2 downto 0);						
	signal sSEQ_CNT_EN 				: std_logic;
	signal sSEQ_CNT_RST				: std_logic;
	
	signal sCMD_PER_CNT 				: unsigned(1 downto 0);						-- Command part timer		
	signal sCMD_PER_CNT_RST			: std_logic;
	signal sCMD_PER_CNT_EN			: std_logic;
	
begin

	-- LCD init delay timer
	eLCD_INIT_TIMER : entity work.lcd_timer
			Generic map (
				CLK_PERIOD_NUMBER => 360000,
				CLK_CNT_WIDHT		=> 19
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
				CLK_PERIOD_NUMBER => 10,
				CLK_CNT_WIDHT		=> 4
			)
			Port map(
				iCLK  	  => iCLK,
				inRST 	  => inRST,
				iTIMER_EN  => sCMD_PERIOD_EN,
				oTC 	  	  => sCMD_PERIOD_TC
			);	

	-- FSM state register process
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then 
			sCURRENT_STATE <= IDLE; -- Reset FSM
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE; -- Move to next state
		end if;
	end process fsm_reg;
	
	-- LCD controller FSM next state logic
	fsm_next : process (sCURRENT_STATE, sSEQ_CNT, sINIT_PERIOD_TC, sIN_DATA) begin
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
					sNEXT_STATE <= CURSOR_CONFIG_BF;
				else
					sNEXT_STATE <= CLEAR_SCREEN;
				end if;	
			when CURSOR_CONFIG_BF =>
				if (sIN_DATA(3) = '0') then 
					sNEXT_STATE <= CURSOR_CONFIG; 
				else
					sNEXT_STATE <= CURSOR_CONFIG_BF;	
				end if;
			when CURSOR_CONFIG =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= DISPLAY_ON_BF;
				else
					sNEXT_STATE <= CURSOR_CONFIG;
				end if;	
			when DISPLAY_ON_BF =>
				if (sIN_DATA(3) = '0') then 
					sNEXT_STATE <= DISPLAY_ON; 
				else
					sNEXT_STATE <= DISPLAY_ON_BF;	
				end if;	
			when DISPLAY_ON =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= PRINT_H_BF;
				else
					sNEXT_STATE <= DISPLAY_ON;
				end if;			
			when PRINT_H_BF =>
				if (sIN_DATA(3) = '0') then 
					sNEXT_STATE <= PRINT_H; 
				else
					sNEXT_STATE <= PRINT_H_BF;	
				end if;
			when PRINT_H => 
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= STOP_PRINT;
				else
					sNEXT_STATE <= PRINT_H;
				end if;			
			when STOP_PRINT =>
				sNEXT_STATE <= DISPLAY_ON_BF;
		end case;
	end process fsm_next;	
	
	-- LCD controller FSM output logic
	fsm_out : process (sCURRENT_STATE, sINIT_PERIOD_TC, sSEQ_CNT, sCMD_PER_CNT) begin
		sIN_BUFF_EN	 	 	<= '0';
		sOUT_BUFF_EN	 	<= '1';
		sSEQ_CNT_EN 	 	<= '0';
		sSEQ_CNT_RST 	 	<= '0';
		sCMD_PER_CNT_EN	<= '0';	
		sCMD_PER_CNT_RST	<= '0';
		sINIT_PERIOD_EN 	<= '0';	
		sCMD_PERIOD_EN  	<= '0';	
		sOUT_DATA		 	<= (others => '0');
		oE 	  			 	<= '0'; 
      oRS    			 	<= '0';
      oRW   			 	<= '0';
		
		oLED <= (others => '0');
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
					sOUT_DATA 		 <= "1000";
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

			when CURSOR_CONFIG_BF =>

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

			when CURSOR_CONFIG =>
			
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
				
			when DISPLAY_ON_BF =>

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

			when DISPLAY_ON =>
			
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
					sOUT_DATA 		 <= "1110";
				else
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
					sCMD_PER_CNT_RST <= '1';
					sOUT_DATA 		  <= "0000";
				end if;		
				
			when PRINT_H_BF =>

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
				
			when PRINT_H =>

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
					sOUT_DATA 		 <= "0100";
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
					sOUT_DATA 		 <= "1000";
				else
					sSEQ_CNT_EN 	  <= '1';
					sCMD_PERIOD_EN   <= '0';
					sCMD_PER_CNT_EN  <= '0';
					sCMD_PER_CNT_RST <= '1';
					sOUT_DATA 		  <= "0000";
				end if;			
				
			when STOP_PRINT =>
				oLED <= (others => '1');
				
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
	
	-- Input tri-state buffer
	sIN_DATA  <= ioD 		 when sIN_BUFF_EN  = '1' else  
				   (others => 'Z');
					
	-- Output tri-state buffer
	ioD       <= sOUT_DATA when sOUT_BUFF_EN = '1' else  
				   (others  => 'Z');	


end Behavioral;


