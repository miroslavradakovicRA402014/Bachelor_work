----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic
-- 
-- Create Date:    08:13:51 04/20/2018 
-- Design Name: 
-- Module Name:    uart_verification_return - Behavioral 
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


entity uart_verification_return is
	 Generic (
		BAUD_RATE_SEL : integer := 3;
		DATA_BIT_SEL  : integer := 2;
		DATA_WIDTH    : integer := 8
	 );
    Port ( iCLK  		    	  : in  std_logic;
           inRST 		    	  : in  std_logic;
			  iPARITY_EN_SW 	  : in  std_logic;
			  iPARITY_SW    	  : in  std_logic;
			  iHANDSHAKE_EN_SW  : in  std_logic;
			  iDATA_BIT_SW  	  : in  std_logic_vector(DATA_BIT_SEL - 1 downto 0);
			  iCTS			 	  : in  std_logic;
			  iRX 		    	  : in  std_logic;
			  iBAUD_SW	    	  : in  std_logic_vector(BAUD_RATE_SEL - 1 downto 0);
			  oTX			    	  : out std_logic;
			  oRTS			 	  : out std_logic;
           oLED_DATA     	  : out std_logic_vector(DATA_WIDTH - 1 downto 0));
end uart_verification_return;

architecture Behavioral of uart_verification_return is

	type 	 tSTATES is (IDLE, RECIVE, SEND); 
	signal sCURRENT_STATE : tSTATES;
	signal sNEXT_STATE 	 : tSTATES;

	signal sRECV_DATA_REG : std_logic_vector(DATA_WIDTH - 1 downto 0); -- Recive register enable
	signal sRECV_REG_EN   : std_logic; 											 -- Recived data register enable
	
	signal sIUART_DATA	 : std_logic_vector(DATA_WIDTH - 1 downto 0); -- Recived UART data	 
	signal sOUART_DATA	 : std_logic_vector(DATA_WIDTH - 1 downto 0); -- Recived UART data
	
	signal sUART_READ 	 : std_logic; -- Read UART
	signal sUART_WRITE  	 : std_logic; -- Write to UART
	
	signal sUART_FULL		 : std_logic;
	signal sUART_EMPTY	 : std_logic;

		
	component uart is
	 Generic (
		BAUD_RATE_SEL : integer := 3;  -- Width of baud rate select
		DATA_BIT_SEL  : integer := 2;  -- Width of data bit number select
		DATA_WIDTH    : integer := 8	 -- Data widht 
	 );
    Port ( iCLK        		 : in   std_logic;
           inRST       		 : in   std_logic;
			  iPARITY_EN		 : in   std_logic;
			  iPARITY			 : in   std_logic;
			  iHANDSHAKE_EN 	 : in   std_logic;
			  iDATA_SEL			 : in   std_logic_vector(DATA_BIT_SEL  - 1 downto 0);
			  iBAUD_SEL			 : in   std_logic_vector(BAUD_RATE_SEL - 1 downto 0);
			  iCTS				 : in   std_logic;
           iRX         		 : in   std_logic;
			  iUART_DATA		 : in   std_logic_vector(DATA_WIDTH 	- 1 downto 0);
			  iUART_WR 			 : in	  std_logic;
           iUART_RD    		 : in   std_logic;
			  oTX         		 : out  std_logic;
			  oRTS				 : out  std_logic;
			  oUART_FULL       : out  std_logic;
           oUART_EMPTY      : out  std_logic;
           oUART_DATA       : out  std_logic_vector(DATA_WIDTH - 1 downto 0));
	end component uart;	
	
begin

	-- UART
	eUART : uart 
		Port map (
			iCLK        		 => iCLK,
			inRST       		 => inRST,
			iPARITY_EN			 => iPARITY_EN_SW,
			iPARITY				 => iPARITY_SW,
			iHANDSHAKE_EN		 => iHANDSHAKE_EN_SW,
			iDATA_SEL			 => iDATA_BIT_SW,
			iBAUD_SEL			 => iBAUD_SW,
			iCTS					 => iCTS,
			iRX         		 => iRX,
			iUART_DATA		 	 => sOUART_DATA,
			iUART_WR 			 => sUART_WRITE,
			iUART_RD    		 => sUART_READ,
			oTX         		 => oTX,
			oRTS					 => oRTS,
			oUART_FULL         => sUART_FULL,
			oUART_EMPTY      	 => sUART_EMPTY,
			oUART_DATA       	 => sIUART_DATA
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
	fsm_next : process (sCURRENT_STATE, sUART_EMPTY) begin
		case (sCURRENT_STATE) is
			when IDLE   =>
				if (sUART_EMPTY = '0') then
					sNEXT_STATE <= RECIVE;
				else 
					sNEXT_STATE <= IDLE;
				end if;
			when RECIVE =>	
				sNEXT_STATE <= SEND;
			when SEND =>
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
			when RECIVE =>
				sUART_READ   <= '1';
				sUART_WRITE  <= '0';
				sRECV_REG_EN <= '1';				
			when SEND   =>
				sUART_READ   <= '0';
				sUART_WRITE  <= '1';
				sRECV_REG_EN <= '0';				
		end case;
	end process fsm_out;

	-- Recived data register
	rec_data_reg : process (iCLK, inRST) begin
		if (inRST = '0') then
			sRECV_DATA_REG <= (others => '0');
		elsif (iCLK'event and iCLK = '1') then
			if (sRECV_REG_EN = '1') then
				sRECV_DATA_REG <= sIUART_DATA;
			end if;
		end if;
	end process rec_data_reg;
	
	-- Send data
	sOUART_DATA <= sRECV_DATA_REG;
		
	-- LED output
	oLED_DATA   <= sRECV_DATA_REG;
	

end Behavioral;

