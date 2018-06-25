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
extern char *IEEE_P_3499444699;

char *ieee_p_3499444699_sub_2213602152_3536714472(char *, char *, int , int );


static void work_a_3522877208_3212880686_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(58, ng0);

LAB3:    t2 = (t0 + 1604U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t1, t4, 4);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t6 = (t6 * 1U);
    t7 = (4U != t6);
    if (t7 == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 3736);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 4U);
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 3644);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(4U, t6, 0);
    goto LAB6;

}

static void work_a_3522877208_3212880686_p_1(char *t0)
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

LAB0:    xsi_set_current_line(63, ng0);
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
LAB3:    t1 = (t0 + 3652);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(64, ng0);
    t5 = (16 - 1);
    t1 = (t0 + 7218);
    *((int *)t1) = 0;
    t6 = (t0 + 7222);
    *((int *)t6) = t5;
    t7 = 0;
    t8 = t5;

LAB5:    if (t7 <= t8)
        goto LAB6;

LAB8:    goto LAB3;

LAB6:    xsi_set_current_line(65, ng0);
    t9 = xsi_get_transient_memory(8U);
    memset(t9, 0, 8U);
    t10 = t9;
    memset(t10, (unsigned char)2, 8U);
    t11 = (t0 + 7218);
    t12 = *((int *)t11);
    t13 = (t12 - 15);
    t14 = (t13 * -1);
    t15 = (8U * t14);
    t16 = (0U + t15);
    t17 = (t0 + 3772);
    t18 = (t17 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    memcpy(t21, t9, 8U);
    xsi_driver_first_trans_delta(t17, t16, 8U, 0LL);

LAB7:    t1 = (t0 + 7218);
    t7 = *((int *)t1);
    t2 = (t0 + 7222);
    t8 = *((int *)t2);
    if (t7 == t8)
        goto LAB8;

LAB9:    t5 = (t7 + 1);
    t7 = t5;
    t6 = (t0 + 7218);
    *((int *)t6) = t7;
    goto LAB5;

LAB10:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 868U);
    t9 = *((char **)t2);
    t25 = *((unsigned char *)t9);
    t26 = (t25 == (unsigned char)3);
    if (t26 == 1)
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

LAB15:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 776U);
    t11 = *((char **)t2);
    t2 = (t0 + 1512U);
    t17 = *((char **)t2);
    t5 = *((int *)t17);
    t7 = (t5 - 15);
    t14 = (t7 * -1);
    t15 = (8U * t14);
    t16 = (0U + t15);
    t2 = (t0 + 3772);
    t18 = (t2 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    memcpy(t21, t11, 8U);
    xsi_driver_first_trans_delta(t2, t16, 8U, 0LL);
    goto LAB16;

LAB18:    t2 = (t0 + 1788U);
    t10 = *((char **)t2);
    t27 = *((unsigned char *)t10);
    t28 = (t27 == (unsigned char)2);
    t24 = t28;
    goto LAB20;

}

static void work_a_3522877208_3212880686_p_2(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 960U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t21 = xsi_get_transient_memory(8U);
    memset(t21, 0, 8U);
    t22 = t21;
    memset(t22, (unsigned char)4, 8U);
    t23 = (t0 + 3808);
    t24 = (t23 + 32U);
    t25 = *((char **)t24);
    t26 = (t25 + 40U);
    t27 = *((char **)t26);
    memcpy(t27, t21, 8U);
    xsi_driver_first_trans_fast_port(t23);

LAB2:    t28 = (t0 + 3660);
    *((int *)t28) = 1;

LAB1:    return;
LAB3:    t2 = (t0 + 1420U);
    t9 = *((char **)t2);
    t2 = (t0 + 1604U);
    t10 = *((char **)t2);
    t11 = *((int *)t10);
    t12 = (t11 - 15);
    t13 = (t12 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t11);
    t14 = (8U * t13);
    t15 = (0 + t14);
    t2 = (t9 + t15);
    t16 = (t0 + 3808);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    memcpy(t20, t2, 8U);
    xsi_driver_first_trans_fast_port(t16);
    goto LAB2;

LAB5:    t2 = (t0 + 1696U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB7;

LAB9:    goto LAB2;

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
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    int t16;
    int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(80, ng0);
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
LAB3:    t1 = (t0 + 3668);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 3844);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 3880);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 868U);
    t6 = *((char **)t2);
    t12 = *((unsigned char *)t6);
    t13 = (t12 == (unsigned char)3);
    if (t13 == 1)
        goto LAB13;

LAB14:    t11 = (unsigned char)0;

LAB15:    if (t11 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t9 = (t4 == (unsigned char)3);
    if (t9 == 1)
        goto LAB18;

LAB19:    t3 = (unsigned char)0;

LAB20:    if (t3 != 0)
        goto LAB16;

LAB17:
LAB11:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t3 = (t16 == 16);
    if (t3 != 0)
        goto LAB21;

LAB23:
LAB22:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 1604U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t3 = (t16 == 16);
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

LAB10:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 1512U);
    t8 = *((char **)t2);
    t16 = *((int *)t8);
    t17 = (t16 + 1);
    t2 = (t0 + 3844);
    t18 = (t2 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    *((int *)t21) = t17;
    xsi_driver_first_trans_fast(t2);
    goto LAB11;

LAB13:    t2 = (t0 + 1788U);
    t7 = *((char **)t2);
    t14 = *((unsigned char *)t7);
    t15 = (t14 == (unsigned char)2);
    t11 = t15;
    goto LAB15;

LAB16:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 1604U);
    t6 = *((char **)t1);
    t16 = *((int *)t6);
    t17 = (t16 + 1);
    t1 = (t0 + 3880);
    t7 = (t1 + 32U);
    t8 = *((char **)t7);
    t18 = (t8 + 40U);
    t19 = *((char **)t18);
    *((int *)t19) = t17;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB18:    t1 = (t0 + 1696U);
    t5 = *((char **)t1);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)2);
    t3 = t11;
    goto LAB20;

LAB21:    xsi_set_current_line(91, ng0);
    t1 = (t0 + 3844);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB22;

LAB24:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 3880);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB25;

}

static void work_a_3522877208_3212880686_p_4(char *t0)
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
    int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

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
LAB3:    t1 = (t0 + 3676);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 3916);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 3952);
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
        goto LAB22;

LAB23:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 592U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 1512U);
    t7 = *((char **)t2);
    t13 = *((int *)t7);
    t14 = (16 - 1);
    t15 = (t13 == t14);
    if (t15 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 1604U);
    t2 = *((char **)t1);
    t13 = *((int *)t2);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t14 = *((int *)t5);
    t16 = (t14 + 1);
    t3 = (t13 == t16);
    if (t3 != 0)
        goto LAB19;

LAB21:
LAB20:
LAB14:    xsi_set_current_line(117, ng0);
    t1 = (t0 + 3916);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB13:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 1604U);
    t8 = *((char **)t2);
    t16 = *((int *)t8);
    t17 = (t16 == 0);
    if (t17 != 0)
        goto LAB16;

LAB18:
LAB17:    goto LAB14;

LAB16:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 3952);
    t18 = (t2 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB17;

LAB19:    xsi_set_current_line(114, ng0);
    t1 = (t0 + 3952);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t18 = *((char **)t8);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB20;

LAB22:    xsi_set_current_line(120, ng0);
    t1 = (t0 + 1604U);
    t5 = *((char **)t1);
    t13 = *((int *)t5);
    t14 = (16 - 1);
    t9 = (t13 == t14);
    if (t9 != 0)
        goto LAB24;

LAB26:    xsi_set_current_line(125, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t13 = *((int *)t2);
    t1 = (t0 + 1604U);
    t5 = *((char **)t1);
    t14 = *((int *)t5);
    t16 = (t14 + 1);
    t3 = (t13 == t16);
    if (t3 != 0)
        goto LAB30;

LAB32:
LAB31:
LAB25:    xsi_set_current_line(129, ng0);
    t1 = (t0 + 3952);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB24:    xsi_set_current_line(121, ng0);
    t1 = (t0 + 1512U);
    t6 = *((char **)t1);
    t16 = *((int *)t6);
    t10 = (t16 == 0);
    if (t10 != 0)
        goto LAB27;

LAB29:
LAB28:    goto LAB25;

LAB27:    xsi_set_current_line(122, ng0);
    t1 = (t0 + 3916);
    t7 = (t1 + 32U);
    t8 = *((char **)t7);
    t18 = (t8 + 40U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB28;

LAB30:    xsi_set_current_line(126, ng0);
    t1 = (t0 + 3916);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t18 = *((char **)t8);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB31;

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

LAB0:    xsi_set_current_line(135, ng0);

LAB3:    t1 = (t0 + 1696U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3988);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3684);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3522877208_3212880686_p_6(char *t0)
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

LAB3:    t1 = (t0 + 1788U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4024);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3692);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3522877208_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3522877208_3212880686_p_0,(void *)work_a_3522877208_3212880686_p_1,(void *)work_a_3522877208_3212880686_p_2,(void *)work_a_3522877208_3212880686_p_3,(void *)work_a_3522877208_3212880686_p_4,(void *)work_a_3522877208_3212880686_p_5,(void *)work_a_3522877208_3212880686_p_6};
	xsi_register_didat("work_a_3522877208_3212880686", "isim/fifo_tb_isim_beh.exe.sim/work/a_3522877208_3212880686.didat");
	xsi_register_executes(pe);
}
