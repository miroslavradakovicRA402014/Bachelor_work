/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/rtrk/Workspace/BSc_workspace/Bachelor_work/I2C_Emulation_Via_Serial/i2c_via_uart_tb.vhd";



static void work_a_3194606462_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3904U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 4536);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3712);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 4536);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3712);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_3194606462_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int64 t10;
    int64 t11;

LAB0:    t1 = (t0 + 4152U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(109, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 8376);
    t5 = (t0 + 4600);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 3U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 4664);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 4728);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 4792);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 8379);
    t5 = (t0 + 4856);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 2U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 100);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 4920);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 170);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(133, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 170);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(137, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(141, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_set_current_line(153, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

LAB40:    xsi_set_current_line(161, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 170);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB46:    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_set_current_line(166, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(168, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 170);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB45:    goto LAB44;

LAB47:    goto LAB45;

LAB48:    xsi_set_current_line(171, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(173, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 100);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

LAB52:    xsi_set_current_line(178, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(180, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 170);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB58:    *((char **)t1) = &&LAB59;
    goto LAB1;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

LAB56:    xsi_set_current_line(185, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(187, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 170);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB62:    *((char **)t1) = &&LAB63;
    goto LAB1;

LAB57:    goto LAB56;

LAB59:    goto LAB57;

LAB60:    xsi_set_current_line(189, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(191, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB66:    *((char **)t1) = &&LAB67;
    goto LAB1;

LAB61:    goto LAB60;

LAB63:    goto LAB61;

LAB64:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(195, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB70:    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB65:    goto LAB64;

LAB67:    goto LAB65;

LAB68:    xsi_set_current_line(197, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(199, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB74:    *((char **)t1) = &&LAB75;
    goto LAB1;

LAB69:    goto LAB68;

LAB71:    goto LAB69;

LAB72:    xsi_set_current_line(201, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(203, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB78:    *((char **)t1) = &&LAB79;
    goto LAB1;

LAB73:    goto LAB72;

LAB75:    goto LAB73;

LAB76:    xsi_set_current_line(205, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(207, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB82:    *((char **)t1) = &&LAB83;
    goto LAB1;

LAB77:    goto LAB76;

LAB79:    goto LAB77;

LAB80:    xsi_set_current_line(209, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(211, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 160);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB86:    *((char **)t1) = &&LAB87;
    goto LAB1;

LAB81:    goto LAB80;

LAB83:    goto LAB81;

LAB84:    xsi_set_current_line(213, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(215, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 170);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB90:    *((char **)t1) = &&LAB91;
    goto LAB1;

LAB85:    goto LAB84;

LAB87:    goto LAB85;

LAB88:    xsi_set_current_line(218, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(220, ng0);
    t2 = (t0 + 2928U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 16);
    t11 = (t10 * 170);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t11);

LAB94:    *((char **)t1) = &&LAB95;
    goto LAB1;

LAB89:    goto LAB88;

LAB91:    goto LAB89;

LAB92:    xsi_set_current_line(223, ng0);
    t2 = (t0 + 4984);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(225, ng0);

LAB98:    *((char **)t1) = &&LAB99;
    goto LAB1;

LAB93:    goto LAB92;

LAB95:    goto LAB93;

LAB96:    goto LAB2;

LAB97:    goto LAB96;

LAB99:    goto LAB97;

}


extern void work_a_3194606462_2372691052_init()
{
	static char *pe[] = {(void *)work_a_3194606462_2372691052_p_0,(void *)work_a_3194606462_2372691052_p_1};
	xsi_register_didat("work_a_3194606462_2372691052", "isim/i2c_via_uart_tb_isim_beh.exe.sim/work/a_3194606462_2372691052.didat");
	xsi_register_executes(pe);
}
