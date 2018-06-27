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
	
	-- UART signals
	signal sUART_EMPTY : std_logic;													-- UART fifo empty
	signal sUART_FULL  : std_logic;													-- UART fifo full	
	signal sUART_READ  : std_logic;													-- UART write signal
	signal sUART_WRITE : std_logic;													-- UART read signal
	signal sIUART_DATA : std_logic_vector(DATA_WIDTH - 1 downto 0);		-- UART input data	
	signal sOUART_DATA : std_logic_vector(DATA_WIDTH - 1 downto 0);		-- UART output data
	
	-- LCD control signal
	signal sLCD_E      : std_logic;													-- LCD enable signal 
	signal sLCD_RS		 : std_logic;													-- LCD RS signal
	signal sLCD_RW		 : std_logic;													-- LCD R/W signal
	signal sLCD_D 		 : std_logic_vector(LCD_BUS_WIDTH - 1 downto 0);	-- LCD data signal
	
begin

	-- DCM 24 to 50MHz
	eDCM24_TO_50MHz : dcm24_to_50
		Port map( 
			CLK_IN1   => iCLK,
			CLK_OUT1  => sCLK,
			RESET     => not(inRST),
			LOCKED    => sLOCKED
		 );

	-- UART
	eUART : uart 
		Port map(
			iCLK        		 => sCLK,
			inRST       		 => snRST,
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
		
	-- I2C bus
	eI2C_BUS : i2c_bus
		Port map(
			iCLK  		 => sCLK,
         inRST 		 => snRST,
			iUART_FULL   => sUART_FULL, 
			iUART_EMPTY  => sUART_EMPTY,
			iUART_DATA   => sIUART_DATA,
			oUART_READ   => sUART_READ,
			oUART_WRITE  => sUART_WRITE,
			oUART_DATA   => sOUART_DATA,
			oLCD_E 	 	 => sLCD_E,   
         oLCD_RS    	 => sLCD_RS,
         oLCD_RW      => sLCD_RW,
			ioLCD_D 		 => sLCD_D
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

