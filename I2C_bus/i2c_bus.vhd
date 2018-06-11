----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:17 05/20/2018 
-- Design Name: 
-- Module Name:    i2c_bus - Behavioral 
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
use work.i2c_bus_components.ALL;


entity i2c_bus is
	 Generic (
		DATA_WIDTH 			: integer := 8	 -- UART word widht 
	 );
    Port ( iCLK  		   : in 	  std_logic;
           inRST 		   : in 	  std_logic;
			  iUART_FULL   : in 	  std_logic; 
			  iUART_EMPTY  : in    std_logic;
			  iUART_DATA   : in 	  std_logic_vector(DATA_WIDTH - 1  downto 0);		
			  oUART_READ   : out   std_logic;
			  oUART_WRITE  : out   std_logic;
			  oUART_DATA   : out   std_logic_vector(DATA_WIDTH - 1  downto 0)
			  );
end i2c_bus;

architecture Behavioral of i2c_bus is

	signal sSCL 	 : std_logic; -- SCL bus line
	signal sSDA 	 : std_logic; -- SDA bus line

	signal sTC  	 : std_logic; -- Clock frequency divider terminal count 
	signal sFREQ_EN : std_logic; -- Clock frequency divider enable
	
	
begin

	-- I2C bus master 
	eUART_I2C_MASTER : uart_i2c_master 
			Port map(
				iCLK  		 => iCLK,
				inRST 		 => inRST,
				iTC 		    => sTC,
				iUART_FULL   => iUART_FULL,
				iUART_EMPTY  => iUART_EMPTY,
				iUART_DATA   => iUART_DATA,
				oFREQ_EN 	 => sFREQ_EN,		
				oUART_READ   => oUART_READ,
				oUART_WRITE  => oUART_WRITE,
				oUART_DATA   => oUART_DATA,
				oSCL		    => sSCL,
				ioSDA		    => sSDA	
			);
	
	--	I2C 16 bit slave	
	eI2C_SLAVE : i2c_slave
			Port map(
				iCLK 	=> iCLK,
				inRST => inRST,
				iTC   => sTC,
				iSCL 	=> sSCL,
				ioSDA => sSDA
			);
	
	-- Clock frequency divider
	eCLK_FREQ_DIV : i2c_clk_freq_div
			Port map(
				iCLK		=> iCLK,
				inRST 	=> inRST,
				iFREQ_EN => sFREQ_EN,
				oTC   	=>	sTC		
			);
	
end Behavioral;

