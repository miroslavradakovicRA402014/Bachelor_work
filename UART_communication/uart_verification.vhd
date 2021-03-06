----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:52 04/18/2018 
-- Design Name: 
-- Module Name:    uart_verification - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_verification is
	 Generic (
		DATA_WIDTH : integer := 8
	 );
    Port ( iCLK  		: in  std_logic;
           inRST 		: in  std_logic;
			  iRX 		: in  std_logic;
			  inREAD		: in  std_logic;
			  inWRITE 	: in  std_logic;
			  iSW_DATA	: in  std_logic_vector(DATA_WIDTH - 1 downto 0);
			  oTX			: out std_logic;
           oLED_DATA : out std_logic_vector(DATA_WIDTH - 1 downto 0));
end uart_verification;

architecture Behavioral of uart_verification is

	type 	 tSTATES is (IDLE, SEND, RECIVE); 
	signal sCURRENT_STATE : tSTATES;
	signal sNEXT_STATE 	 : tSTATES;

	signal sRECV_DATA_REG : std_logic_vector(DATA_WIDTH - 1 downto 0); -- Recive register enable
	signal sRECV_REG_EN   : std_logic; 											 -- Recived data register enable
	
	signal sIUART_DATA	 : std_logic_vector(DATA_WIDTH - 1 downto 0); -- Recived UART data	 
	signal sOUART_DATA	 : std_logic_vector(DATA_WIDTH - 1 downto 0); -- Recived UART data
	
	signal sUART_READ 	 : std_logic;
	signal sUART_WRITE  	 : std_logic;
	
	signal sUART_FULL		 : std_logic;
	signal sUART_EMPTY	 : std_logic;
	-- Debounced buttons
	signal snDREAD		 	 : std_logic; 											  
	signal snDWRITE 		 : std_logic;
	
	
	component uart is
		 Generic (
			DATA_WIDTH : integer := 8
		 );
		 Port ( iCLK        		 : in   std_logic;
				  inRST       		 : in   std_logic;
				  iRX         		 : in   std_logic;
				  iUART_DATA		 : in   std_logic_vector(DATA_WIDTH - 1 downto 0);
				  iUART_WR 			 : in	  std_logic;
				  iUART_RD    		 : in   std_logic;
				  oTX         		 : out  std_logic;
				  oUART_FULL       : out  std_logic;
				  oUART_EMPTY      : out  std_logic;
				  oUART_DATA       : out  std_logic_vector(DATA_WIDTH - 1 downto 0));
	end component uart;	
	
	component debouncer is
	 Generic (
		 DEBOUNCE_PERIOD : integer := 48000
	 );
    Port ( iCLK 		: in  STD_LOGIC;
           inRST 		: in  STD_LOGIC;
           iBUTT 		: in  STD_LOGIC;
           oDEB_BUTT : out  STD_LOGIC);
	end component debouncer;

begin

	-- UART
	eUART : uart 
		Port map (
			iCLK        		 => iCLK,
			inRST       		 => inRST,
			iRX         		 => iRX,
			iUART_DATA		 	 => sOUART_DATA,
			iUART_WR 			 => sUART_WRITE,
			iUART_RD    		 => sUART_READ,
			oTX         		 => oTX,
			oUART_FULL         => sUART_FULL,
			oUART_EMPTY      	 => sUART_EMPTY,
			oUART_DATA       	 => sIUART_DATA
		);
	
	-- Button debouncers
	eREAD_BUTT_DEBOUNCER : debouncer 
		Port map (
			iCLK 			=> iCLK,
         inRST 		=> inRST,
         iBUTT 		=> inREAD, 
         oDEB_BUTT 	=>	snDREAD	
		);
		
	eWRITE_BUTT_DEBOUNCER : debouncer 
		Port map (
			iCLK 			=> iCLK,
         inRST 		=> inRST,
         iBUTT 		=> inWRITE, 
         oDEB_BUTT 	=>	snDWRITE	
		);	
	
	
	-- FSM register
	fsm_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sCURRENT_STATE <= IDLE;
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE;
		end if;
	end process fsm_reg;
	
	-- Next state logic
	fsm_next : process (sCURRENT_STATE, snDWRITE, snDREAD) begin
		case (sCURRENT_STATE) is
			when IDLE   =>
				if (snDREAD = '0') then
					sNEXT_STATE <= RECIVE;
				elsif (snDWRITE = '0') then
					sNEXT_STATE <= SEND;
				else 
					sNEXT_STATE <= IDLE;
				end if;
			when SEND   =>
				sNEXT_STATE <= IDLE;
			when RECIVE =>
				sNEXT_STATE <= IDLE;
		end case;
	end process fsm_next;
	
	-- FSM output logic
	fsm_out : process (sCURRENT_STATE) begin
		case (sCURRENT_STATE) is
			when IDLE   =>
				sUART_READ   <= '0';
				sUART_WRITE  <= '0';
				sRECV_REG_EN <= '0';
			when SEND   =>
				sUART_READ   <= '0';
				sUART_WRITE  <= '1';
				sRECV_REG_EN <= '0';				
			when RECIVE =>
				sUART_READ   <= '1';
				sUART_WRITE  <= '0';
				sRECV_REG_EN <= '1';
		end case;
	end process fsm_out;

	-- Recived data register
	rec_data_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sRECV_DATA_REG <= (others => '0');
		elsif (iCLK'event and iCLK = '1') then
			if (sRECV_REG_EN = '1') then
				if (sUART_EMPTY = '0') then
					sRECV_DATA_REG <= sIUART_DATA;
				else 
					sRECV_DATA_REG <= (others => '1');
				end if;
			end if;
		end if;
	end process rec_data_reg;
	
	-- Send data
	sOUART_DATA <= iSW_DATA when sUART_FULL = '0' else
						(others => '1');
	-- LED output
	---ssoLED_DATA   <= sRECV_DATA_REG;
	oLED_DATA <= "11110000" when sUART_EMPTY = '0' else 
			       "00001111";

end Behavioral;

