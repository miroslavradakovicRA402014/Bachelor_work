----------------------------------------------------------------------------------
-- Company: 		 RT-RK computer based systems
-- Engineer: 		 PhD Miroslav Radakovic
-- 
-- Create Date:    14:47:40 04/13/2018 
-- Design Name: 		
-- Module Name:    uart - Behavioral 
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
use work.uart_components.ALL;                     


entity uart is
	 Generic (
		BAUD_RATE_SEL : integer := 3;  -- Width of baud rate select
		DATA_BIT_SEL  : integer := 2;  -- Width of data bit number select
		DATA_WIDTH    : integer := 8	 -- Data widht 
	 );
    Port ( iCLK        		 : in   std_logic;
           inRST       		 : in   std_logic;
			  iPARITY_EN		 : in   std_logic;
			  iPARITY			 : in   std_logic;
			  iHANDSHAKE_EN    : in   std_logic;
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
end uart;

architecture Behavioral of uart is

	-- UART reciver signals
	signal sRECV_DATA    : std_logic_vector(DATA_WIDTH - 1 downto 0); -- Recived data
	signal sRX_DONE      : std_logic;											-- Recive process done indicator
	signal sRECV_FULL		: std_logic;											-- FIFO full indicatior
	signal sBAUD_EN		: std_logic;											-- Baud rate input enabled
			
	-- UART transmitter signals
	signal sSEND_DATA 	: std_logic_vector(DATA_WIDTH - 1 downto 0); -- Data for send
	signal sTX_DONE		: std_logic;											-- Send process done indicator
	signal sSEND_EMPTY	: std_logic;											-- FIFO empty inidator
	signal snSEND_EMPTY	: std_logic;											-- Negate empty signal
	
	-- Baud frequency divider	
	signal sTC 		   	: std_logic;								   		-- Baud frequency divider terminal count

begin
	
	-- Baud frequency divider
	eBAUD_FREQ_DIV : baud_freq_div 
		Port map(
			iCLK  	 => iCLK,
         inRST 	 => inRST,
			iBAUD_SEL => iBAUD_SEL,
			iBAUD_EN  => sBAUD_EN,
         oTC 		 => sTC
		);

	-- UART reciver
	eUART_RECIVER : reciver	
		Port map(
         iCLK 		  => iCLK,
         inRST 	  => inRST,
			iPARITY_EN => iPARITY_EN,
			iPARITY    => iPARITY,
			iDATA_SEL  => iDATA_SEL,
         iRX   	  => iRX,
         iTC   	  => sTC,
         iFULL 	  => sRECV_FULL,
			oBAUD_EN   => sBAUD_EN,
         oDATA 	  => sRECV_DATA,
         oRX_DONE   => sRX_DONE
		);
		
	-- Recive FIFO	
	eRECV_FIFO : fifo 	
		Port map(
			iCLK   	=> iCLK,
         inRST  	=> inRST,
         iDATA  	=> sRECV_DATA,
         iWR    	=> sRX_DONE,
         iRD    	=> iUART_RD,
         oFULL  	=> sRECV_FULL,
         oEMPTY 	=> oUART_EMPTY,
         oDATA  	=> oUART_DATA
		);
	
	-- UART transmitter 
	eUART_TRANSMITTER : transmitter 
		Port map(
			iCLK 	 	     => iCLK,
			inRST  	     => inRST,
			iPARITY_EN 	  => iPARITY_EN,
			iPARITY    	  => iPARITY,
			iHANDSHAKE_EN => iHANDSHAKE_EN,
			iDATA_SEL     => iDATA_SEL,
			iCTS		  	  => iCTS,
			iTC    	  	  => sTC,
		   iDATA  	     => sSEND_DATA, 
			iSTART 	     => snSEND_EMPTY,
			oTX_READY     => sTX_DONE,
			oRTS          => oRTS,
			oTX    	     => oTX		
		);
	
	-- Send FIFO	
	eSEND_FIFO : fifo 	
		Port map(
			iCLK   => iCLK,
         inRST  => inRST,
         iDATA  => iUART_DATA,
         iWR    => iUART_WR,
         iRD    => sTX_DONE,
         oFULL  => oUART_FULL,
         oEMPTY => sSEND_EMPTY,
         oDATA  => sSEND_DATA
		);		
	
	-- Negate empty FIFO signal
	snSEND_EMPTY <= not (sSEND_EMPTY);	

end Behavioral;

