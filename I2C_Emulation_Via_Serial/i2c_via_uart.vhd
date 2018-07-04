----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic
-- 
-- Create Date:    14:02:44 05/21/2018 
-- Design Name: 
-- Module Name:    i2c_via_uart - Behavioral 
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
use work.i2c_via_uart_components.ALL;


entity i2c_via_uart is
	 Generic (
		BAUD_RATE_SEL : integer := 3;  -- Width of baud rate select
		DATA_BIT_SEL  : integer := 2;  -- Width of data bit number select
		LCD_BUS_WIDTH : integer := 4;  -- Width of LCD interface
		DATA_WIDTH    : integer := 8	 -- Data widht 
	 );
	 Port ( iCLK        		 : in    std_logic;													-- External clock 24MHz
			  inRST       		 : in    std_logic;												 	-- Reset signal 
			  iPARITY_EN_SW	 : in    std_logic;													-- Parity mode signal from switch
			  iPARITY_SW		 : in    std_logic;													-- Parity enable signal from switch	
			  iHANDSHAKE_EN_SW : in    std_logic;													-- Handshake enable signal form swith
			  iDATA_BIT_SW		 : in    std_logic_vector(DATA_BIT_SEL  - 1 downto 0);	-- Data bit mode signal from switches
			  iBAUD_SW			 : in    std_logic_vector(BAUD_RATE_SEL - 1 downto 0);	-- Baud rate mode from switches
			  iCTS				 : in    std_logic;													-- Clear to send signal
			  iRX         		 : in    std_logic;													-- RX UART signal 														
           oLCD_E 	   	 : out   std_logic;													-- LCD display enable signal
           oLCD_RS    	  	 : out   std_logic;													-- LCD display register select signal
           oLCD_RW   		 : out   std_logic;													-- LCD display read-write operation signal
			  oTX         		 : out   std_logic;													-- TX UART signal
			  oRTS				 : out   std_logic;													-- Request to send signal
			  oLED				 : out   std_logic_vector(7 downto 0);							-- LED control
			  ioLCD_D 		  	 : inout std_logic_vector(LCD_BUS_WIDTH - 1 downto 0));	-- LCD display data signal
end i2c_via_uart;

architecture Behavioral of i2c_via_uart is

	-- DCM signals
	signal sCLK			 : std_logic;													-- Clock signal from DCM 50MHz
	signal snRST		 : std_logic;													-- Reset signal for all system
	signal sLOCKED		 : std_logic;													-- Locked signal from DCM
		
	-- I2C bus signals
	signal sSCL			 : std_logic;													-- Serial clock 
	signal sSDA			 : std_logic;													-- Serial data
		
	-- LCD control signal
	signal sLCD_E      : std_logic;													-- LCD enable signal 
	signal sLCD_RS		 : std_logic;													-- LCD RS signal
	signal sLCD_RW		 : std_logic;													-- LCD R/W signal
	signal sLCD_D 		 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0);	-- LCD data signal
	
begin

	oLED <= (others => '1');

	-- DCM 24 to 50MHz
	eDCM24_TO_50MHz : dcm24_to_50
		Port map( 
			CLK_IN1   => iCLK,
			CLK_OUT1  => sCLK,
			RESET     => not(inRST),
			LOCKED    => sLOCKED
		 );

	-- Uart I2C bridge
	eUART_I2C_BRIDGE : uart_i2c_bridge
		Port map( 
			iCLK        		=> sCLK,
			inRST       		=> inRST,
			iPARITY_EN_SW	 	=> iPARITY_EN_SW,
			iPARITY_SW			=> iPARITY_SW,
			iHANDSHAKE_EN_SW 	=> iHANDSHAKE_EN_SW,
			iDATA_BIT_SW		=> iDATA_BIT_SW,
			iBAUD_SW			 	=> iBAUD_SW,
			iCTS				 	=> iCTS,
			iRX         		=> iRX,												
         oLCD_E 	   		=> sLCD_E,
         oLCD_RS    	  	 	=> sLCD_RS,
         oLCD_RW   		 	=> sLCD_RW,
			oTX         		=> oTX,		
			oRTS				 	=> oRTS,
			oSCL		   	 	=> sSCL,
			ioSDA		   	 	=> sSDA,
			ioLCD_D 		  	 	=> sLCD_D
		);	

	--	I2C 16 bit slave	
	eI2C_SLAVE : i2c_slave
		Port map(
			iCLK 	=> iCLK,
			inRST => inRST,
			iSCL 	=> sSCL,
			ioSDA => sSDA
		);

		
	-- If clock is not stable hold reset state of system	
	snRST <= inRST when sLOCKED = '1' else
				'0';
			
	-- LCD control output
	oLCD_E  <= sLCD_E;
	oLCD_RS <= sLCD_RS;
	oLCD_RW <= sLCD_RW;
	ioLCD_D <= sLCD_D;
	

end Behavioral;

