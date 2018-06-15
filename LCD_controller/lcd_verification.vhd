----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:43 06/14/2018 
-- Design Name: 
-- Module Name:    lcd_verification - Behavioral 
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

entity lcd_verification is
	 Generic(
		DATA_WIDTH      : integer := 8; -- Data widht
		LCD_DATA_WIDTH  : integer := 4  -- LCD interface
	 );
    Port ( iCLK  : in  	 std_logic;
           inRST : in  	 std_logic;
			  iSW   : in    std_logic;
			  iEN   : in    std_logic;
			  oLED  : out   std_logic_vector(DATA_WIDTH - 1 downto 0);
			  oE    : out 	 std_logic;
			  oRS   : out 	 std_logic;
			  oRW   : out 	 std_logic;
			  ioD	  : inout std_logic_vector(LCD_DATA_WIDTH - 1 downto 0));
end lcd_verification;

architecture Behavioral of lcd_verification is

	type   tSTATE is (IDLE, PRINT_DATA);
	signal sCURRENT_STATE, sNEXT_STATE : tSTATE;

	-- Message constants
	signal sSLAVE_ADDR : std_logic_vector(DATA_WIDTH - 1 downto 0) ;
	signal sSLAVE_REG  : std_logic_vector(DATA_WIDTH - 1 downto 0) ;
	signal sUPPER_BYTE : std_logic_vector(DATA_WIDTH - 1 downto 0) ;
	signal sLOWER_BYTE : std_logic_vector(DATA_WIDTH - 1 downto 0) ;
	signal sMODE 		 : std_logic ;

	signal sLCD_DATA_EN  : std_logic;

begin

	fsm_ff : process (iCLK,inRST) begin
		if (inRST = '0') then
			sCURRENT_STATE <= IDLE;
		elsif (iCLK'event and iCLK = '1') then
			sCURRENT_STATE <= sNEXT_STATE;
		end if;
	end process fsm_ff;
	
	fsm_next : process (sCURRENT_STATE, iEN) begin
		case (sCURRENT_STATE) is
			when IDLE =>
				if (iEN = '0') then
					sNEXT_STATE <= PRINT_DATA;
				else
					sNEXT_STATE <= IDLE;
				end if;	
			when PRINT_DATA =>
				sNEXT_STATE <= IDLE;
		end case;
	end process fsm_next;
	
	fsm_out : process (sCURRENT_STATE, iEN, iSW) begin				
		sLCD_DATA_EN <= '0';
		sSLAVE_ADDR  <= (others => '0');
		sSLAVE_REG   <= (others => '0');
		sUPPER_BYTE  <= (others => '0');
		sLOWER_BYTE  <= (others => '0');
		sMODE			 <= '0';
		case (sCURRENT_STATE) is
			when IDLE =>
				if (iEN = '0') then
					if (iSW = '0') then
						sLCD_DATA_EN <= '1';
						sSLAVE_ADDR  <= x"64";
						sSLAVE_REG   <= x"01";
						sUPPER_BYTE  <= x"62";
						sLOWER_BYTE  <= x"63";
						sMODE			 <= '0';		
					else
						sLCD_DATA_EN <= '1';
						sSLAVE_ADDR  <= not (x"64");
						sSLAVE_REG   <= not (x"01");
						sUPPER_BYTE  <= not (x"62");
						sLOWER_BYTE  <= not (x"63");
						sMODE			 <= not ('0');						
					end if;
				end if;			
			when PRINT_DATA =>
					
		end case;
	end process fsm_out;

	-- LCD driver	
	eLCD_DRIVER : entity work.lcd_driver 
			Port map(
			   iCLK   	  	=> iCLK,
            inRST  	  	=> inRST,
			   iSLAVE_ADDR => sSLAVE_ADDR,
			   iREG_ADDR   => sSLAVE_REG,
			   iLOWER_BYTE => sLOWER_BYTE,
			   iUPPER_BYTE => sUPPER_BYTE,
			   iMODE 		=> sMODE,  
			   iDATA_EN	   => sLCD_DATA_EN,
            oE 	   	=> oE,  
            oRS    	   => oRS,
            oRW   		=> oRW,  
				oLED			=> oLED,
            ioD 		  	=> ioD		
			);

end Behavioral;

