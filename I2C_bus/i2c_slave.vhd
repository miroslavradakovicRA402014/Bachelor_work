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


entity i2c_slave is
	 Generic(
		REGISTER_NUM	: integer := 16;  -- Number of slave register
		DATA_WIDTH 		: integer := 8 	-- Data width
	 );
    Port ( iCLK 	: in  	std_logic;
           inRST 	: in  	std_logic;
           iSCL 	: in  	std_logic;
           ioSDA  : inout  std_logic);
end i2c_slave;

architecture Behavioral of i2c_slave is

	type tSTATES is (IDLE, START, SLAVE_ADDRESS_MODE, SLAVE_ADDRESS_ACK, REGISTER_ADDRESS, STOP, 
						  REGISTER_ACK, REGISTER_NACK, READ_DATA, READ_ACK, WRITE_DATA, WRITE_ACK); 	   -- Slave FSM states type																

	signal sCURRENT_STATE : tSTATES;																				 		-- Slave FSM current state
	signal sNEXT_STATE    : tSTATES; 																			 		-- Slave FSM next state

	signal sDEC  			 : std_logic_vector(REGISTER_NUM - 1 downto 0);
	signal sSHW				 : std_logic_vector(DATA_WIDTH	- 1 downto 0);								 		-- Input shift register 

	type   tREGS is array (REGISTER_NUM - 1 downto 0) of std_logic_vector(DATA_WIDTH - 1 downto 0); -- Slave registers type
	signal sREGS : tREGS;		
																																	-- Slave registers  
	signal sOUT_BUFF_EN	 	 : std_logic;																					-- Output tri-state buffer enable
	signal sIN_BUFF_EN	 	 : std_logic;																					-- Input tri-state buffer enable

	signal sSDA_IN			 	 : std_logic;																					-- SDA input signal
	signal sSDA_OUT 		 	 : std_logic;																					-- SDA output signal

	signal sDATA_CNT 		 	 : std_logic_vector(2 downto 0);															-- Data counter
	signal sDATA_CNT_EN 	 	 : std_logic;																					-- Data counter enable		

	signal sPERIOD_CNT 		 : std_logic_vector(2 downto 0);															-- Data counter
	signal sPERIOD_CNT_EN 	 : std_logic;																					-- Data counter enable

begin

	-- Generate slave registers
	reg_gen : for i in 0 to REGISTER_NUM - 1 generate
		eSLAVE_REG : entity work.reg 
			Port map(
				iCLK  => iCLK,
				inRST => inRST,
				iWE   => sDEC(i),
				iD    => sSHW,
				oQ		=> sREGS(i)
			);
	end generate reg_gen;

	-- FSM state register process
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then 
			sCURRENT_STATE <= IDLE; -- Reset FSM
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE; -- Move to next state
		end if;
	end process fsm_reg;
	
	-- Slave FSM next state logic
	fsm_next : process (sCURRENT_STATE, iSCL, ioSDA) begin
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
					sNEXT_STATE <= SLAVE_ADDRESS_MODE; -- Get slave address and mode
				else 
					sNEXT_STATE <= START;
				end if;
			when SLAVE_ADDRESS_MODE =>
				if (sPERIOD_CNT_TC = '1') then
					if (s)
				else
			
				end if;
		end case;
	end process fsm_next;
	
	-- Reciver FSM output logic
	fsm_out : process (sCURRENT_STATE) begin
		case (sCURRENT_STATE) is
			when IDLE   =>
				sIN_BUFF_EN	 <= '1';
				sOUT_BUFF_EN <= '0';
			when START  => 
				sIN_BUFF_EN	 <= '1';
				sOUT_BUFF_EN <= '0';
			when others =>		
				sIN_BUFF_EN	 <= '1';
				sOUT_BUFF_EN <= '0';			
		end case;
	end process fsm_out;
	
	
	sSHW <= (others => '1');
	sDEC <= (others => '0');
	
	-- Input tri-state buffer
	sSDA_IN  <= ioSDA 	when sIN_BUFF_EN  = '1' else  
				   'Z';
	-- Output tri-state buffer
	ioSDA    <= sSDA_OUT when sOUT_BUFF_EN = '1' else  
				   'Z';				  

end Behavioral;

