----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 Miroslav Radakovic 
-- 
-- Create Date:    14:13:56 07/04/2018 
-- Design Name: 
-- Module Name:    uart_i2c_bridge - Behavioral 
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
use work.uart_i2c_bridge_components.ALL;


entity uart_i2c_bridge is
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
			  oSCL		   	 : out   std_logic;													-- SCL signal
			  ioSDA		   	 : inout std_logic;													-- SDA signal
			  ioLCD_D 		  	 : inout std_logic_vector(LCD_BUS_WIDTH - 1 downto 0));	-- LCD display data signal
end uart_i2c_bridge;

architecture Behavioral of uart_i2c_bridge is

	-- UART signals
	signal sUART_EMPTY : std_logic;													-- UART fifo empty
	signal sUART_FULL  : std_logic;													-- UART fifo full	
	signal sUART_READ  : std_logic;													-- UART write signal
	signal sUART_WRITE : std_logic;													-- UART read signal
	signal sIUART_DATA : std_logic_vector(DATA_WIDTH - 1 downto 0);		-- UART input data	
	signal sOUART_DATA : std_logic_vector(DATA_WIDTH - 1 downto 0);		-- UART output data
	
begin

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
		
	-- I2C bus master 
	eUART_I2C_MASTER : uart_i2c_master 
		Port map(
			iCLK  		 => iCLK,
			inRST 		 => inRST,
			iUART_FULL   => iUART_FULL,
			iUART_EMPTY  => iUART_EMPTY,
			iUART_DATA   => iUART_DATA,		
			oUART_READ   => sUART_READ,
			oUART_WRITE  => sUART_WRITE,
			oUART_DATA   => sUART_DATA,
			oSCL		    => oSCL,
			oLCD_E 	    => oLCD_E,
         oLCD_RS    	 => oLCD_RS,
         oLCD_RW      => oLCD_RW,					
			ioSDA		    => oSDA,
			ioLCD_D		 => ioLCD_D
		);	

		
end Behavioral;

