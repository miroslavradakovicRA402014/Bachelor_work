----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
		DATA_WIDTH    : integer := 8	 -- Data widht 
	 );
	 Port ( iCLK        		 : in   std_logic;
			  inRST       		 : in   std_logic;
			  iPARITY_EN_SW	 : in   std_logic;
			  iPARITY_SW		 : in   std_logic;
			  iHANDSHAKE_EN_SW : in   std_logic;
			  iDATA_BIT_SW		 : in   std_logic_vector(DATA_BIT_SEL  - 1 downto 0);
			  iBAUD_SW			 : in   std_logic_vector(BAUD_RATE_SEL - 1 downto 0);
			  iCTS				 : in   std_logic;
			  iRX         		 : in   std_logic;
			  oTX         		 : out  std_logic;
			  oRTS				 : out  std_logic);
end i2c_via_uart;

architecture Behavioral of i2c_via_uart is

	signal sUART_EMPTY : std_logic;													-- UART fifo empty
	signal sUART_FULL  : std_logic;													-- UART fifo full	
	signal sUART_READ  : std_logic;													-- UART write signal
	signal sUART_WRITE : std_logic;													-- UART read signal
	signal sIUART_DATA : std_logic_vector(DATA_WIDTH - 1 downto 0);		-- UART input data	
	signal sOUART_DATA : std_logic_vector(DATA_WIDTH - 1 downto 0);		-- UART output data
	
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
		
	-- I2C bus
	eI2C_BUS : i2c_bus
		Port map(
			iCLK  		 => iCLK,
         inRST 		 => inRST,
			iUART_FULL   => sUART_FULL, 
			iUART_EMPTY  => sUART_EMPTY,
			iUART_DATA   => sIUART_DATA,
			oUART_READ   => sUART_READ,
			oUART_WRITE  => sUART_WRITE,
			oUART_DATA   => sOUART_DATA
		);


end Behavioral;
