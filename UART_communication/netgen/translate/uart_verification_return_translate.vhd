--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.68d
--  \   \         Application: netgen
--  /   /         Filename: uart_verification_return_translate.vhd
-- /___/   /\     Timestamp: Mon Apr 23 13:59:47 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm uart_verification_return -w -dir netgen/translate -ofmt vhdl -sim uart_verification_return.ngd uart_verification_return_translate.vhd 
-- Device	: 6slx45fgg676-2
-- Input file	: uart_verification_return.ngd
-- Output file	: D:\BSc_workspace\Bachelor_work\UART_communication\netgen\translate\uart_verification_return_translate.vhd
-- # of Entities	: 1
-- Design Name	: uart_verification_return
-- Xilinx	: C:\Xilinx\14.6\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity uart_verification_return is
  port (
    iCLK : in STD_LOGIC := 'X'; 
    inRST : in STD_LOGIC := 'X'; 
    iRX : in STD_LOGIC := 'X'; 
    oTX : out STD_LOGIC; 
    oLED_DATA : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end uart_verification_return;

architecture Structure of uart_verification_return is
  signal iCLK_BUFGP : STD_LOGIC; 
  signal inRST_IBUF_4 : STD_LOGIC; 
  signal iRX_IBUF_5 : STD_LOGIC; 
  signal oTX_OBUF_14 : STD_LOGIC; 
  signal sCURRENT_STATE_FSM_FFd1_15 : STD_LOGIC; 
  signal sCURRENT_STATE_FSM_FFd2_16 : STD_LOGIC; 
  signal eUART_sTX_DONE : STD_LOGIC; 
  signal eUART_sRX_DONE : STD_LOGIC; 
  signal eUART_sTC_inv : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_0_Q_53 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT1 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_1_Q_56 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT2 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT3 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_3_Q_61 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT4 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_4_Q_64 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT5 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT6 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT7 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_7_Q_71 : STD_LOGIC; 
  signal sCURRENT_STATE_FSM_FFd2_In : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0181_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0267_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0261_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0255_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0249_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0243_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0237_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0231_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0225_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0219_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0213_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0207_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0201_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0195_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0189_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0183_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_n0271_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_inRST_inv : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_0_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_1_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_2_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_3_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_0_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_1_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_2_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_3_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_4_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_5_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_6_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_7_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_0_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_1_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_2_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_3_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_4_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_5_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_6_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_7_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_0_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_1_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_2_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_3_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_4_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_5_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_6_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_7_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_0_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_1_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_2_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_3_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_4_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_5_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_6_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_7_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_0_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_1_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_2_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_3_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_4_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_5_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_6_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_7_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_0_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_1_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_2_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_3_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_4_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_5_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_6_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_7_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_0_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_1_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_2_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_3_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_4_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_5_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_6_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_7_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_0_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_1_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_2_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_3_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_4_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_5_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_6_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_7_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_0_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_1_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_2_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_3_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_4_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_5_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_6_Q : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0181_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0267_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0261_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0255_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0249_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0243_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0237_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0231_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0225_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0219_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0213_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0207_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0201_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0195_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0189_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0183_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_n0271_inv : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_7_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_0_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_1_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_2_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_3_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_4_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_5_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_6_Q : STD_LOGIC; 
  signal eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_7_Q : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_13 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mcount_sDATA_CNT2 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mcount_sDATA_CNT1 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mcount_sDATA_CNT : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_582 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_In : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_In : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_In : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In1 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_608 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_In : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_In : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In_611 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_n0080_inv : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_0_Q : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_1_Q : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_2_Q : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_3_Q : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_4_Q : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_5_Q : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_6_Q : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_7_Q : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal N31 : STD_LOGIC; 
  signal N34 : STD_LOGIC; 
  signal N37 : STD_LOGIC; 
  signal N40 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_0_7_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_0_6_rstpot_675 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_0_5_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_0_4_rstpot_677 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_0_3_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_0_2_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_0_1_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_0_0_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_1_7_rstpot_682 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_1_6_rstpot_683 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_1_5_rstpot_684 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_1_4_rstpot_685 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_1_3_rstpot_686 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_1_2_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_1_1_rstpot_688 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_1_0_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_2_7_rstpot_690 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_2_6_rstpot_691 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_2_5_rstpot_692 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_2_4_rstpot_693 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_2_3_rstpot_694 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_2_2_rstpot_695 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_2_1_rstpot_696 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_2_0_rstpot_697 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_3_7_rstpot_698 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_3_6_rstpot_699 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_3_5_rstpot_700 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_3_4_rstpot_701 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_3_3_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_3_2_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_3_1_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_3_0_rstpot : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_4_7_rstpot_706 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_4_6_rstpot_707 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_4_5_rstpot_708 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_4_4_rstpot_709 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_4_3_rstpot_710 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_4_2_rstpot_711 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_4_1_rstpot_712 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_4_0_rstpot_713 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_5_7_rstpot_714 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_5_6_rstpot_715 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_5_5_rstpot_716 : STD_LOGIC; 
  signal eUART_eRECV_FIFO_sFIFO_5_4_rstpot_717 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N43 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N48 : STD_LOGIC; 
  signal N49 : STD_LOGIC; 
  signal N51 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal N55 : STD_LOGIC; 
  signal N60 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N75 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N78 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N82 : STD_LOGIC; 
  signal N84 : STD_LOGIC; 
  signal N85 : STD_LOGIC; 
  signal N87 : STD_LOGIC; 
  signal N88 : STD_LOGIC; 
  signal N90 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal N93 : STD_LOGIC; 
  signal N94 : STD_LOGIC; 
  signal N96 : STD_LOGIC; 
  signal N97 : STD_LOGIC; 
  signal N99 : STD_LOGIC; 
  signal N100 : STD_LOGIC; 
  signal N114 : STD_LOGIC; 
  signal N115 : STD_LOGIC; 
  signal N117 : STD_LOGIC; 
  signal N118 : STD_LOGIC; 
  signal N120 : STD_LOGIC; 
  signal N121 : STD_LOGIC; 
  signal N123 : STD_LOGIC; 
  signal N124 : STD_LOGIC; 
  signal N126 : STD_LOGIC; 
  signal N127 : STD_LOGIC; 
  signal N129 : STD_LOGIC; 
  signal N130 : STD_LOGIC; 
  signal N132 : STD_LOGIC; 
  signal N133 : STD_LOGIC; 
  signal N135 : STD_LOGIC; 
  signal N136 : STD_LOGIC; 
  signal N138 : STD_LOGIC; 
  signal N139 : STD_LOGIC; 
  signal N141 : STD_LOGIC; 
  signal N142 : STD_LOGIC; 
  signal N144 : STD_LOGIC; 
  signal N145 : STD_LOGIC; 
  signal N147 : STD_LOGIC; 
  signal N148 : STD_LOGIC; 
  signal N153 : STD_LOGIC; 
  signal N154 : STD_LOGIC; 
  signal N159 : STD_LOGIC; 
  signal N160 : STD_LOGIC; 
  signal N180 : STD_LOGIC; 
  signal N182 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sTC_CNT_3_rstpot_784 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sTC_CNT_2_rstpot_785 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sTC_CNT_1_rstpot_786 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sTC_CNT_0_rstpot_787 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sDATA_CNT_2_rstpot_788 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sDATA_CNT_1_rstpot_789 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sTC_CNT_3_rstpot_790 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sTC_CNT_2_rstpot_791 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sTC_CNT_1_rstpot_792 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sTC_CNT_0_rstpot_793 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sDATA_CNT_3_rstpot_794 : STD_LOGIC; 
  signal eUART_eUART_TRANSMITTER_sDATA_CNT_0_rstpot_795 : STD_LOGIC; 
  signal N186 : STD_LOGIC; 
  signal N188 : STD_LOGIC; 
  signal N202 : STD_LOGIC; 
  signal N204 : STD_LOGIC; 
  signal N207 : STD_LOGIC; 
  signal N212 : STD_LOGIC; 
  signal N214 : STD_LOGIC; 
  signal N216 : STD_LOGIC; 
  signal N217 : STD_LOGIC; 
  signal N222 : STD_LOGIC; 
  signal N224 : STD_LOGIC; 
  signal N226 : STD_LOGIC; 
  signal N228 : STD_LOGIC; 
  signal N231 : STD_LOGIC; 
  signal N233 : STD_LOGIC; 
  signal N235 : STD_LOGIC; 
  signal N237 : STD_LOGIC; 
  signal N239 : STD_LOGIC; 
  signal N241 : STD_LOGIC; 
  signal N243 : STD_LOGIC; 
  signal N245 : STD_LOGIC; 
  signal N247 : STD_LOGIC; 
  signal N249 : STD_LOGIC; 
  signal N251 : STD_LOGIC; 
  signal N253 : STD_LOGIC; 
  signal N254 : STD_LOGIC; 
  signal N256 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_2_rt_823 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_5_rt_824 : STD_LOGIC; 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_6_rt_825 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_n0074_inv1_rstpot_828 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_n0074_inv1_cepot_829 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sDATA_CNT_0_dpot_830 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sDATA_CNT_1_dpot_831 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sDATA_CNT_2_dpot_832 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sTC_CNT_0_1_833 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sTC_CNT_1_1_834 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sTC_CNT_2_1_835 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sTC_CNT_3_1_836 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_1_842 : STD_LOGIC; 
  signal eUART_eUART_RECIVER_sTC_CNT_3_2_843 : STD_LOGIC; 
  signal N258 : STD_LOGIC; 
  signal N259 : STD_LOGIC; 
  signal iCLK_BUFGP_IBUFG_2 : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal sIUART_DATA : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal sRECV_DATA_REG : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_sRECV_DATA : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_sSEND_DATA : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eBAUD_FREQ_DIV_sCLK_CNT : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal eUART_eRECV_FIFO_Result : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal eUART_eRECV_FIFO_sWR_PTR : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_0 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_1 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_2 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_3 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_4 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_5 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_6 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_7 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_8 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_9 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_10 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_11 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_12 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_13 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_14 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eRECV_FIFO_sFIFO_15 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_Result : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal eUART_eSEND_FIFO_sWR_PTR : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_0 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_1 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_2 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_3 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_4 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_5 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_6 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_7 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_8 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_9 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_10 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_11 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_12 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_13 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_14 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eSEND_FIFO_sFIFO_15 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eUART_RECIVER_sSHW_REG : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal eUART_eUART_RECIVER_sDATA_CNT : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal eUART_eUART_RECIVER_sTC_CNT : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal eUART_eUART_TRANSMITTER_sSHW_REG : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal eUART_eUART_TRANSMITTER_sDATA_CNT : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal eUART_eUART_TRANSMITTER_sTC_CNT : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal eUART_eUART_TRANSMITTER_sPARITY_REG : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  XST_GND : X_ZERO
    port map (
      O => eUART_eUART_RECIVER_sDATA_CNT(3)
    );
  sRECV_DATA_REG_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => sCURRENT_STATE_FSM_FFd2_16,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sIUART_DATA(0),
      O => sRECV_DATA_REG(0),
      SET => GND
    );
  sRECV_DATA_REG_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => sCURRENT_STATE_FSM_FFd2_16,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sIUART_DATA(1),
      O => sRECV_DATA_REG(1),
      SET => GND
    );
  sRECV_DATA_REG_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => sCURRENT_STATE_FSM_FFd2_16,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sIUART_DATA(2),
      O => sRECV_DATA_REG(2),
      SET => GND
    );
  sRECV_DATA_REG_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => sCURRENT_STATE_FSM_FFd2_16,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sIUART_DATA(3),
      O => sRECV_DATA_REG(3),
      SET => GND
    );
  sRECV_DATA_REG_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => sCURRENT_STATE_FSM_FFd2_16,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sIUART_DATA(4),
      O => sRECV_DATA_REG(4),
      SET => GND
    );
  sRECV_DATA_REG_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => sCURRENT_STATE_FSM_FFd2_16,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sIUART_DATA(5),
      O => sRECV_DATA_REG(5),
      SET => GND
    );
  sRECV_DATA_REG_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => sCURRENT_STATE_FSM_FFd2_16,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sIUART_DATA(6),
      O => sRECV_DATA_REG(6),
      SET => GND
    );
  sRECV_DATA_REG_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => sCURRENT_STATE_FSM_FFd2_16,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sIUART_DATA(7),
      O => sRECV_DATA_REG(7),
      SET => GND
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_0_Q : X_MUX2
    port map (
      IB => eUART_sTC_inv,
      IA => eUART_eUART_RECIVER_sDATA_CNT(3),
      SEL => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_0_Q_53,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(0)
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_xor_0_Q : X_XOR2
    port map (
      I0 => eUART_sTC_inv,
      I1 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_0_Q_53,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_1_Q : X_MUX2
    port map (
      IB => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(0),
      IA => eUART_eUART_RECIVER_sDATA_CNT(3),
      SEL => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_1_Q_56,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(1)
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_xor_1_Q : X_XOR2
    port map (
      I0 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(0),
      I1 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_1_Q_56,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT1
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_2_Q : X_MUX2
    port map (
      IB => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(1),
      IA => eUART_eUART_RECIVER_sDATA_CNT(3),
      SEL => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_2_rt_823,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(2)
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_xor_2_Q : X_XOR2
    port map (
      I0 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(1),
      I1 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_2_rt_823,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT2
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_3_Q : X_MUX2
    port map (
      IB => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(2),
      IA => eUART_eUART_RECIVER_sDATA_CNT(3),
      SEL => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_3_Q_61,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(3)
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_xor_3_Q : X_XOR2
    port map (
      I0 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(2),
      I1 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_3_Q_61,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT3
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_4_Q : X_MUX2
    port map (
      IB => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(3),
      IA => eUART_eUART_RECIVER_sDATA_CNT(3),
      SEL => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_4_Q_64,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(4)
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_xor_4_Q : X_XOR2
    port map (
      I0 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(3),
      I1 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_4_Q_64,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT4
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_5_Q : X_MUX2
    port map (
      IB => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(4),
      IA => eUART_eUART_RECIVER_sDATA_CNT(3),
      SEL => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_5_rt_824,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(5)
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_xor_5_Q : X_XOR2
    port map (
      I0 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(4),
      I1 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_5_rt_824,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT5
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_6_Q : X_MUX2
    port map (
      IB => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(5),
      IA => eUART_eUART_RECIVER_sDATA_CNT(3),
      SEL => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_6_rt_825,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(6)
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_xor_6_Q : X_XOR2
    port map (
      I0 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(5),
      I1 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_6_rt_825,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT6
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_xor_7_Q : X_XOR2
    port map (
      I0 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy(6),
      I1 => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_7_Q_71,
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT7
    );
  eUART_eBAUD_FREQ_DIV_sCLK_CNT_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT,
      O => eUART_eBAUD_FREQ_DIV_sCLK_CNT(0),
      CE => VCC,
      SET => GND
    );
  eUART_eBAUD_FREQ_DIV_sCLK_CNT_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT1,
      O => eUART_eBAUD_FREQ_DIV_sCLK_CNT(1),
      CE => VCC,
      SET => GND
    );
  eUART_eBAUD_FREQ_DIV_sCLK_CNT_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT2,
      O => eUART_eBAUD_FREQ_DIV_sCLK_CNT(2),
      CE => VCC,
      SET => GND
    );
  eUART_eBAUD_FREQ_DIV_sCLK_CNT_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT3,
      O => eUART_eBAUD_FREQ_DIV_sCLK_CNT(3),
      CE => VCC,
      SET => GND
    );
  eUART_eBAUD_FREQ_DIV_sCLK_CNT_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT4,
      O => eUART_eBAUD_FREQ_DIV_sCLK_CNT(4),
      CE => VCC,
      SET => GND
    );
  eUART_eBAUD_FREQ_DIV_sCLK_CNT_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT5,
      O => eUART_eBAUD_FREQ_DIV_sCLK_CNT(5),
      CE => VCC,
      SET => GND
    );
  eUART_eBAUD_FREQ_DIV_sCLK_CNT_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT6,
      O => eUART_eBAUD_FREQ_DIV_sCLK_CNT(6),
      CE => VCC,
      SET => GND
    );
  eUART_eBAUD_FREQ_DIV_sCLK_CNT_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT7,
      O => eUART_eBAUD_FREQ_DIV_sCLK_CNT(7),
      CE => VCC,
      SET => GND
    );
  sCURRENT_STATE_FSM_FFd2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sCURRENT_STATE_FSM_FFd2_In,
      O => sCURRENT_STATE_FSM_FFd2_16,
      CE => VCC,
      SET => GND
    );
  sCURRENT_STATE_FSM_FFd1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sCURRENT_STATE_FSM_FFd2_16,
      O => sCURRENT_STATE_FSM_FFd1_15,
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sWR_PTR_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0181_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_Result(3),
      O => eUART_eRECV_FIFO_sWR_PTR(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sWR_PTR_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0181_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_Result(2),
      O => eUART_eRECV_FIFO_sWR_PTR(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sWR_PTR_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0181_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_Result(1),
      O => eUART_eRECV_FIFO_sWR_PTR(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sWR_PTR_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0181_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_Result(0),
      O => eUART_eRECV_FIFO_sWR_PTR(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_5_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_3_Q,
      O => eUART_eRECV_FIFO_sFIFO_5(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_5_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_2_Q,
      O => eUART_eRECV_FIFO_sFIFO_5(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_5_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_1_Q,
      O => eUART_eRECV_FIFO_sFIFO_5(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_5_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_0_Q,
      O => eUART_eRECV_FIFO_sFIFO_5(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_6_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_7_Q,
      O => eUART_eRECV_FIFO_sFIFO_6(7),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_6_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_6_Q,
      O => eUART_eRECV_FIFO_sFIFO_6(6),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_6_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_5_Q,
      O => eUART_eRECV_FIFO_sFIFO_6(5),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_6_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_4_Q,
      O => eUART_eRECV_FIFO_sFIFO_6(4),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_6_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_3_Q,
      O => eUART_eRECV_FIFO_sFIFO_6(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_6_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_2_Q,
      O => eUART_eRECV_FIFO_sFIFO_6(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_6_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_1_Q,
      O => eUART_eRECV_FIFO_sFIFO_6(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_6_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_0_Q,
      O => eUART_eRECV_FIFO_sFIFO_6(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_7_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_7_Q,
      O => eUART_eRECV_FIFO_sFIFO_7(7),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_7_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_6_Q,
      O => eUART_eRECV_FIFO_sFIFO_7(6),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_7_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_5_Q,
      O => eUART_eRECV_FIFO_sFIFO_7(5),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_7_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_4_Q,
      O => eUART_eRECV_FIFO_sFIFO_7(4),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_7_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_3_Q,
      O => eUART_eRECV_FIFO_sFIFO_7(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_7_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_2_Q,
      O => eUART_eRECV_FIFO_sFIFO_7(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_7_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_1_Q,
      O => eUART_eRECV_FIFO_sFIFO_7(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_7_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_0_Q,
      O => eUART_eRECV_FIFO_sFIFO_7(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_8_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_7_Q,
      O => eUART_eRECV_FIFO_sFIFO_8(7),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_8_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_6_Q,
      O => eUART_eRECV_FIFO_sFIFO_8(6),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_8_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_5_Q,
      O => eUART_eRECV_FIFO_sFIFO_8(5),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_8_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_4_Q,
      O => eUART_eRECV_FIFO_sFIFO_8(4),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_8_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_3_Q,
      O => eUART_eRECV_FIFO_sFIFO_8(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_8_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_2_Q,
      O => eUART_eRECV_FIFO_sFIFO_8(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_8_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_1_Q,
      O => eUART_eRECV_FIFO_sFIFO_8(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_8_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_0_Q,
      O => eUART_eRECV_FIFO_sFIFO_8(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_9_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_7_Q,
      O => eUART_eRECV_FIFO_sFIFO_9(7),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_9_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_6_Q,
      O => eUART_eRECV_FIFO_sFIFO_9(6),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_9_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_5_Q,
      O => eUART_eRECV_FIFO_sFIFO_9(5),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_9_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_4_Q,
      O => eUART_eRECV_FIFO_sFIFO_9(4),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_9_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_3_Q,
      O => eUART_eRECV_FIFO_sFIFO_9(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_9_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_2_Q,
      O => eUART_eRECV_FIFO_sFIFO_9(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_9_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_1_Q,
      O => eUART_eRECV_FIFO_sFIFO_9(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_9_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_0_Q,
      O => eUART_eRECV_FIFO_sFIFO_9(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_10_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_7_Q,
      O => eUART_eRECV_FIFO_sFIFO_10(7),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_10_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_6_Q,
      O => eUART_eRECV_FIFO_sFIFO_10(6),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_10_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_5_Q,
      O => eUART_eRECV_FIFO_sFIFO_10(5),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_10_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_4_Q,
      O => eUART_eRECV_FIFO_sFIFO_10(4),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_10_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_3_Q,
      O => eUART_eRECV_FIFO_sFIFO_10(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_10_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_2_Q,
      O => eUART_eRECV_FIFO_sFIFO_10(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_10_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_1_Q,
      O => eUART_eRECV_FIFO_sFIFO_10(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_10_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_0_Q,
      O => eUART_eRECV_FIFO_sFIFO_10(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_11_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_7_Q,
      O => eUART_eRECV_FIFO_sFIFO_11(7),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_11_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_6_Q,
      O => eUART_eRECV_FIFO_sFIFO_11(6),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_11_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_5_Q,
      O => eUART_eRECV_FIFO_sFIFO_11(5),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_11_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_4_Q,
      O => eUART_eRECV_FIFO_sFIFO_11(4),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_11_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_3_Q,
      O => eUART_eRECV_FIFO_sFIFO_11(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_11_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_2_Q,
      O => eUART_eRECV_FIFO_sFIFO_11(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_11_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_1_Q,
      O => eUART_eRECV_FIFO_sFIFO_11(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_11_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_0_Q,
      O => eUART_eRECV_FIFO_sFIFO_11(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_12_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_7_Q,
      O => eUART_eRECV_FIFO_sFIFO_12(7),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_12_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_6_Q,
      O => eUART_eRECV_FIFO_sFIFO_12(6),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_12_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_5_Q,
      O => eUART_eRECV_FIFO_sFIFO_12(5),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_12_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_4_Q,
      O => eUART_eRECV_FIFO_sFIFO_12(4),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_12_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_3_Q,
      O => eUART_eRECV_FIFO_sFIFO_12(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_12_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_2_Q,
      O => eUART_eRECV_FIFO_sFIFO_12(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_12_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_1_Q,
      O => eUART_eRECV_FIFO_sFIFO_12(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_12_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_0_Q,
      O => eUART_eRECV_FIFO_sFIFO_12(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_13_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_7_Q,
      O => eUART_eRECV_FIFO_sFIFO_13(7),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_13_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_6_Q,
      O => eUART_eRECV_FIFO_sFIFO_13(6),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_13_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_5_Q,
      O => eUART_eRECV_FIFO_sFIFO_13(5),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_13_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_4_Q,
      O => eUART_eRECV_FIFO_sFIFO_13(4),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_13_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_3_Q,
      O => eUART_eRECV_FIFO_sFIFO_13(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_13_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_2_Q,
      O => eUART_eRECV_FIFO_sFIFO_13(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_13_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_1_Q,
      O => eUART_eRECV_FIFO_sFIFO_13(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_13_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_0_Q,
      O => eUART_eRECV_FIFO_sFIFO_13(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_14_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_7_Q,
      O => eUART_eRECV_FIFO_sFIFO_14(7),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_14_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_6_Q,
      O => eUART_eRECV_FIFO_sFIFO_14(6),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_14_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_5_Q,
      O => eUART_eRECV_FIFO_sFIFO_14(5),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_14_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_4_Q,
      O => eUART_eRECV_FIFO_sFIFO_14(4),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_14_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_3_Q,
      O => eUART_eRECV_FIFO_sFIFO_14(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_14_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_2_Q,
      O => eUART_eRECV_FIFO_sFIFO_14(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_14_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_1_Q,
      O => eUART_eRECV_FIFO_sFIFO_14(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_14_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_0_Q,
      O => eUART_eRECV_FIFO_sFIFO_14(0),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_15_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sRECV_DATA(7),
      O => eUART_eRECV_FIFO_sFIFO_15(7),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_15_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sRECV_DATA(6),
      O => eUART_eRECV_FIFO_sFIFO_15(6),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_15_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sRECV_DATA(5),
      O => eUART_eRECV_FIFO_sFIFO_15(5),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_15_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sRECV_DATA(4),
      O => eUART_eRECV_FIFO_sFIFO_15(4),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_15_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sRECV_DATA(3),
      O => eUART_eRECV_FIFO_sFIFO_15(3),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_15_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sRECV_DATA(2),
      O => eUART_eRECV_FIFO_sFIFO_15(2),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_15_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sRECV_DATA(1),
      O => eUART_eRECV_FIFO_sFIFO_15(1),
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_15_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eRECV_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sRECV_DATA(0),
      O => eUART_eRECV_FIFO_sFIFO_15(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sWR_PTR_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0181_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_Result(3),
      O => eUART_eSEND_FIFO_sWR_PTR(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sWR_PTR_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0181_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_Result(2),
      O => eUART_eSEND_FIFO_sWR_PTR(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sWR_PTR_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0181_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_Result(1),
      O => eUART_eSEND_FIFO_sWR_PTR(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sWR_PTR_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0181_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_Result(0),
      O => eUART_eSEND_FIFO_sWR_PTR(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_0_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0267_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_0(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_0_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0267_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_0(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_0_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0267_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_0(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_0_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0267_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_0(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_0_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0267_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_0(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_0_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0267_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_0(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_0_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0267_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_0(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_0_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0267_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_0(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_1_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0261_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_1(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_1_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0261_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_1(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_1_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0261_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_1(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_1_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0261_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_1(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_1_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0261_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_1(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_1_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0261_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_1(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_1_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0261_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_1(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_1_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0261_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_1(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_2_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0255_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_2(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_2_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0255_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_2(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_2_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0255_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_2(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_2_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0255_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_2(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_2_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0255_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_2(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_2_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0255_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_2(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_2_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0255_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_2(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_2_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0255_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_2(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_3_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0249_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_3(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_3_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0249_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_3(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_3_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0249_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_3(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_3_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0249_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_3(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_3_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0249_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_3(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_3_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0249_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_3(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_3_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0249_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_3(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_3_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0249_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_3(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_4_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0243_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_4(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_4_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0243_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_4(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_4_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0243_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_4(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_4_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0243_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_4(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_4_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0243_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_4(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_4_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0243_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_4(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_4_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0243_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_4(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_4_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0243_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_4(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_5_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_5(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_5_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_5(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_5_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_5(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_5_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_5(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_5_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_5(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_5_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_5(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_5_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_5(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_5_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0237_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_5(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_6_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_6(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_6_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_6(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_6_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_6(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_6_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_6(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_6_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_6(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_6_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_6(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_6_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_6(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_6_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0231_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_6(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_7_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_7(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_7_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_7(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_7_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_7(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_7_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_7(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_7_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_7(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_7_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_7(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_7_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_7(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_7_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0225_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_7(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_8_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_8(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_8_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_8(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_8_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_8(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_8_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_8(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_8_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_8(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_8_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_8(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_8_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_8(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_8_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0219_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_8(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_9_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_9(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_9_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_9(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_9_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_9(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_9_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_9(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_9_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_9(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_9_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_9(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_9_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_9(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_9_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0213_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_9(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_10_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_10(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_10_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_10(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_10_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_10(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_10_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_10(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_10_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_10(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_10_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_10(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_10_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_10(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_10_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0207_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_10(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_11_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_11(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_11_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_11(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_11_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_11(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_11_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_11(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_11_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_11(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_11_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_11(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_11_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_11(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_11_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0201_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_11(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_12_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_12(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_12_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_12(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_12_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_12(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_12_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_12(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_12_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_12(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_12_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_12(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_12_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_12(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_12_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0195_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_12(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_13_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_13(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_13_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_13(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_13_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_13(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_13_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_13(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_13_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_13(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_13_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_13(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_13_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_13(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_13_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0189_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_13(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_14_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_7_Q,
      O => eUART_eSEND_FIFO_sFIFO_14(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_14_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_6_Q,
      O => eUART_eSEND_FIFO_sFIFO_14(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_14_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_5_Q,
      O => eUART_eSEND_FIFO_sFIFO_14(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_14_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_4_Q,
      O => eUART_eSEND_FIFO_sFIFO_14(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_14_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_3_Q,
      O => eUART_eSEND_FIFO_sFIFO_14(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_14_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_2_Q,
      O => eUART_eSEND_FIFO_sFIFO_14(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_14_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_1_Q,
      O => eUART_eSEND_FIFO_sFIFO_14(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_14_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0183_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_0_Q,
      O => eUART_eSEND_FIFO_sFIFO_14(0),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_15_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_15(7),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_15_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_15(6),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_15_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_15(5),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_15_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_15(4),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_15_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_15(3),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_15_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_15(2),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_15_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_15(1),
      SET => GND
    );
  eUART_eSEND_FIFO_sFIFO_15_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eSEND_FIFO_n0271_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_15(0),
      SET => GND
    );
  eUART_eUART_RECIVER_sDATA_CNT_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_n0074_inv1_cepot_829,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sDATA_CNT_2_dpot_832,
      O => eUART_eUART_RECIVER_sDATA_CNT(2),
      SET => GND
    );
  eUART_eUART_RECIVER_sDATA_CNT_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_n0074_inv1_cepot_829,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sDATA_CNT_1_dpot_831,
      O => eUART_eUART_RECIVER_sDATA_CNT(1),
      SET => GND
    );
  eUART_eUART_RECIVER_sDATA_CNT_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_n0074_inv1_cepot_829,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sDATA_CNT_0_dpot_830,
      O => eUART_eUART_RECIVER_sDATA_CNT(0),
      SET => GND
    );
  eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_In,
      O => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_In,
      O => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_In,
      O => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_582,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sSHW_REG_8 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => iRX_IBUF_5,
      O => eUART_eUART_RECIVER_sSHW_REG(8),
      SET => GND
    );
  eUART_eUART_RECIVER_sSHW_REG_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sSHW_REG(8),
      O => eUART_eUART_RECIVER_sSHW_REG(7),
      SET => GND
    );
  eUART_eUART_RECIVER_sSHW_REG_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sSHW_REG(7),
      O => eUART_eUART_RECIVER_sSHW_REG(6),
      SET => GND
    );
  eUART_eUART_RECIVER_sSHW_REG_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sSHW_REG(6),
      O => eUART_eUART_RECIVER_sSHW_REG(5),
      SET => GND
    );
  eUART_eUART_RECIVER_sSHW_REG_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sSHW_REG(5),
      O => eUART_eUART_RECIVER_sSHW_REG(4),
      SET => GND
    );
  eUART_eUART_RECIVER_sSHW_REG_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sSHW_REG(4),
      O => eUART_eUART_RECIVER_sSHW_REG(3),
      SET => GND
    );
  eUART_eUART_RECIVER_sSHW_REG_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sSHW_REG(3),
      O => eUART_eUART_RECIVER_sSHW_REG(2),
      SET => GND
    );
  eUART_eUART_RECIVER_sSHW_REG_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sSHW_REG(2),
      O => eUART_eUART_RECIVER_sSHW_REG(1),
      SET => GND
    );
  eUART_eUART_RECIVER_sSHW_REG_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sSHW_REG(1),
      O => eUART_eUART_RECIVER_sSHW_REG(0),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_In,
      O => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_608,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_In,
      O => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In_611,
      O => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sPARITY_REG_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_sTX_DONE,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sSEND_DATA(7),
      O => eUART_eUART_TRANSMITTER_sPARITY_REG(7),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sPARITY_REG_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_sTX_DONE,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sSEND_DATA(6),
      O => eUART_eUART_TRANSMITTER_sPARITY_REG(6),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sPARITY_REG_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_sTX_DONE,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sSEND_DATA(5),
      O => eUART_eUART_TRANSMITTER_sPARITY_REG(5),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sPARITY_REG_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_sTX_DONE,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sSEND_DATA(4),
      O => eUART_eUART_TRANSMITTER_sPARITY_REG(4),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sPARITY_REG_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_sTX_DONE,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sSEND_DATA(3),
      O => eUART_eUART_TRANSMITTER_sPARITY_REG(3),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sPARITY_REG_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_sTX_DONE,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sSEND_DATA(2),
      O => eUART_eUART_TRANSMITTER_sPARITY_REG(2),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sPARITY_REG_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_sTX_DONE,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sSEND_DATA(1),
      O => eUART_eUART_TRANSMITTER_sPARITY_REG(1),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sPARITY_REG_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_sTX_DONE,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_sSEND_DATA(0),
      O => eUART_eUART_TRANSMITTER_sPARITY_REG(0),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sSHW_REG_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_TRANSMITTER_n0080_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_7_Q,
      O => eUART_eUART_TRANSMITTER_sSHW_REG(7),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sSHW_REG_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_TRANSMITTER_n0080_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_6_Q,
      O => eUART_eUART_TRANSMITTER_sSHW_REG(6),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sSHW_REG_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_TRANSMITTER_n0080_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_5_Q,
      O => eUART_eUART_TRANSMITTER_sSHW_REG(5),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sSHW_REG_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_TRANSMITTER_n0080_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_4_Q,
      O => eUART_eUART_TRANSMITTER_sSHW_REG(4),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sSHW_REG_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_TRANSMITTER_n0080_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_3_Q,
      O => eUART_eUART_TRANSMITTER_sSHW_REG(3),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sSHW_REG_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_TRANSMITTER_n0080_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_2_Q,
      O => eUART_eUART_TRANSMITTER_sSHW_REG(2),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sSHW_REG_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_TRANSMITTER_n0080_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_1_Q,
      O => eUART_eUART_TRANSMITTER_sSHW_REG(1),
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sSHW_REG_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      CE => eUART_eUART_TRANSMITTER_n0080_inv,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_0_Q,
      O => eUART_eUART_TRANSMITTER_sSHW_REG(0),
      SET => GND
    );
  sCURRENT_STATE_FSM_FFd2_In1 : X_LUT6
    generic map(
      INIT => X"1111111111111110"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd2_16,
      ADR1 => sCURRENT_STATE_FSM_FFd1_15,
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR4 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR5 => eUART_eRECV_FIFO_sWR_PTR(3),
      O => sCURRENT_STATE_FSM_FFd2_In
    );
  eUART_eRECV_FIFO_oDATA_1_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFF0001FFFFFFFF"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR4 => eUART_eRECV_FIFO_sFIFO_0(1),
      ADR5 => sCURRENT_STATE_FSM_FFd2_16,
      O => sIUART_DATA(1)
    );
  eUART_eRECV_FIFO_oDATA_2_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFF0001FFFFFFFF"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR4 => eUART_eRECV_FIFO_sFIFO_0(2),
      ADR5 => sCURRENT_STATE_FSM_FFd2_16,
      O => sIUART_DATA(2)
    );
  eUART_eRECV_FIFO_oDATA_3_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFF0001FFFFFFFF"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR4 => eUART_eRECV_FIFO_sFIFO_0(3),
      ADR5 => sCURRENT_STATE_FSM_FFd2_16,
      O => sIUART_DATA(3)
    );
  eUART_eRECV_FIFO_oDATA_4_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFF0001FFFFFFFF"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR4 => eUART_eRECV_FIFO_sFIFO_0(4),
      ADR5 => sCURRENT_STATE_FSM_FFd2_16,
      O => sIUART_DATA(4)
    );
  eUART_eRECV_FIFO_oDATA_5_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFF0001FFFFFFFF"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR4 => eUART_eRECV_FIFO_sFIFO_0(5),
      ADR5 => sCURRENT_STATE_FSM_FFd2_16,
      O => sIUART_DATA(5)
    );
  eUART_eRECV_FIFO_oDATA_6_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFF0001FFFFFFFF"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR4 => eUART_eRECV_FIFO_sFIFO_0(6),
      ADR5 => sCURRENT_STATE_FSM_FFd2_16,
      O => sIUART_DATA(6)
    );
  eUART_eRECV_FIFO_oDATA_7_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFF0001FFFFFFFF"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR4 => eUART_eRECV_FIFO_sFIFO_0(7),
      ADR5 => sCURRENT_STATE_FSM_FFd2_16,
      O => sIUART_DATA(7)
    );
  eUART_eRECV_FIFO_oDATA_0_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFF0001FFFFFFFF"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR4 => eUART_eRECV_FIFO_sFIFO_0(0),
      ADR5 => sCURRENT_STATE_FSM_FFd2_16,
      O => sIUART_DATA(0)
    );
  eUART_eRECV_FIFO_n0181_inv1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAA8"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd2_16,
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR4 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR5 => eUART_sRX_DONE,
      O => eUART_eRECV_FIFO_n0181_inv
    );
  eUART_eRECV_FIFO_n0271_inv1 : X_LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR4 => eUART_sRX_DONE,
      O => eUART_eRECV_FIFO_n0271_inv
    );
  eUART_eRECV_FIFO_Result_1_1 : X_LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      ADR0 => eUART_sRX_DONE,
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(1),
      O => eUART_eRECV_FIFO_Result(1)
    );
  eUART_eRECV_FIFO_Result_2_1 : X_LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      ADR0 => eUART_sRX_DONE,
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(2),
      O => eUART_eRECV_FIFO_Result(2)
    );
  eUART_eRECV_FIFO_Result_3_1 : X_LUT5
    generic map(
      INIT => X"6AAAAAA9"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => eUART_sRX_DONE,
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR4 => eUART_eRECV_FIFO_sWR_PTR(2),
      O => eUART_eRECV_FIFO_Result(3)
    );
  eUART_eSEND_FIFO_oDATA_1_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0001"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR4 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR5 => eUART_eSEND_FIFO_sFIFO_0(1),
      O => eUART_sSEND_DATA(1)
    );
  eUART_eSEND_FIFO_oDATA_2_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0001"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR4 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR5 => eUART_eSEND_FIFO_sFIFO_0(2),
      O => eUART_sSEND_DATA(2)
    );
  eUART_eSEND_FIFO_oDATA_3_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0001"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR4 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR5 => eUART_eSEND_FIFO_sFIFO_0(3),
      O => eUART_sSEND_DATA(3)
    );
  eUART_eSEND_FIFO_oDATA_4_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0001"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR4 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR5 => eUART_eSEND_FIFO_sFIFO_0(4),
      O => eUART_sSEND_DATA(4)
    );
  eUART_eSEND_FIFO_oDATA_5_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0001"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR4 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR5 => eUART_eSEND_FIFO_sFIFO_0(5),
      O => eUART_sSEND_DATA(5)
    );
  eUART_eSEND_FIFO_oDATA_6_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0001"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR4 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR5 => eUART_eSEND_FIFO_sFIFO_0(6),
      O => eUART_sSEND_DATA(6)
    );
  eUART_eSEND_FIFO_oDATA_7_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0001"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR4 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR5 => eUART_eSEND_FIFO_sFIFO_0(7),
      O => eUART_sSEND_DATA(7)
    );
  eUART_eSEND_FIFO_oDATA_0_LogicTrst1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0001"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR4 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR5 => eUART_eSEND_FIFO_sFIFO_0(0),
      O => eUART_sSEND_DATA(0)
    );
  eUART_eSEND_FIFO_n0181_inv1 : X_LUT6
    generic map(
      INIT => X"FFFF0000FFFFFFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0181_inv
    );
  eUART_eSEND_FIFO_n0271_inv1 : X_LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR2 => sCURRENT_STATE_FSM_FFd1_15,
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => eUART_eSEND_FIFO_sWR_PTR(1),
      O => eUART_eSEND_FIFO_n0271_inv
    );
  eUART_eSEND_FIFO_Result_1_1 : X_LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(1),
      O => eUART_eSEND_FIFO_Result(1)
    );
  eUART_eSEND_FIFO_Result_2_1 : X_LUT4
    generic map(
      INIT => X"7E81"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      O => eUART_eSEND_FIFO_Result(2)
    );
  eUART_eSEND_FIFO_Result_3_1 : X_LUT5
    generic map(
      INIT => X"6AAAAAA9"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR1 => sCURRENT_STATE_FSM_FFd1_15,
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR4 => eUART_eSEND_FIFO_sWR_PTR(2),
      O => eUART_eSEND_FIFO_Result(3)
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_1(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_1(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_1(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_1(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_1(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_1(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_1(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_1(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_0_7_sFIFO_0_7_mux_48_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_2(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_2(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_2(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_2(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_2(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_2(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_2(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_2(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_1_7_sFIFO_1_7_mux_47_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_3(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_3(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_3(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_3(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_3(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_3(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_3(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_3(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_2_7_sFIFO_2_7_mux_46_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_4(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_4(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_4(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_4(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_4(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_4(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_4(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_4(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_3_7_sFIFO_3_7_mux_45_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_5(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_5(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_5(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_5(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_5(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_5(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_5(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_5(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_4_7_sFIFO_4_7_mux_44_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_6(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_6(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_6(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_6(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_6(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_6(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_6(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_6(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_7(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_7(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_7(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_7(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_7(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_7(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_7(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_7(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_8(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_8(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_8(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_8(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_8(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_8(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_8(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_8(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_9(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_9(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_9(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_9(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_9(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_9(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_9(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_9(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_10(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_10(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_10(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_10(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_10(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_10(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_10(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_10(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_11(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_11(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_11(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_11(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_11(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_11(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_11(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_11(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_12(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_12(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_12(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_12(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_12(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_12(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_12(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_12(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_13(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_13(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_13(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_13(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_13(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_13(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_13(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_13(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_14(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_14(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_14(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_14(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_14(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_14(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_14(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_14(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_7_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT11 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_15(0),
      ADR2 => sRECV_DATA_REG(0),
      O => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_0_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT21 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_15(1),
      ADR2 => sRECV_DATA_REG(1),
      O => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_1_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT31 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_15(2),
      ADR2 => sRECV_DATA_REG(2),
      O => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_2_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT41 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_15(3),
      ADR2 => sRECV_DATA_REG(3),
      O => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_3_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT51 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_15(4),
      ADR2 => sRECV_DATA_REG(4),
      O => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_4_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT61 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_15(5),
      ADR2 => sRECV_DATA_REG(5),
      O => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_5_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT71 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_15(6),
      ADR2 => sRECV_DATA_REG(6),
      O => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_6_Q
    );
  eUART_eSEND_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT81 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => sCURRENT_STATE_FSM_FFd1_15,
      ADR1 => eUART_eSEND_FIFO_sFIFO_15(7),
      ADR2 => sRECV_DATA_REG(7),
      O => eUART_eSEND_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_7_Q
    );
  eUART_eUART_RECIVER_Mmux_oDATA21 : X_LUT3
    generic map(
      INIT => X"28"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      O => eUART_sRECV_DATA(1)
    );
  eUART_eUART_RECIVER_Mmux_oDATA51 : X_LUT3
    generic map(
      INIT => X"28"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      O => eUART_sRECV_DATA(4)
    );
  eUART_eUART_RECIVER_Mmux_oDATA71 : X_LUT3
    generic map(
      INIT => X"28"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      O => eUART_sRECV_DATA(6)
    );
  eUART_eUART_RECIVER_Mmux_oDATA81 : X_LUT3
    generic map(
      INIT => X"28"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      O => eUART_sRECV_DATA(7)
    );
  eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_In11 : X_LUT6
    generic map(
      INIT => X"6CCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR1 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587,
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_582,
      O => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_In
    );
  eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111 : X_LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      O => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11
    );
  eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_In1 : X_LUT4
    generic map(
      INIT => X"F088"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_582,
      ADR1 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587,
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_In
    );
  eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_In1 : X_LUT6
    generic map(
      INIT => X"CCCCCDCD30003101"
    )
    port map (
      ADR0 => iRX_IBUF_5,
      ADR1 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_582,
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_13,
      ADR4 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_In
    );
  eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_131 : X_LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sDATA_CNT(0),
      ADR1 => eUART_eUART_RECIVER_sDATA_CNT(1),
      ADR2 => eUART_eUART_RECIVER_sDATA_CNT(2),
      O => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_13
    );
  eUART_eUART_RECIVER_Mmux_oDATA61 : X_LUT3
    generic map(
      INIT => X"EB"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      O => eUART_sRECV_DATA(5)
    );
  eUART_eUART_RECIVER_Mmux_oDATA41 : X_LUT3
    generic map(
      INIT => X"EB"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      O => eUART_sRECV_DATA(3)
    );
  eUART_eUART_RECIVER_Mmux_oDATA31 : X_LUT3
    generic map(
      INIT => X"EB"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      O => eUART_sRECV_DATA(2)
    );
  eUART_eUART_RECIVER_Mmux_oDATA11 : X_LUT3
    generic map(
      INIT => X"EB"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      O => eUART_sRECV_DATA(0)
    );
  eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_2_11 : X_LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sDATA_CNT(2),
      ADR1 => eUART_eUART_RECIVER_sDATA_CNT(0),
      ADR2 => eUART_eUART_RECIVER_sDATA_CNT(1),
      O => eUART_eUART_RECIVER_Mcount_sDATA_CNT2
    );
  eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_1_11 : X_LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sDATA_CNT(0),
      ADR1 => eUART_eUART_RECIVER_sDATA_CNT(1),
      O => eUART_eUART_RECIVER_Mcount_sDATA_CNT1
    );
  eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In11 : X_LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      ADR2 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR3 => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      O => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In1
    );
  eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_In1 : X_LUT4
    generic map(
      INIT => X"8AFF"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      ADR1 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In1,
      ADR2 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR3 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_In
    );
  eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_In1 : X_LUT4
    generic map(
      INIT => X"EA40"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In1,
      ADR1 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      ADR2 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR3 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_608,
      O => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_In
    );
  eUART_eBAUD_FREQ_DIV_oTC_7_SW0 : X_LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(6),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(5),
      ADR2 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(2),
      O => N2
    );
  eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_SW0 : X_LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(6),
      O => N4
    );
  eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q : X_LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR3 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR4 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR5 => N4,
      O => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o
    );
  eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In_SW0 : X_LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(0),
      O => N6
    );
  eUART_eUART_TRANSMITTER_Mmux_oTX1_SW0 : X_LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sPARITY_REG(5),
      ADR1 => eUART_eUART_TRANSMITTER_sPARITY_REG(4),
      ADR2 => eUART_eUART_TRANSMITTER_sPARITY_REG(1),
      ADR3 => eUART_eUART_TRANSMITTER_sPARITY_REG(7),
      ADR4 => eUART_eUART_TRANSMITTER_sPARITY_REG(6),
      ADR5 => eUART_eUART_TRANSMITTER_sPARITY_REG(0),
      O => N8
    );
  eUART_eUART_TRANSMITTER_Mmux_oTX1 : X_LUT6
    generic map(
      INIT => X"5DD5D55D19919119"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR1 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      ADR2 => eUART_eUART_TRANSMITTER_sPARITY_REG(3),
      ADR3 => eUART_eUART_TRANSMITTER_sPARITY_REG(2),
      ADR4 => N8,
      ADR5 => eUART_eUART_TRANSMITTER_sSHW_REG(0),
      O => oTX_OBUF_14
    );
  inRST_IBUF : X_BUF
    port map (
      I => inRST,
      O => inRST_IBUF_4
    );
  iRX_IBUF : X_BUF
    port map (
      I => iRX,
      O => iRX_IBUF_5
    );
  eUART_eRECV_FIFO_n0267_inv2 : X_LUT6
    generic map(
      INIT => X"00010001FFFE0000"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR3 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR4 => sCURRENT_STATE_FSM_FFd2_16,
      ADR5 => eUART_sRX_DONE,
      O => eUART_eRECV_FIFO_n0267_inv
    );
  eUART_eSEND_FIFO_n0267_inv2 : X_LUT6
    generic map(
      INIT => X"000100000001FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0267_inv
    );
  eUART_eSEND_FIFO_n0255_inv1 : X_LUT6
    generic map(
      INIT => X"000200000002FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0255_inv
    );
  eUART_eSEND_FIFO_n0249_inv1 : X_LUT6
    generic map(
      INIT => X"000800000008FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0249_inv
    );
  eUART_eSEND_FIFO_n0207_inv1 : X_LUT6
    generic map(
      INIT => X"002000000020FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0207_inv
    );
  eUART_eSEND_FIFO_n0201_inv1 : X_LUT6
    generic map(
      INIT => X"008000000080FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0201_inv
    );
  eUART_eSEND_FIFO_n0237_inv1 : X_LUT6
    generic map(
      INIT => X"040000000400FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0237_inv
    );
  eUART_eSEND_FIFO_n0243_inv1 : X_LUT6
    generic map(
      INIT => X"010000000100FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0243_inv
    );
  eUART_eSEND_FIFO_n0195_inv1 : X_LUT6
    generic map(
      INIT => X"100000001000FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0195_inv
    );
  eUART_eSEND_FIFO_n0189_inv1 : X_LUT6
    generic map(
      INIT => X"400000004000FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0189_inv
    );
  eUART_eSEND_FIFO_n0231_inv1 : X_LUT6
    generic map(
      INIT => X"020000000200FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0231_inv
    );
  eUART_eSEND_FIFO_n0225_inv1 : X_LUT6
    generic map(
      INIT => X"080000000800FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0225_inv
    );
  eUART_eSEND_FIFO_n0183_inv1 : X_LUT6
    generic map(
      INIT => X"200000002000FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0183_inv
    );
  eUART_eSEND_FIFO_n0261_inv1 : X_LUT6
    generic map(
      INIT => X"000400000004FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0261_inv
    );
  eUART_eSEND_FIFO_n0219_inv1 : X_LUT6
    generic map(
      INIT => X"001000000010FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0219_inv
    );
  eUART_eSEND_FIFO_n0213_inv1 : X_LUT6
    generic map(
      INIT => X"004000000040FFFE"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => sCURRENT_STATE_FSM_FFd1_15,
      ADR5 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      O => eUART_eSEND_FIFO_n0213_inv
    );
  eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT81 : X_LUT6
    generic map(
      INIT => X"4444444444444445"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR1 => eUART_eSEND_FIFO_sFIFO_0(7),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(0),
      ADR4 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR5 => eUART_eSEND_FIFO_sWR_PTR(2),
      O => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_7_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT11 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_0_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT21 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_1_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT31 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_2_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT41 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_5_7_sFIFO_5_7_mux_43_OUT_3_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT11 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_7(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_0_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT21 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_7(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_1_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT31 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_7(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_2_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT41 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_7(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_3_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT51 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_7(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_4_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT61 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_7(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_5_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT71 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_7(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_6_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_6_7_sFIFO_6_7_mux_42_OUT81 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_7(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sSHW_REG_0_sSHW_REG_7_XOR_19_o,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_6_7_sFIFO_6_7_mux_42_OUT_7_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT11 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_8(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_0_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT21 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_8(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_1_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT31 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_8(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_2_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT41 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_8(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_3_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT51 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_8(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_4_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT61 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_8(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_5_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT71 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_8(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_6_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_7_7_sFIFO_7_7_mux_41_OUT81 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_8(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_7_7_sFIFO_7_7_mux_41_OUT_7_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT11 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_9(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_0_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT21 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_9(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_1_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT31 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_9(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_2_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT41 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_9(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_3_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT51 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_9(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_4_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT61 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_9(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_5_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT71 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_9(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_6_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_8_7_sFIFO_8_7_mux_40_OUT81 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_9(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_8_7_sFIFO_8_7_mux_40_OUT_7_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT11 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_10(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_0_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT21 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_10(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_1_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT31 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_10(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_2_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT41 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_10(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_3_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT51 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_10(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_4_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT61 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_10(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_5_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT71 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_10(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_6_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_9_7_sFIFO_9_7_mux_39_OUT81 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_10(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_9_7_sFIFO_9_7_mux_39_OUT_7_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT11 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_11(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_0_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT21 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_11(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_1_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT31 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_11(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_2_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT41 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_11(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_3_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT51 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_11(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_4_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT61 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_11(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_5_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT71 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_11(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_6_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_10_7_sFIFO_10_7_mux_38_OUT81 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_11(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_10_7_sFIFO_10_7_mux_38_OUT_7_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT11 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_12(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_0_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT21 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_12(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_1_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT31 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_12(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_2_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT41 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_12(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_3_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT51 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_12(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_4_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT61 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_12(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_5_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT71 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_12(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_6_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_11_7_sFIFO_11_7_mux_37_OUT81 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_12(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_11_7_sFIFO_11_7_mux_37_OUT_7_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT11 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_13(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_0_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT21 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_13(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_1_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT31 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_13(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_2_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT41 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_13(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_3_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT51 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_13(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_4_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT61 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_13(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_5_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT71 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_13(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_6_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_12_7_sFIFO_12_7_mux_36_OUT81 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_13(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_12_7_sFIFO_12_7_mux_36_OUT_7_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT11 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_14(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_0_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT21 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_14(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_1_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT31 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_14(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_2_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT41 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_14(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_3_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT51 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_14(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_4_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT61 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_14(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_5_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT71 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_14(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_6_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_13_7_sFIFO_13_7_mux_35_OUT81 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_14(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_13_7_sFIFO_13_7_mux_35_OUT_7_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT11 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_15(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_0_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT21 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_15(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_1_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT31 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_15(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_2_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT41 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_15(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_3_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT51 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_15(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_4_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT61 : X_LUT6
    generic map(
      INIT => X"AAAAAAAAFCAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_15(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_5_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT71 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_15(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_6_Q
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_14_7_sFIFO_14_7_mux_34_OUT81 : X_LUT6
    generic map(
      INIT => X"AAAAAAAA0CAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_15(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eRECV_FIFO_sFIFO_14_7_sFIFO_14_7_mux_34_OUT_7_Q
    );
  eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT111 : X_LUT6
    generic map(
      INIT => X"FFFF7FFFFFFFFFFF"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR2 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR3 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR4 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      ADR5 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      O => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11
    );
  eUART_eRECV_FIFO_n0255_inv1_SW0 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      O => N10
    );
  eUART_eRECV_FIFO_n0255_inv1 : X_LUT6
    generic map(
      INIT => X"F0F0E0E000F044E0"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR2 => sCURRENT_STATE_FSM_FFd2_16,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N10,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0255_inv
    );
  eUART_eRECV_FIFO_n0249_inv1_SW0 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      O => N12
    );
  eUART_eRECV_FIFO_n0249_inv1 : X_LUT6
    generic map(
      INIT => X"F0F0E0E000F088E0"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR2 => sCURRENT_STATE_FSM_FFd2_16,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N12,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0249_inv
    );
  eUART_eRECV_FIFO_n0207_inv1 : X_LUT6
    generic map(
      INIT => X"F0F0E0E000F088E0"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR2 => sCURRENT_STATE_FSM_FFd2_16,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N10,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0207_inv
    );
  eUART_eRECV_FIFO_n0237_inv1_SW0 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(1),
      O => N16
    );
  eUART_eRECV_FIFO_n0237_inv1 : X_LUT6
    generic map(
      INIT => X"F0F0E0E000F088E0"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR2 => sCURRENT_STATE_FSM_FFd2_16,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N16,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0237_inv
    );
  eUART_eRECV_FIFO_n0243_inv1_SW0 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      O => N18
    );
  eUART_eRECV_FIFO_n0243_inv1 : X_LUT6
    generic map(
      INIT => X"F0F0E0E000F044E0"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => sCURRENT_STATE_FSM_FFd2_16,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N18,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0243_inv
    );
  eUART_eRECV_FIFO_n0195_inv1 : X_LUT6
    generic map(
      INIT => X"F0F0E0E000F088E0"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR2 => sCURRENT_STATE_FSM_FFd2_16,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N18,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0195_inv
    );
  eUART_eRECV_FIFO_n0231_inv1_SW0 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      O => N22
    );
  eUART_eRECV_FIFO_n0231_inv1 : X_LUT6
    generic map(
      INIT => X"F0F0E0E000F088E0"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR2 => sCURRENT_STATE_FSM_FFd2_16,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N22,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0231_inv
    );
  eUART_eRECV_FIFO_n0261_inv1_SW0 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(1),
      O => N24
    );
  eUART_eRECV_FIFO_n0261_inv1 : X_LUT6
    generic map(
      INIT => X"F0F0E0E000F044E0"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR2 => sCURRENT_STATE_FSM_FFd2_16,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N24,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0261_inv
    );
  eUART_eRECV_FIFO_n0219_inv1 : X_LUT6
    generic map(
      INIT => X"F0F0E0E000F044E0"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR2 => sCURRENT_STATE_FSM_FFd2_16,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N18,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0219_inv
    );
  eUART_eRECV_FIFO_n0213_inv1 : X_LUT6
    generic map(
      INIT => X"F0F0E0E000F088E0"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR2 => sCURRENT_STATE_FSM_FFd2_16,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N24,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0213_inv
    );
  eUART_eRECV_FIFO_n0201_inv1_SW0 : X_LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(0),
      O => N30
    );
  eUART_eRECV_FIFO_n0201_inv1_SW1 : X_LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(2),
      O => N31
    );
  eUART_eRECV_FIFO_n0201_inv1 : X_LUT6
    generic map(
      INIT => X"CCCC88880CAC08A8"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => sCURRENT_STATE_FSM_FFd2_16,
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => N31,
      ADR4 => N30,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0201_inv
    );
  eUART_eRECV_FIFO_n0189_inv1_SW1 : X_LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(0),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(1),
      O => N34
    );
  eUART_eRECV_FIFO_n0189_inv1 : X_LUT6
    generic map(
      INIT => X"CCCC88880CAC08A8"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => sCURRENT_STATE_FSM_FFd2_16,
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => N34,
      ADR4 => N30,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0189_inv
    );
  eUART_eRECV_FIFO_n0225_inv1_SW1 : X_LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(0),
      O => N37
    );
  eUART_eRECV_FIFO_n0225_inv1 : X_LUT6
    generic map(
      INIT => X"CCCC88880C5C0858"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => sCURRENT_STATE_FSM_FFd2_16,
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => N37,
      ADR4 => N30,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0225_inv
    );
  eUART_eRECV_FIFO_n0183_inv1_SW1 : X_LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(2),
      ADR1 => eUART_eRECV_FIFO_sWR_PTR(1),
      ADR2 => eUART_eRECV_FIFO_sWR_PTR(0),
      O => N40
    );
  eUART_eRECV_FIFO_n0183_inv1 : X_LUT6
    generic map(
      INIT => X"CCCC88880CAC08A8"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sWR_PTR(3),
      ADR1 => sCURRENT_STATE_FSM_FFd2_16,
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => N40,
      ADR4 => N30,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => eUART_eRECV_FIFO_n0183_inv
    );
  eUART_eRECV_FIFO_sFIFO_0_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_0_7_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_0(7),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_0_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_0_6_rstpot_675,
      O => eUART_eRECV_FIFO_sFIFO_0(6),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_0_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_0_5_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_0(5),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_0_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_0_4_rstpot_677,
      O => eUART_eRECV_FIFO_sFIFO_0(4),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_0_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_0_3_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_0(3),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_0_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_0_2_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_0(2),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_0_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_0_1_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_0(1),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_0_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_0_0_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_0(0),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_1_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_1_7_rstpot_682,
      O => eUART_eRECV_FIFO_sFIFO_1(7),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_1_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_1_6_rstpot_683,
      O => eUART_eRECV_FIFO_sFIFO_1(6),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_1_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_1_5_rstpot_684,
      O => eUART_eRECV_FIFO_sFIFO_1(5),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_1_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_1_4_rstpot_685,
      O => eUART_eRECV_FIFO_sFIFO_1(4),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_1_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_1_3_rstpot_686,
      O => eUART_eRECV_FIFO_sFIFO_1(3),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_1_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_1_2_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_1(2),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_1_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_1_1_rstpot_688,
      O => eUART_eRECV_FIFO_sFIFO_1(1),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_1_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_1_0_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_1(0),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_2_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_2_7_rstpot_690,
      O => eUART_eRECV_FIFO_sFIFO_2(7),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_2_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_2_6_rstpot_691,
      O => eUART_eRECV_FIFO_sFIFO_2(6),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_2_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_2_5_rstpot_692,
      O => eUART_eRECV_FIFO_sFIFO_2(5),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_2_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_2_4_rstpot_693,
      O => eUART_eRECV_FIFO_sFIFO_2(4),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_2_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_2_3_rstpot_694,
      O => eUART_eRECV_FIFO_sFIFO_2(3),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_2_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_2_2_rstpot_695,
      O => eUART_eRECV_FIFO_sFIFO_2(2),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_2_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_2_1_rstpot_696,
      O => eUART_eRECV_FIFO_sFIFO_2(1),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_2_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_2_0_rstpot_697,
      O => eUART_eRECV_FIFO_sFIFO_2(0),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_3_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_3_7_rstpot_698,
      O => eUART_eRECV_FIFO_sFIFO_3(7),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_3_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_3_6_rstpot_699,
      O => eUART_eRECV_FIFO_sFIFO_3(6),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_3_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_3_5_rstpot_700,
      O => eUART_eRECV_FIFO_sFIFO_3(5),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_3_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_3_4_rstpot_701,
      O => eUART_eRECV_FIFO_sFIFO_3(4),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_3_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_3_3_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_3(3),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_3_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_3_2_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_3(2),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_3_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_3_1_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_3(1),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_3_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_3_0_rstpot,
      O => eUART_eRECV_FIFO_sFIFO_3(0),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_4_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_4_7_rstpot_706,
      O => eUART_eRECV_FIFO_sFIFO_4(7),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_4_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_4_6_rstpot_707,
      O => eUART_eRECV_FIFO_sFIFO_4(6),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_4_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_4_5_rstpot_708,
      O => eUART_eRECV_FIFO_sFIFO_4(5),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_4_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_4_4_rstpot_709,
      O => eUART_eRECV_FIFO_sFIFO_4(4),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_4_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_4_3_rstpot_710,
      O => eUART_eRECV_FIFO_sFIFO_4(3),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_4_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_4_2_rstpot_711,
      O => eUART_eRECV_FIFO_sFIFO_4(2),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_4_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_4_1_rstpot_712,
      O => eUART_eRECV_FIFO_sFIFO_4(1),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_4_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_4_0_rstpot_713,
      O => eUART_eRECV_FIFO_sFIFO_4(0),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_5_7 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_5_7_rstpot_714,
      O => eUART_eRECV_FIFO_sFIFO_5(7),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_5_6 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_5_6_rstpot_715,
      O => eUART_eRECV_FIFO_sFIFO_5(6),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_5_5 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_5_5_rstpot_716,
      O => eUART_eRECV_FIFO_sFIFO_5(5),
      CE => VCC,
      SET => GND
    );
  eUART_eRECV_FIFO_sFIFO_5_4 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eRECV_FIFO_sFIFO_5_4_rstpot_717,
      O => eUART_eRECV_FIFO_sFIFO_5(4),
      CE => VCC,
      SET => GND
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_0_Q : X_LUT6
    generic map(
      INIT => X"AAAA2AAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(0),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(4),
      ADR2 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(3),
      ADR3 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(7),
      ADR4 => N2,
      ADR5 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(1),
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_0_Q_53
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_1_Q : X_LUT6
    generic map(
      INIT => X"AAAA2AAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(1),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(4),
      ADR2 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(3),
      ADR3 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(7),
      ADR4 => N2,
      ADR5 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(0),
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_1_Q_56
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_3_Q : X_LUT6
    generic map(
      INIT => X"AAAA2AAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(3),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(7),
      ADR2 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(4),
      ADR3 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(1),
      ADR4 => N2,
      ADR5 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(0),
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_3_Q_61
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_4_Q : X_LUT6
    generic map(
      INIT => X"AAAA2AAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(4),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(7),
      ADR2 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(3),
      ADR3 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(1),
      ADR4 => N2,
      ADR5 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(0),
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_4_Q_64
    );
  eUART_sTC_inv1 : X_LUT6
    generic map(
      INIT => X"FFFFFFFF7FFFFFFF"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(0),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(1),
      ADR2 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(7),
      ADR3 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(3),
      ADR4 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(4),
      ADR5 => N2,
      O => eUART_sTC_inv
    );
  eUART_eUART_RECIVER_Mmux_oRX_DONE11 : X_LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_1_842,
      ADR1 => eUART_eUART_RECIVER_sTC_CNT_3_2_843,
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      O => eUART_sRX_DONE
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT81_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N43
    );
  eUART_eRECV_FIFO_sFIFO_1_7_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N42,
      ADR3 => N43,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0261_inv,
      O => eUART_eRECV_FIFO_sFIFO_1_7_rstpot_682
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT71_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N46
    );
  eUART_eRECV_FIFO_sFIFO_1_6_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N45,
      ADR3 => N46,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0261_inv,
      O => eUART_eRECV_FIFO_sFIFO_1_6_rstpot_683
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT61_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N49
    );
  eUART_eRECV_FIFO_sFIFO_1_5_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N48,
      ADR3 => N49,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0261_inv,
      O => eUART_eRECV_FIFO_sFIFO_1_5_rstpot_684
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT51_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N52
    );
  eUART_eRECV_FIFO_sFIFO_1_4_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N51,
      ADR3 => N52,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0261_inv,
      O => eUART_eRECV_FIFO_sFIFO_1_4_rstpot_685
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT41_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N55
    );
  eUART_eRECV_FIFO_sFIFO_1_3_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N54,
      ADR3 => N55,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0261_inv,
      O => eUART_eRECV_FIFO_sFIFO_1_3_rstpot_686
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT21_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N61
    );
  eUART_eRECV_FIFO_sFIFO_1_1_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N60,
      ADR3 => N61,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0261_inv,
      O => eUART_eRECV_FIFO_sFIFO_1_1_rstpot_688
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT81_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N67
    );
  eUART_eRECV_FIFO_sFIFO_2_7_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N66,
      ADR3 => N67,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0255_inv,
      O => eUART_eRECV_FIFO_sFIFO_2_7_rstpot_690
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT71_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N70
    );
  eUART_eRECV_FIFO_sFIFO_2_6_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N69,
      ADR3 => N70,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0255_inv,
      O => eUART_eRECV_FIFO_sFIFO_2_6_rstpot_691
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT61_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N73
    );
  eUART_eRECV_FIFO_sFIFO_2_5_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N72,
      ADR3 => N73,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0255_inv,
      O => eUART_eRECV_FIFO_sFIFO_2_5_rstpot_692
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT51_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N76
    );
  eUART_eRECV_FIFO_sFIFO_2_4_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N75,
      ADR3 => N76,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0255_inv,
      O => eUART_eRECV_FIFO_sFIFO_2_4_rstpot_693
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT41_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N79
    );
  eUART_eRECV_FIFO_sFIFO_2_3_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N78,
      ADR3 => N79,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0255_inv,
      O => eUART_eRECV_FIFO_sFIFO_2_3_rstpot_694
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT31_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N82
    );
  eUART_eRECV_FIFO_sFIFO_2_2_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N81,
      ADR3 => N82,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0255_inv,
      O => eUART_eRECV_FIFO_sFIFO_2_2_rstpot_695
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT21_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N85
    );
  eUART_eRECV_FIFO_sFIFO_2_1_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N84,
      ADR3 => N85,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0255_inv,
      O => eUART_eRECV_FIFO_sFIFO_2_1_rstpot_696
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT11_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N88
    );
  eUART_eRECV_FIFO_sFIFO_2_0_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N87,
      ADR3 => N88,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0255_inv,
      O => eUART_eRECV_FIFO_sFIFO_2_0_rstpot_697
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT81_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N91
    );
  eUART_eRECV_FIFO_sFIFO_3_7_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N90,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N91,
      ADR5 => eUART_eRECV_FIFO_n0249_inv,
      O => eUART_eRECV_FIFO_sFIFO_3_7_rstpot_698
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT71_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N94
    );
  eUART_eRECV_FIFO_sFIFO_3_6_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N93,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N94,
      ADR5 => eUART_eRECV_FIFO_n0249_inv,
      O => eUART_eRECV_FIFO_sFIFO_3_6_rstpot_699
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT61_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N97
    );
  eUART_eRECV_FIFO_sFIFO_3_5_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N96,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N97,
      ADR5 => eUART_eRECV_FIFO_n0249_inv,
      O => eUART_eRECV_FIFO_sFIFO_3_5_rstpot_700
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT51_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N100
    );
  eUART_eRECV_FIFO_sFIFO_3_4_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N99,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N100,
      ADR5 => eUART_eRECV_FIFO_n0249_inv,
      O => eUART_eRECV_FIFO_sFIFO_3_4_rstpot_701
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT81_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N115
    );
  eUART_eRECV_FIFO_sFIFO_4_7_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N114,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N115,
      ADR5 => eUART_eRECV_FIFO_n0243_inv,
      O => eUART_eRECV_FIFO_sFIFO_4_7_rstpot_706
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT71_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N118
    );
  eUART_eRECV_FIFO_sFIFO_4_6_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N117,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N118,
      ADR5 => eUART_eRECV_FIFO_n0243_inv,
      O => eUART_eRECV_FIFO_sFIFO_4_6_rstpot_707
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT61_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N121
    );
  eUART_eRECV_FIFO_sFIFO_4_5_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N120,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N121,
      ADR5 => eUART_eRECV_FIFO_n0243_inv,
      O => eUART_eRECV_FIFO_sFIFO_4_5_rstpot_708
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT51_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N124
    );
  eUART_eRECV_FIFO_sFIFO_4_4_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N123,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N124,
      ADR5 => eUART_eRECV_FIFO_n0243_inv,
      O => eUART_eRECV_FIFO_sFIFO_4_4_rstpot_709
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT41_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N127
    );
  eUART_eRECV_FIFO_sFIFO_4_3_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N126,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N127,
      ADR5 => eUART_eRECV_FIFO_n0243_inv,
      O => eUART_eRECV_FIFO_sFIFO_4_3_rstpot_710
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT31_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N130
    );
  eUART_eRECV_FIFO_sFIFO_4_2_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N129,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N130,
      ADR5 => eUART_eRECV_FIFO_n0243_inv,
      O => eUART_eRECV_FIFO_sFIFO_4_2_rstpot_711
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT21_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N133
    );
  eUART_eRECV_FIFO_sFIFO_4_1_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N132,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N133,
      ADR5 => eUART_eRECV_FIFO_n0243_inv,
      O => eUART_eRECV_FIFO_sFIFO_4_1_rstpot_712
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT11_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N136
    );
  eUART_eRECV_FIFO_sFIFO_4_0_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N135,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N136,
      ADR5 => eUART_eRECV_FIFO_n0243_inv,
      O => eUART_eRECV_FIFO_sFIFO_4_0_rstpot_713
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT81_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N139
    );
  eUART_eRECV_FIFO_sFIFO_5_7_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N138,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N139,
      ADR5 => eUART_eRECV_FIFO_n0237_inv,
      O => eUART_eRECV_FIFO_sFIFO_5_7_rstpot_714
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT71_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N142
    );
  eUART_eRECV_FIFO_sFIFO_5_6_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N141,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N142,
      ADR5 => eUART_eRECV_FIFO_n0237_inv,
      O => eUART_eRECV_FIFO_sFIFO_5_6_rstpot_715
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT61_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N145
    );
  eUART_eRECV_FIFO_sFIFO_5_5_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N144,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N145,
      ADR5 => eUART_eRECV_FIFO_n0237_inv,
      O => eUART_eRECV_FIFO_sFIFO_5_5_rstpot_716
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT51_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N148
    );
  eUART_eRECV_FIFO_sFIFO_5_4_rstpot : X_LUT6
    generic map(
      INIT => X"F3FCC030AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N147,
      ADR3 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841,
      ADR4 => N148,
      ADR5 => eUART_eRECV_FIFO_n0237_inv,
      O => eUART_eRECV_FIFO_sFIFO_5_4_rstpot_717
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT71_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(6),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N154
    );
  eUART_eRECV_FIFO_sFIFO_0_6_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_0(6),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N153,
      ADR3 => N154,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0267_inv,
      O => eUART_eRECV_FIFO_sFIFO_0_6_rstpot_675
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT51_SW1 : X_LUT4
    generic map(
      INIT => X"AACA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(4),
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR3 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      O => N160
    );
  eUART_eRECV_FIFO_sFIFO_0_4_rstpot : X_LUT6
    generic map(
      INIT => X"F3C0FC30AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_0(4),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR2 => N159,
      ADR3 => N160,
      ADR4 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840,
      ADR5 => eUART_eRECV_FIFO_n0267_inv,
      O => eUART_eRECV_FIFO_sFIFO_0_4_rstpot_677
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_7_Q : X_LUT6
    generic map(
      INIT => X"AAAA2AAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(7),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(1),
      ADR2 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(0),
      ADR3 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(4),
      ADR4 => N2,
      ADR5 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(3),
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_lut_7_Q_71
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT81_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(7),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N42
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT71_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(6),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N45
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT61_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(5),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N48
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT51_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(4),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N51
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT41_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(3),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N54
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_1_7_sFIFO_1_7_mux_47_OUT21_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(1),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N60
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT81_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(7),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N66
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT71_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(6),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N69
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT61_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(5),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N72
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT51_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(4),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N75
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT41_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(3),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N78
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT31_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(2),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N81
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT21_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(1),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N84
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_2_7_sFIFO_2_7_mux_46_OUT11_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(0),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N87
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT81_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(7),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N90
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT71_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(6),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N93
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT61_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(5),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N96
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_3_7_sFIFO_3_7_mux_45_OUT51_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(4),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N99
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT81_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(7),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N114
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT71_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(6),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N117
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT61_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(5),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N120
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT51_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(4),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N123
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT41_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(3),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N126
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT31_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(2),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N129
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT21_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(1),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N132
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_4_7_sFIFO_4_7_mux_44_OUT11_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_5(0),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N135
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT81_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(7),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N138
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT71_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(6),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N141
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT61_SW0 : X_LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(5),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N144
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_5_7_sFIFO_5_7_mux_43_OUT51_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_6(4),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N147
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT71_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(6),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N153
    );
  eUART_eRECV_FIFO_Mmux_sFIFO_0_7_sFIFO_0_7_mux_48_OUT51_SW0 : X_LUT6
    generic map(
      INIT => X"2AAAAAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(4),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N159
    );
  eUART_eUART_TRANSMITTER_n0077_inv1_SW0 : X_LUT6
    generic map(
      INIT => X"AAA8AAAAFFFCFFFF"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR1 => eUART_eUART_TRANSMITTER_sDATA_CNT(0),
      ADR2 => eUART_eUART_TRANSMITTER_sDATA_CNT(2),
      ADR3 => eUART_eUART_TRANSMITTER_sDATA_CNT(1),
      ADR4 => eUART_eUART_TRANSMITTER_sDATA_CNT(3),
      ADR5 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      O => N180
    );
  eUART_eBAUD_FREQ_DIV_oTC_7_SW4 : X_LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(1),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(0),
      ADR2 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(7),
      ADR3 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(4),
      ADR4 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(3),
      O => N182
    );
  eUART_eUART_RECIVER_sTC_CNT_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sTC_CNT_3_rstpot_784,
      O => eUART_eUART_RECIVER_sTC_CNT(3),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sTC_CNT_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sTC_CNT_2_rstpot_785,
      O => eUART_eUART_RECIVER_sTC_CNT(2),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sTC_CNT_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sTC_CNT_1_rstpot_786,
      O => eUART_eUART_RECIVER_sTC_CNT(1),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sTC_CNT_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sTC_CNT_0_rstpot_787,
      O => eUART_eUART_RECIVER_sTC_CNT(0),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sDATA_CNT_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sDATA_CNT_2_rstpot_788,
      O => eUART_eUART_TRANSMITTER_sDATA_CNT(2),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sDATA_CNT_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sDATA_CNT_1_rstpot_789,
      O => eUART_eUART_TRANSMITTER_sDATA_CNT(1),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sTC_CNT_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sTC_CNT_3_rstpot_790,
      O => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sTC_CNT_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sTC_CNT_2_rstpot_791,
      O => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sTC_CNT_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sTC_CNT_1_rstpot_792,
      O => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sTC_CNT_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sTC_CNT_0_rstpot_793,
      O => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sDATA_CNT_3 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sDATA_CNT_3_rstpot_794,
      O => eUART_eUART_TRANSMITTER_sDATA_CNT(3),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sDATA_CNT_0 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_TRANSMITTER_sDATA_CNT_0_rstpot_795,
      O => eUART_eUART_TRANSMITTER_sDATA_CNT(0),
      CE => VCC,
      SET => GND
    );
  eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In21_SW0 : X_LUT4
    generic map(
      INIT => X"FEFF"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sDATA_CNT(0),
      ADR1 => eUART_eUART_TRANSMITTER_sDATA_CNT(2),
      ADR2 => eUART_eUART_TRANSMITTER_sDATA_CNT(1),
      ADR3 => eUART_eUART_TRANSMITTER_sDATA_CNT(3),
      O => N186
    );
  eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In : X_LUT6
    generic map(
      INIT => X"8898889888988D9D"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR1 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In1,
      ADR2 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      ADR3 => N186,
      ADR4 => N6,
      ADR5 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_608,
      O => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In_611
    );
  eUART_eSEND_FIFO_oDATA_6_LogicTrst1_SW0 : X_LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      ADR0 => eUART_eSEND_FIFO_sWR_PTR(1),
      ADR1 => eUART_eSEND_FIFO_sWR_PTR(0),
      O => N188
    );
  eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT71 : X_LUT6
    generic map(
      INIT => X"EEEFEEEE44454444"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR1 => eUART_eSEND_FIFO_sFIFO_0(6),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => N188,
      ADR5 => eUART_eUART_TRANSMITTER_sSHW_REG(7),
      O => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_6_Q
    );
  eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT61 : X_LUT6
    generic map(
      INIT => X"EEEFEEEE44454444"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR1 => eUART_eSEND_FIFO_sFIFO_0(5),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => N188,
      ADR5 => eUART_eUART_TRANSMITTER_sSHW_REG(6),
      O => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_5_Q
    );
  eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT51 : X_LUT6
    generic map(
      INIT => X"EEEFEEEE44454444"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR1 => eUART_eSEND_FIFO_sFIFO_0(4),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => N188,
      ADR5 => eUART_eUART_TRANSMITTER_sSHW_REG(5),
      O => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_4_Q
    );
  eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT41 : X_LUT6
    generic map(
      INIT => X"EEEFEEEE44454444"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR1 => eUART_eSEND_FIFO_sFIFO_0(3),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => N188,
      ADR5 => eUART_eUART_TRANSMITTER_sSHW_REG(4),
      O => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_3_Q
    );
  eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT31 : X_LUT6
    generic map(
      INIT => X"EEEFEEEE44454444"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR1 => eUART_eSEND_FIFO_sFIFO_0(2),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => N188,
      ADR5 => eUART_eUART_TRANSMITTER_sSHW_REG(3),
      O => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_2_Q
    );
  eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT21 : X_LUT6
    generic map(
      INIT => X"EEEFEEEE44454444"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR1 => eUART_eSEND_FIFO_sFIFO_0(1),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => N188,
      ADR5 => eUART_eUART_TRANSMITTER_sSHW_REG(2),
      O => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_1_Q
    );
  eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT12 : X_LUT6
    generic map(
      INIT => X"EEEFEEEE44454444"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_Mmux_sSHW_REG_7_iDATA_7_mux_26_OUT11,
      ADR1 => eUART_eSEND_FIFO_sFIFO_0(0),
      ADR2 => eUART_eSEND_FIFO_sWR_PTR(3),
      ADR3 => eUART_eSEND_FIFO_sWR_PTR(2),
      ADR4 => N188,
      ADR5 => eUART_eUART_TRANSMITTER_sSHW_REG(1),
      O => eUART_eUART_TRANSMITTER_sSHW_REG_7_iDATA_7_mux_26_OUT_0_Q
    );
  eUART_eUART_TRANSMITTER_sDATA_CNT_3_rstpot_SW0 : X_LUT5
    generic map(
      INIT => X"95575555"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sDATA_CNT(3),
      ADR1 => eUART_eUART_TRANSMITTER_sDATA_CNT(2),
      ADR2 => eUART_eUART_TRANSMITTER_sDATA_CNT(1),
      ADR3 => eUART_eUART_TRANSMITTER_sDATA_CNT(0),
      ADR4 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      O => N202
    );
  eUART_eUART_TRANSMITTER_sDATA_CNT_3_rstpot : X_LUT6
    generic map(
      INIT => X"AAAA2AAAAAAAEAAA"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sDATA_CNT(3),
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR2 => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      ADR3 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR4 => N180,
      ADR5 => N202,
      O => eUART_eUART_TRANSMITTER_sDATA_CNT_3_rstpot_794
    );
  eUART_eUART_TRANSMITTER_sDATA_CNT_0_rstpot_SW0 : X_LUT5
    generic map(
      INIT => X"AAAA555D"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      ADR1 => eUART_eUART_TRANSMITTER_sDATA_CNT(3),
      ADR2 => eUART_eUART_TRANSMITTER_sDATA_CNT(1),
      ADR3 => eUART_eUART_TRANSMITTER_sDATA_CNT(2),
      ADR4 => eUART_eUART_TRANSMITTER_sDATA_CNT(0),
      O => N204
    );
  eUART_eUART_TRANSMITTER_sDATA_CNT_0_rstpot : X_LUT6
    generic map(
      INIT => X"AAAA2AAAAAAAEAAA"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sDATA_CNT(0),
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR2 => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      ADR3 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR4 => N180,
      ADR5 => N204,
      O => eUART_eUART_TRANSMITTER_sDATA_CNT_0_rstpot_795
    );
  eUART_eUART_RECIVER_n0071_inv1_SW1 : X_LUT6
    generic map(
      INIT => X"7F7F7F7F7F7F7FFF"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_582,
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587,
      O => N207
    );
  eUART_eUART_RECIVER_n0071_inv1_SW4 : X_LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR1 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_582,
      ADR2 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587,
      O => N212
    );
  eUART_eUART_RECIVER_sTC_CNT_1_rstpot : X_LUT6
    generic map(
      INIT => X"A6AAAAAA66666666"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR2 => N2,
      ADR3 => N182,
      ADR4 => N212,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eUART_RECIVER_sTC_CNT_1_rstpot_786
    );
  eUART_eUART_RECIVER_n0071_inv1_SW5 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_582,
      ADR1 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587,
      O => N214
    );
  eUART_eUART_RECIVER_sTC_CNT_0_rstpot : X_LUT6
    generic map(
      INIT => X"A5A6AAAA55555555"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR1 => N214,
      ADR2 => N2,
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => N182,
      ADR5 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eUART_RECIVER_sTC_CNT_0_rstpot_787
    );
  eUART_eUART_TRANSMITTER_n0074_inv1_SW0 : X_LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR2 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      O => N216
    );
  eUART_eUART_TRANSMITTER_n0074_inv1_SW1 : X_LUT6
    generic map(
      INIT => X"7F7F7F7F7F7F7FFF"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR2 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      ADR3 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR4 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      ADR5 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_608,
      O => N217
    );
  eUART_eUART_TRANSMITTER_sTC_CNT_3_rstpot : X_LUT6
    generic map(
      INIT => X"F0F0D2F0A5A587A5"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In1,
      ADR1 => N2,
      ADR2 => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      ADR3 => N182,
      ADR4 => N217,
      ADR5 => N216,
      O => eUART_eUART_TRANSMITTER_sTC_CNT_3_rstpot_790
    );
  eUART_eUART_TRANSMITTER_n0074_inv1_SW4 : X_LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR1 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      ADR2 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_608,
      O => N222
    );
  eUART_eUART_TRANSMITTER_sTC_CNT_1_rstpot : X_LUT6
    generic map(
      INIT => X"99599999AAAAAAAA"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR1 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In1,
      ADR2 => N182,
      ADR3 => N2,
      ADR4 => N222,
      ADR5 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      O => eUART_eUART_TRANSMITTER_sTC_CNT_1_rstpot_792
    );
  eUART_eUART_TRANSMITTER_n0074_inv1_SW5 : X_LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      ADR1 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_608,
      O => N224
    );
  eUART_eUART_TRANSMITTER_sTC_CNT_0_rstpot : X_LUT6
    generic map(
      INIT => X"9939993999399999"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_In1,
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      ADR2 => N182,
      ADR3 => N2,
      ADR4 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR5 => N224,
      O => eUART_eUART_TRANSMITTER_sTC_CNT_0_rstpot_793
    );
  eUART_eUART_TRANSMITTER_n0077_inv1_SW1 : X_LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR2 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      O => N226
    );
  eUART_eUART_TRANSMITTER_sDATA_CNT_2_rstpot : X_LUT6
    generic map(
      INIT => X"9CCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => N180,
      ADR1 => eUART_eUART_TRANSMITTER_sDATA_CNT(2),
      ADR2 => eUART_eUART_TRANSMITTER_sDATA_CNT(1),
      ADR3 => eUART_eUART_TRANSMITTER_sDATA_CNT(0),
      ADR4 => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      ADR5 => N226,
      O => eUART_eUART_TRANSMITTER_sDATA_CNT_2_rstpot_788
    );
  eUART_eUART_TRANSMITTER_n0077_inv1_SW2 : X_LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      O => N228
    );
  eUART_eUART_TRANSMITTER_sDATA_CNT_1_rstpot : X_LUT6
    generic map(
      INIT => X"9CCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => N180,
      ADR1 => eUART_eUART_TRANSMITTER_sDATA_CNT(1),
      ADR2 => eUART_eUART_TRANSMITTER_sDATA_CNT(0),
      ADR3 => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      ADR4 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR5 => N228,
      O => eUART_eUART_TRANSMITTER_sDATA_CNT_1_rstpot_789
    );
  eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o1 : X_LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587,
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => eUART_eUART_RECIVER_sTC_CNT(1),
      O => eUART_eUART_RECIVER_sSHW_EN_sTC_CNT_DONE_AND_6_o
    );
  eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_In11 : X_LUT6
    generic map(
      INIT => X"0000000080000000"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR2 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      ADR3 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR4 => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      ADR5 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      O => eUART_sTX_DONE
    );
  eUART_eUART_TRANSMITTER_n0080_inv1 : X_LUT6
    generic map(
      INIT => X"0000800080000000"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      ADR2 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR3 => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      ADR4 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR5 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      O => eUART_eUART_TRANSMITTER_n0080_inv
    );
  eUART_eRECV_FIFO_sFIFO_1_2_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAAFCAAAAAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N231
    );
  eUART_eRECV_FIFO_sFIFO_1_0_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAAFCAAAAAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_2(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N233
    );
  eUART_eRECV_FIFO_sFIFO_3_3_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAAFCAAAAAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N235
    );
  eUART_eRECV_FIFO_sFIFO_3_2_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAAFCAAAAAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N237
    );
  eUART_eRECV_FIFO_sFIFO_3_1_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAA0CAAAAAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N239
    );
  eUART_eRECV_FIFO_sFIFO_3_0_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAAFCAAAAAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_4(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N241
    );
  eUART_eRECV_FIFO_sFIFO_0_7_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAA0CAAAAAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(7),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(7),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N243
    );
  eUART_eRECV_FIFO_sFIFO_0_5_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAAFCAAAAAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(5),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N245
    );
  eUART_eRECV_FIFO_sFIFO_0_3_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAAFCAAAAAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N247
    );
  eUART_eRECV_FIFO_sFIFO_0_2_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAAFCAAAAAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(2),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N249
    );
  eUART_eRECV_FIFO_sFIFO_0_1_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAA0CAAAAAAC0AA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(1),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N251
    );
  eUART_eRECV_FIFO_sFIFO_0_0_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAAFCAAAAAACFAA"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(0),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(8),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      ADR4 => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826,
      ADR5 => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827,
      O => N253
    );
  eUART_eUART_RECIVER_sTC_CNT_2_rstpot_SW0 : X_LUT6
    generic map(
      INIT => X"FEFEFEFEFEFEFEFF"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(6),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(2),
      ADR2 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(5),
      ADR3 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_582,
      ADR4 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587,
      ADR5 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_588,
      O => N254
    );
  eUART_eUART_TRANSMITTER_sTC_CNT_2_rstpot_SW0 : X_LUT6
    generic map(
      INIT => X"FFFFFFFFEEEEEEEF"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(5),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(2),
      ADR2 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd1_608,
      ADR3 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd2_630,
      ADR4 => eUART_eUART_TRANSMITTER_sCURRENT_STATE_FSM_FFd3_629,
      ADR5 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(6),
      O => N256
    );
  eUART_eUART_RECIVER_sTC_CNT_2_rstpot : X_LUT6
    generic map(
      INIT => X"4CCC4CCC3CCC4CCC"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR4 => N182,
      ADR5 => N254,
      O => eUART_eUART_RECIVER_sTC_CNT_2_rstpot_785
    );
  eUART_eUART_TRANSMITTER_sTC_CNT_2_rstpot : X_LUT6
    generic map(
      INIT => X"2252AAAAAAAAAAAA"
    )
    port map (
      ADR0 => eUART_eUART_TRANSMITTER_sTC_CNT(2),
      ADR1 => eUART_eUART_TRANSMITTER_sTC_CNT(3),
      ADR2 => N182,
      ADR3 => N256,
      ADR4 => eUART_eUART_TRANSMITTER_sTC_CNT(1),
      ADR5 => eUART_eUART_TRANSMITTER_sTC_CNT(0),
      O => eUART_eUART_TRANSMITTER_sTC_CNT_2_rstpot_791
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_2_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(2),
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_2_rt_823,
      ADR1 => GND
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_5_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(5),
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_5_rt_824,
      ADR1 => GND
    );
  eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_6_rt : X_LUT2
    generic map(
      INIT => X"A"
    )
    port map (
      ADR0 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(6),
      O => eUART_eBAUD_FREQ_DIV_Mcount_sCLK_CNT_cy_6_rt_825,
      ADR1 => GND
    );
  eUART_eRECV_FIFO_sFIFO_1_2_rstpot1 : X_LUT3
    generic map(
      INIT => X"E2"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(2),
      ADR1 => eUART_eRECV_FIFO_n0261_inv,
      ADR2 => N231,
      O => eUART_eRECV_FIFO_sFIFO_1_2_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_1_0_rstpot1 : X_LUT3
    generic map(
      INIT => X"E2"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_1(0),
      ADR1 => eUART_eRECV_FIFO_n0261_inv,
      ADR2 => N233,
      O => eUART_eRECV_FIFO_sFIFO_1_0_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_3_3_rstpot1 : X_LUT3
    generic map(
      INIT => X"E2"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(3),
      ADR1 => eUART_eRECV_FIFO_n0249_inv,
      ADR2 => N235,
      O => eUART_eRECV_FIFO_sFIFO_3_3_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_3_2_rstpot1 : X_LUT3
    generic map(
      INIT => X"E2"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(2),
      ADR1 => eUART_eRECV_FIFO_n0249_inv,
      ADR2 => N237,
      O => eUART_eRECV_FIFO_sFIFO_3_2_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_3_1_rstpot1 : X_LUT3
    generic map(
      INIT => X"E2"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(1),
      ADR1 => eUART_eRECV_FIFO_n0249_inv,
      ADR2 => N239,
      O => eUART_eRECV_FIFO_sFIFO_3_1_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_3_0_rstpot1 : X_LUT3
    generic map(
      INIT => X"E2"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_sFIFO_3(0),
      ADR1 => eUART_eRECV_FIFO_n0249_inv,
      ADR2 => N241,
      O => eUART_eRECV_FIFO_sFIFO_3_0_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_0_7_rstpot1 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_n0267_inv,
      ADR1 => eUART_eRECV_FIFO_sFIFO_0(7),
      ADR2 => N243,
      O => eUART_eRECV_FIFO_sFIFO_0_7_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_0_5_rstpot1 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_n0267_inv,
      ADR1 => eUART_eRECV_FIFO_sFIFO_0(5),
      ADR2 => N245,
      O => eUART_eRECV_FIFO_sFIFO_0_5_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_0_3_rstpot1 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_n0267_inv,
      ADR1 => eUART_eRECV_FIFO_sFIFO_0(3),
      ADR2 => N247,
      O => eUART_eRECV_FIFO_sFIFO_0_3_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_0_2_rstpot1 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_n0267_inv,
      ADR1 => eUART_eRECV_FIFO_sFIFO_0(2),
      ADR2 => N249,
      O => eUART_eRECV_FIFO_sFIFO_0_2_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_0_1_rstpot1 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_n0267_inv,
      ADR1 => eUART_eRECV_FIFO_sFIFO_0(1),
      ADR2 => N251,
      O => eUART_eRECV_FIFO_sFIFO_0_1_rstpot
    );
  eUART_eRECV_FIFO_sFIFO_0_0_rstpot1 : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => eUART_eRECV_FIFO_n0267_inv,
      ADR1 => eUART_eRECV_FIFO_sFIFO_0(0),
      ADR2 => N253,
      O => eUART_eRECV_FIFO_sFIFO_0_0_rstpot
    );
  eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_1 : X_LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sTC_CNT_2_1_835,
      ADR1 => eUART_eUART_RECIVER_sTC_CNT_3_1_836,
      ADR2 => eUART_eUART_RECIVER_sTC_CNT_0_1_833,
      ADR3 => eUART_eUART_RECIVER_sTC_CNT_1_1_834,
      O => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_111_826
    );
  eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1 : X_LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR3 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR4 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR5 => N4,
      O => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_Q_827
    );
  eUART_eUART_RECIVER_n0074_inv1_rstpot : X_LUT5
    generic map(
      INIT => X"F4444444"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd3_582,
      ADR1 => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd2_587,
      ADR2 => eUART_eUART_RECIVER_sDATA_CNT(0),
      ADR3 => eUART_eUART_RECIVER_sDATA_CNT(1),
      ADR4 => eUART_eUART_RECIVER_sDATA_CNT(2),
      O => eUART_eUART_RECIVER_n0074_inv1_rstpot_828
    );
  eUART_eUART_RECIVER_n0074_inv1_cepot : X_LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(0),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(1),
      O => eUART_eUART_RECIVER_n0074_inv1_cepot_829
    );
  eUART_eUART_RECIVER_sDATA_CNT_0_dpot : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_n0074_inv1_rstpot_828,
      ADR1 => eUART_eUART_RECIVER_sDATA_CNT(0),
      ADR2 => eUART_eUART_RECIVER_Mcount_sDATA_CNT,
      O => eUART_eUART_RECIVER_sDATA_CNT_0_dpot_830
    );
  eUART_eUART_RECIVER_sDATA_CNT_1_dpot : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_n0074_inv1_rstpot_828,
      ADR1 => eUART_eUART_RECIVER_sDATA_CNT(1),
      ADR2 => eUART_eUART_RECIVER_Mcount_sDATA_CNT1,
      O => eUART_eUART_RECIVER_sDATA_CNT_1_dpot_831
    );
  eUART_eUART_RECIVER_sDATA_CNT_2_dpot : X_LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_n0074_inv1_rstpot_828,
      ADR1 => eUART_eUART_RECIVER_sDATA_CNT(2),
      ADR2 => eUART_eUART_RECIVER_Mcount_sDATA_CNT2,
      O => eUART_eUART_RECIVER_sDATA_CNT_2_dpot_832
    );
  eUART_eUART_RECIVER_sTC_CNT_0_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sTC_CNT_0_rstpot_787,
      O => eUART_eUART_RECIVER_sTC_CNT_0_1_833,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sTC_CNT_1_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sTC_CNT_1_rstpot_786,
      O => eUART_eUART_RECIVER_sTC_CNT_1_1_834,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sTC_CNT_2_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sTC_CNT_2_rstpot_785,
      O => eUART_eUART_RECIVER_sTC_CNT_2_1_835,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sTC_CNT_3_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sTC_CNT_3_rstpot_784,
      O => eUART_eUART_RECIVER_sTC_CNT_3_1_836,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2 : X_LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR3 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR4 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR5 => N4,
      O => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_1_837
    );
  eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3 : X_LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR3 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR4 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR5 => N4,
      O => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_2_838
    );
  eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4 : X_LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR3 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR4 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR5 => N4,
      O => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_3_839
    );
  eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5 : X_LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR3 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR4 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR5 => N4,
      O => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_4_840
    );
  eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_6 : X_LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sSHW_REG(3),
      ADR1 => eUART_eUART_RECIVER_sSHW_REG(2),
      ADR2 => eUART_eUART_RECIVER_sSHW_REG(1),
      ADR3 => eUART_eUART_RECIVER_sSHW_REG(0),
      ADR4 => eUART_eUART_RECIVER_sSHW_REG(5),
      ADR5 => N4,
      O => eUART_eUART_RECIVER_Mxor_sSHW_REG_0_sSHW_REG_7_XOR_19_o_xo_0_5_841
    );
  eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_1 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_In,
      O => eUART_eUART_RECIVER_sCURRENT_STATE_FSM_FFd1_1_842,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sTC_CNT_3_2 : X_FF
    generic map(
      INIT => '0'
    )
    port map (
      CLK => iCLK_BUFGP,
      RST => eUART_eRECV_FIFO_inRST_inv,
      I => eUART_eUART_RECIVER_sTC_CNT_3_rstpot_784,
      O => eUART_eUART_RECIVER_sTC_CNT_3_2_843,
      CE => VCC,
      SET => GND
    );
  eUART_eUART_RECIVER_sTC_CNT_3_rstpot : X_MUX2
    port map (
      IA => N258,
      IB => N259,
      SEL => eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_3_11,
      O => eUART_eUART_RECIVER_sTC_CNT_3_rstpot_784
    );
  eUART_eUART_RECIVER_sTC_CNT_3_rstpot_F : X_LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR1 => eUART_eUART_RECIVER_sTC_CNT(2),
      ADR2 => eUART_eUART_RECIVER_sTC_CNT(1),
      ADR3 => eUART_eUART_RECIVER_sTC_CNT(0),
      O => N258
    );
  eUART_eUART_RECIVER_sTC_CNT_3_rstpot_G : X_LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA9AA"
    )
    port map (
      ADR0 => eUART_eUART_RECIVER_sTC_CNT(3),
      ADR1 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(6),
      ADR2 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(5),
      ADR3 => N182,
      ADR4 => eUART_eBAUD_FREQ_DIV_sCLK_CNT(2),
      ADR5 => N207,
      O => N259
    );
  inRST_inv1_INV_0 : X_INV
    port map (
      I => inRST_IBUF_4,
      O => eUART_eRECV_FIFO_inRST_inv
    );
  eUART_eRECV_FIFO_Result_0_1_INV_0 : X_INV
    port map (
      I => eUART_eRECV_FIFO_sWR_PTR(0),
      O => eUART_eRECV_FIFO_Result(0)
    );
  eUART_eSEND_FIFO_Result_0_1_INV_0 : X_INV
    port map (
      I => eUART_eSEND_FIFO_sWR_PTR(0),
      O => eUART_eSEND_FIFO_Result(0)
    );
  eUART_eUART_RECIVER_Mcount_sDATA_CNT_xor_0_11_INV_0 : X_INV
    port map (
      I => eUART_eUART_RECIVER_sDATA_CNT(0),
      O => eUART_eUART_RECIVER_Mcount_sDATA_CNT
    );
  iCLK_BUFGP_BUFG : X_CKBUF
    port map (
      I => iCLK_BUFGP_IBUFG_2,
      O => iCLK_BUFGP
    );
  iCLK_BUFGP_IBUFG : X_CKBUF
    port map (
      I => iCLK,
      O => iCLK_BUFGP_IBUFG_2
    );
  oLED_DATA_7_OBUF : X_OBUF
    port map (
      I => sRECV_DATA_REG(7),
      O => oLED_DATA(7)
    );
  oLED_DATA_6_OBUF : X_OBUF
    port map (
      I => sRECV_DATA_REG(6),
      O => oLED_DATA(6)
    );
  oLED_DATA_5_OBUF : X_OBUF
    port map (
      I => sRECV_DATA_REG(5),
      O => oLED_DATA(5)
    );
  oLED_DATA_4_OBUF : X_OBUF
    port map (
      I => sRECV_DATA_REG(4),
      O => oLED_DATA(4)
    );
  oLED_DATA_3_OBUF : X_OBUF
    port map (
      I => sRECV_DATA_REG(3),
      O => oLED_DATA(3)
    );
  oLED_DATA_2_OBUF : X_OBUF
    port map (
      I => sRECV_DATA_REG(2),
      O => oLED_DATA(2)
    );
  oLED_DATA_1_OBUF : X_OBUF
    port map (
      I => sRECV_DATA_REG(1),
      O => oLED_DATA(1)
    );
  oLED_DATA_0_OBUF : X_OBUF
    port map (
      I => sRECV_DATA_REG(0),
      O => oLED_DATA(0)
    );
  oTX_OBUF : X_OBUF
    port map (
      I => oTX_OBUF_14,
      O => oTX
    );
  NlwBlock_uart_verification_return_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlock_uart_verification_return_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

