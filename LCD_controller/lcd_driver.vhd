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
		INIT_SEQ_NUMBER : integer := 3;	-- Init commands sequence
		CMD_SEQ_NUMBER  : integer := 2	-- Command sequence 
	 );
    Port ( iCLK   : in 		std_logic;
           inRST  : in 		std_logic;
           oE 	   : out 	std_logic;
           oRS    : out		std_logic;
           oRW   	: out 	std_logic;
           ioD 	: inout  std_logic_vector (3 downto 0));
end lcd_driver;

architecture Behavioral of lcd_driver is

	type   tSTATES is (IDLE, LCD_INIT_SEQ, LCD_INIT_CMD, LCD_CONFIG); -- LCD controller FSM states type																

	signal sCURRENT_STATE 	   	: tSTATES;									-- LCD controller FSM current state
	signal sNEXT_STATE    	   	: tSTATES; 									-- LCD controller FSM next state

	signal sOUT_BUFF_EN	 	   	: std_logic;								-- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	   	: std_logic;	   						-- Input tri-state buffer enable

	signal sOUT_DATA					: std_logic_vector(3 downto 0);		-- Output data
	signal sIN_DATA					: std_logic_vector(3 downto 0);		-- Input data

	signal sINIT_PERIOD_EN			: std_logic;								-- Init period timer enable
	signal sINIT_PERIOD_TC			: std_logic;								-- Init period timer treminal count

	signal sSEQ_CNT 					: unsigned(3 downto 0);
	signal sSEQ_CNT_EN 				: std_logic;
	signal sSEQ_CNT_RST				: std_logic;
	

begin

	-- LCD timer
	eLCD_TIMER : entity work.lcd_timer
			Port map(
				iCLK  	  => iCLK,
				inRST 	  => inRST,
				iTIMER_EN  => sINIT_PERIOD_EN,
				oTC 	  	  => sINIT_PERIOD_TC
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
	fsm_next : process (sCURRENT_STATE, sSEQ_CNT, sINIT_PERIOD_TC) begin
		case (sCURRENT_STATE) is
			when IDLE =>
				if (sINIT_PERIOD_TC = '1') then
					sNEXT_STATE <= LCD_INIT_SEQ;
				else
					sNEXT_STATE <= IDLE;
				end if;
			when LCD_INIT_SEQ => 	
				if (sSEQ_CNT = INIT_SEQ_NUMBER) then
					sNEXT_STATE <= LCD_INIT_CMD;
				else
					sNEXT_STATE <= LCD_INIT_SEQ;
				end if;
			when LCD_INIT_CMD =>
				if (sINIT_PERIOD_TC = '1') then
					sNEXT_STATE <= LCD_CONFIG;
				else
					sNEXT_STATE <= LCD_INIT_CMD;
				end if;
			when LCD_CONFIG =>
				if (sSEQ_CNT = CMD_SEQ_NUMBER) then
					sNEXT_STATE <= LCD_INIT_CMD;
				else
					sNEXT_STATE <= LCD_CONFIG;
				end if;							
		end case;
	end process fsm_next;	
	
	-- LCD controller FSM output logic
	fsm_out : process (sCURRENT_STATE, sSEQ_CNT, sINIT_PERIOD_TC) begin
		sIN_BUFF_EN	 	 <= (others => '0');
		sOUT_BUFF_EN	 <= (others => '1');
		sSEQ_CNT_EN 	 <= '0';
		sSEQ_CNT_RST 	 <= '0';		
		sINIT_PERIOD_EN <= '0';
		sOUT_DATA		 <= (others => '0');
		oE 	  			 <= '0'; 
      oRS    			 <= '0';
      oRW   			 <= '0';
		case (sCURRENT_STATE) is
			when IDLE =>
				sINIT_PERIOD_EN	 <= '1';
			when LCD_INIT_SEQ =>
				if (sINIT_PERIOD_TC = '1') then
					sSEQ_CNT_EN 	 <= '1';
				else
					sSEQ_CNT_EN 	 <= '0';
				end if;	
				sINIT_PERIOD_EN <= '1';
				sOUT_DATA 		 <= "0011";
			when LCD_INIT_CMD =>
				if (sINIT_PERIOD_TC = '1') then
					sOUT_DATA 		 <= "0011";
				else
					sOUT_DATA 		 <= "0011";
				end if;	
				sINIT_PERIOD_EN <= '1';
			when LCD_CONFIG =>
				if (sSEQ_CNT = 1) then
					sSEQ_CNT_EN 	 <= '1';
					sOUT_DATA 		 <= "0010";
				elsif (sSEQ_CNT = 2) else
					sSEQ_CNT_EN 	 <= '0'
					sOUT_DATA 		 <= "0100";
				else
					if (sINIT_PERIOD_TC = '1') then
						sSEQ_CNT_EN 	 <= '1';
					else
						sSEQ_CNT_EN 	 <= '0';
					end if;	
					sOUT_DATA 		 <= "0000";
				end if;
				sINIT_PERIOD_EN <= '1';			
		end case;
	end process fsm_out;	
	
	-- Sequence number counter process 
	seq_cnt : process (iCLK, inRST) begin
		if (inRST = '0') then
			sSEQ_CNT <= (others <= '0'); 
		elsif (iCLK'event and iCLK = '1') then
			if (sSEQ_CNT_RST = '1')
				sSEQ_CNT <= (others <= '0');	
			elsif (sSEQ_CNT_EN = '1') then
				sSEQ_CNT <= sSEQ_CNT + 1;
			end if;
		end if;
	end process seq_cnt;
	
	-- Input tri-state buffer
	sIN_DATA  <= ioD 		 when sIN_BUFF_EN  = '1' else  
				   (others => 'Z');
					
	-- Output tri-state buffer
	ioD      <= sOUT_DATA when sOUT_BUFF_EN = '1' else  
				   (others  => 'Z');	


end Behavioral;


