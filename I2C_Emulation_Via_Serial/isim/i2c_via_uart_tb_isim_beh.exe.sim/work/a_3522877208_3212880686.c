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

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/BSc_workspace/Bachelor_work/UART_communication/fifo.vhd";



static void work_a_3522877208_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    int t5;
    char *t6;
    int t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned char t22;
    unsigned char t23;
    unsigned char t24;
    unsigned char t25;
    unsigned char t26;
    unsigned char t27;
    unsigned char t28;
    unsigned char t29;
    unsigned char t30;
    char *t31;

LAB0:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 568U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB12;

LAB13:    t3 = (unsigned char)0;

LAB14:    if (t3 != 0)
        goto LAB10;

LAB11:
LAB3:    t1 = (t0 + 3408);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(60, ng0);
    t5 = (16 - 1);
    t1 = (t0 + 6798);
    *((int *)t1) = 0;
    t6 = (t0 + 6802);
    *((int *)t6) = t5;
    t7 = 0;
    t8 = t5;

LAB5:    if (t7 <= t8)
        goto LAB6;

LAB8:    goto LAB3;

LAB6:    xsi_set_current_line(61, ng0);
    t9 = xsi_get_transient_memory(8U);
    memset(t9, 0, 8U);
    t10 = t9;
    memset(t10, (unsigned char)2, 8U);
    t11 = (t0 + 6798);
    t12 = *((int *)t11);
    t13 = (t12 - 15);
    t14 = (t13 * -1);
    t15 = (8U * t14);
    t16 = (0U + t15);
    t17 = (t0 + 3492);
    t18 = (t17 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    memcpy(t21, t9, 8U);
    xsi_driver_first_trans_delta(t17, t16, 8U, 0LL);

LAB7:    t1 = (t0 + 6798);
    t7 = *((int *)t1);
    t2 = (t0 + 6802);
    t8 = *((int *)t2);
    if (t7 == t8)
        goto LAB8;

LAB9:    t5 = (t7 + 1);
    t7 = t5;
    t6 = (t0 + 6798);
    *((int *)t6) = t7;
    goto LAB5;

LAB10:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 868U);
    t9 = *((char **)t2);
    t26 = *((unsigned char *)t9);
    t27 = (t26 == (unsigned char)3);
    if (t27 == 1)
        goto LAB21;

LAB22:    t25 = (unsigned char)0;

LAB23:    if (t25 == 1)
        goto LAB18;

LAB19:    t24 = (unsigned char)0;

LAB20:    if (t24 != 0)
        goto LAB15;

LAB17:
LAB16:    goto LAB3;

LAB12:    t2 = (t0 + 592U);
    t6 = *((char **)t2);
    t22 = *((unsigned char *)t6);
    t23 = (t22 == (unsigned char)3);
    t3 = t23;
    goto LAB14;

LAB15:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 776U);
    t17 = *((char **)t2);
    t2 = (t0 + 1420U);
    t18 = *((char **)t2);
    t7 = *((int *)t18);
    t8 = (t7 - 15);
    t14 = (t8 * -1);
    t15 = (8U * t14);
    t16 = (0U + t15);
    t2 = (t0 + 3492);
    t19 = (t2 + 32U);
    t20 = *((char **)t19);
    t21 = (t20 + 40U);
    t31 = *((char **)t21);
    memcpy(t31, t17, 8U);
    xsi_driver_first_trans_delta(t2, t16, 8U, 0LL);
    goto LAB16;

LAB18:    t2 = (t0 + 1420U);
    t11 = *((char **)t2);
    t5 = *((int *)t11);
    t30 = (t5 != 16);
    t24 = t30;
    goto LAB20;

LAB21:    t2 = (t0 + 1696U);
    t10 = *((char **)t2);
    t28 = *((unsigned char *)t10);
    t29 = (t28 == (unsigned char)2);
    t25 = t29;
    goto LAB23;

}

static void work_a_3522877208_3212880686_p_1(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    int t11;
    unsigned char t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 960U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB11:    t25 = xsi_get_transient_memory(8U);
    memset(t25, 0, 8U);
    t26 = t25;
    memset(t26, (unsigned char)4, 8U);
    t27 = (t0 + 3528);
    t28 = (t27 + 32U);
    t29 = *((char **)t28);
    t30 = (t29 + 40U);
    t31 = *((char **)t30);
    memcpy(t31, t25, 8U);
    xsi_driver_first_trans_fast_port(t27);

LAB2:    t32 = (t0 + 3416);
    *((int *)t32) = 1;

LAB1:    return;
LAB3:    t3 = (t0 + 1328U);
    t13 = *((char **)t3);
    t3 = (t0 + 1512U);
    t14 = *((char **)t3);
    t15 = *((int *)t14);
    t16 = (t15 - 15);
    t17 = (t16 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t15);
    t18 = (8U * t17);
    t19 = (0 + t18);
    t3 = (t13 + t19);
    t20 = (t0 + 3528);
    t21 = (t20 + 32U);
    t22 = *((char **)t21);
    t23 = (t22 + 40U);
    t24 = *((char **)t23);
    memcpy(t24, t3, 8U);
    xsi_driver_first_trans_fast_port(t20);
    goto LAB2;

LAB5:    t3 = (t0 + 1512U);
    t10 = *((char **)t3);
    t11 = *((int *)t10);
    t12 = (t11 != 16);
    t1 = t12;
    goto LAB7;

LAB8:    t3 = (t0 + 1604U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t2 = t9;
    goto LAB10;

LAB12:    goto LAB2;

}

static void work_a_3522877208_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    int t15;
    int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 568U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3424);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 3564);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 3600);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 868U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t12 = (t11 == (unsigned char)3);
    if (t12 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB16;

LAB17:
LAB11:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t15 = *((int *)t2);
    t3 = (t15 == 16);
    if (t3 != 0)
        goto LAB21;

LAB23:
LAB22:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t15 = *((int *)t2);
    t3 = (t15 == 16);
    if (t3 != 0)
        goto LAB24;

LAB26:
LAB25:    goto LAB3;

LAB7:    t2 = (t0 + 592U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1696U);
    t7 = *((char **)t2);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)2);
    if (t14 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1420U);
    t8 = *((char **)t2);
    t15 = *((int *)t8);
    t16 = (t15 + 1);
    t2 = (t0 + 3564);
    t17 = (t2 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    *((int *)t20) = t16;
    xsi_driver_first_trans_fast(t2);
    goto LAB14;

LAB16:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 1604U);
    t5 = *((char **)t1);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)2);
    if (t10 != 0)
        goto LAB18;

LAB20:
LAB19:    goto LAB11;

LAB18:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 1512U);
    t6 = *((char **)t1);
    t15 = *((int *)t6);
    t16 = (t15 + 1);
    t1 = (t0 + 3600);
    t7 = (t1 + 32U);
    t8 = *((char **)t7);
    t17 = (t8 + 40U);
    t18 = *((char **)t17);
    *((int *)t18) = t16;
    xsi_driver_first_trans_fast(t1);
    goto LAB19;

LAB21:    xsi_set_current_line(91, ng0);
    t1 = (t0 + 3564);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB22;

LAB24:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 3600);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB25;

}

static void work_a_3522877208_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    int t13;
    int t14;
    unsigned char t15;
    unsigned char t16;
    int t17;
    unsigned char t18;
    char *t19;
    int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(102, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 568U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3432);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 3636);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 3672);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 868U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t12 = (t11 == (unsigned char)3);
    if (t12 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB25;

LAB26:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 592U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 1420U);
    t7 = *((char **)t2);
    t13 = *((int *)t7);
    t14 = (16 - 1);
    t15 = (t13 == t14);
    if (t15 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t13 = *((int *)t2);
    t1 = (t0 + 1420U);
    t5 = *((char **)t1);
    t14 = *((int *)t5);
    t17 = (t14 + 1);
    t3 = (t13 == t17);
    if (t3 != 0)
        goto LAB22;

LAB24:
LAB23:
LAB14:    xsi_set_current_line(117, ng0);
    t1 = (t0 + 3636);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB13:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 1512U);
    t8 = *((char **)t2);
    t17 = *((int *)t8);
    t18 = (t17 == 0);
    if (t18 == 1)
        goto LAB19;

LAB20:    t2 = (t0 + 1512U);
    t19 = *((char **)t2);
    t20 = *((int *)t19);
    t21 = (t20 == 16);
    t16 = t21;

LAB21:    if (t16 != 0)
        goto LAB16;

LAB18:
LAB17:    goto LAB14;

LAB16:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 3672);
    t22 = (t2 + 32U);
    t23 = *((char **)t22);
    t24 = (t23 + 40U);
    t25 = *((char **)t24);
    *((unsigned char *)t25) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB17;

LAB19:    t16 = (unsigned char)1;
    goto LAB21;

LAB22:    xsi_set_current_line(114, ng0);
    t1 = (t0 + 3672);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t19 = *((char **)t8);
    *((unsigned char *)t19) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB23;

LAB25:    xsi_set_current_line(120, ng0);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t13 = *((int *)t5);
    t14 = (16 - 1);
    t9 = (t13 == t14);
    if (t9 != 0)
        goto LAB27;

LAB29:    xsi_set_current_line(125, ng0);
    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t13 = *((int *)t2);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t14 = *((int *)t5);
    t17 = (t14 + 1);
    t3 = (t13 == t17);
    if (t3 != 0)
        goto LAB36;

LAB38:
LAB37:
LAB28:    xsi_set_current_line(129, ng0);
    t1 = (t0 + 3672);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB27:    xsi_set_current_line(121, ng0);
    t1 = (t0 + 1420U);
    t6 = *((char **)t1);
    t17 = *((int *)t6);
    t11 = (t17 == 0);
    if (t11 == 1)
        goto LAB33;

LAB34:    t1 = (t0 + 1420U);
    t7 = *((char **)t1);
    t20 = *((int *)t7);
    t12 = (t20 == 16);
    t10 = t12;

LAB35:    if (t10 != 0)
        goto LAB30;

LAB32:
LAB31:    goto LAB28;

LAB30:    xsi_set_current_line(122, ng0);
    t1 = (t0 + 3636);
    t8 = (t1 + 32U);
    t19 = *((char **)t8);
    t22 = (t19 + 40U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB31;

LAB33:    t10 = (unsigned char)1;
    goto LAB35;

LAB36:    xsi_set_current_line(126, ng0);
    t1 = (t0 + 3636);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t19 = *((char **)t8);
    *((unsigned char *)t19) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB37;

}

static void work_a_3522877208_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(135, ng0);

LAB3:    t1 = (t0 + 1604U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3708);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3440);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3522877208_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(136, ng0);

LAB3:    t1 = (t0 + 1696U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3744);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3448);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3522877208_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3522877208_3212880686_p_0,(void *)work_a_3522877208_3212880686_p_1,(void *)work_a_3522877208_3212880686_p_2,(void *)work_a_3522877208_3212880686_p_3,(void *)work_a_3522877208_3212880686_p_4,(void *)work_a_3522877208_3212880686_p_5};
	xsi_register_didat("work_a_3522877208_3212880686", "isim/i2c_via_uart_tb_isim_beh.exe.sim/work/a_3522877208_3212880686.didat");
	xsi_register_executes(pe);
}

extern void work_a_1156261981_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3522877208_3212880686_p_0,(void *)work_a_3522877208_3212880686_p_1,(void *)work_a_3522877208_3212880686_p_2,(void *)work_a_3522877208_3212880686_p_3,(void *)work_a_3522877208_3212880686_p_4,(void *)work_a_3522877208_3212880686_p_5};
	xsi_register_didat("work_a_1156261981_3212880686", "isim/i2c_via_uart_tb_isim_beh.exe.sim/work/a_1156261981_3212880686.didat");
	xsi_register_executes(pe);
}
