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
    int t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 == 0);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t9 = (t0 + 3552);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 3460);
    *((int *)t14) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 3552);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3522877208_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 == 16);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t9 = (t0 + 3588);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 3468);
    *((int *)t14) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 3588);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3522877208_3212880686_p_2(char *t0)
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
    int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(74, ng0);
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
LAB3:    t1 = (t0 + 3476);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(75, ng0);
    t5 = (16 - 1);
    t1 = (t0 + 6650);
    *((int *)t1) = 0;
    t6 = (t0 + 6654);
    *((int *)t6) = t5;
    t7 = 0;
    t8 = t5;

LAB5:    if (t7 <= t8)
        goto LAB6;

LAB8:    goto LAB3;

LAB6:    xsi_set_current_line(76, ng0);
    t9 = xsi_get_transient_memory(8U);
    memset(t9, 0, 8U);
    t10 = t9;
    memset(t10, (unsigned char)2, 8U);
    t11 = (t0 + 6650);
    t12 = *((int *)t11);
    t13 = (t12 - 15);
    t14 = (t13 * -1);
    t15 = (8U * t14);
    t16 = (0U + t15);
    t17 = (t0 + 3624);
    t18 = (t17 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    memcpy(t21, t9, 8U);
    xsi_driver_first_trans_delta(t17, t16, 8U, 0LL);

LAB7:    t1 = (t0 + 6650);
    t7 = *((int *)t1);
    t2 = (t0 + 6654);
    t8 = *((int *)t2);
    if (t7 == t8)
        goto LAB8;

LAB9:    t5 = (t7 + 1);
    t7 = t5;
    t6 = (t0 + 6650);
    *((int *)t6) = t7;
    goto LAB5;

LAB10:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 868U);
    t9 = *((char **)t2);
    t25 = *((unsigned char *)t9);
    t26 = (t25 == (unsigned char)3);
    if (t26 == 1)
        goto LAB18;

LAB19:    t24 = (unsigned char)0;

LAB20:    if (t24 != 0)
        goto LAB15;

LAB17:    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t22 = (t4 == (unsigned char)3);
    if (t22 == 1)
        goto LAB23;

LAB24:    t3 = (unsigned char)0;

LAB25:    if (t3 != 0)
        goto LAB21;

LAB22:
LAB16:    goto LAB3;

LAB12:    t2 = (t0 + 592U);
    t6 = *((char **)t2);
    t22 = *((unsigned char *)t6);
    t23 = (t22 == (unsigned char)3);
    t3 = t23;
    goto LAB14;

LAB15:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 776U);
    t11 = *((char **)t2);
    t2 = (t0 + 1420U);
    t17 = *((char **)t2);
    t5 = *((int *)t17);
    t7 = (t5 - 15);
    t14 = (t7 * -1);
    t15 = (8U * t14);
    t16 = (0U + t15);
    t2 = (t0 + 3624);
    t18 = (t2 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    memcpy(t21, t11, 8U);
    xsi_driver_first_trans_delta(t2, t16, 8U, 0LL);
    goto LAB16;

LAB18:    t2 = (t0 + 1604U);
    t10 = *((char **)t2);
    t27 = *((unsigned char *)t10);
    t28 = (t27 == (unsigned char)2);
    t24 = t28;
    goto LAB20;

LAB21:    xsi_set_current_line(82, ng0);
    t5 = (16 - 2);
    t1 = (t0 + 6658);
    *((int *)t1) = 0;
    t9 = (t0 + 6662);
    *((int *)t9) = t5;
    t7 = 0;
    t8 = t5;

LAB26:    if (t7 <= t8)
        goto LAB27;

LAB29:    goto LAB16;

LAB23:    t1 = (t0 + 1512U);
    t6 = *((char **)t1);
    t23 = *((unsigned char *)t6);
    t24 = (t23 == (unsigned char)2);
    t3 = t24;
    goto LAB25;

LAB27:    xsi_set_current_line(83, ng0);
    t10 = (t0 + 1328U);
    t11 = *((char **)t10);
    t10 = (t0 + 6658);
    t12 = *((int *)t10);
    t13 = (t12 + 1);
    t29 = (t13 - 15);
    t14 = (t29 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t13);
    t15 = (8U * t14);
    t16 = (0 + t15);
    t17 = (t11 + t16);
    t18 = (t0 + 6658);
    t30 = *((int *)t18);
    t31 = (t30 - 15);
    t32 = (t31 * -1);
    t33 = (8U * t32);
    t34 = (0U + t33);
    t19 = (t0 + 3624);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t35 = (t21 + 40U);
    t36 = *((char **)t35);
    memcpy(t36, t17, 8U);
    xsi_driver_first_trans_delta(t19, t34, 8U, 0LL);

LAB28:    t1 = (t0 + 6658);
    t7 = *((int *)t1);
    t2 = (t0 + 6662);
    t8 = *((int *)t2);
    if (t7 == t8)
        goto LAB29;

LAB30:    t5 = (t7 + 1);
    t7 = t5;
    t6 = (t0 + 6658);
    *((int *)t6) = t7;
    goto LAB26;

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

LAB0:    xsi_set_current_line(91, ng0);
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
LAB3:    t1 = (t0 + 3484);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 3660);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(94, ng0);
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
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 592U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

LAB10:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1420U);
    t8 = *((char **)t2);
    t16 = *((int *)t8);
    t17 = (t16 + 1);
    t2 = (t0 + 3660);
    t18 = (t2 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    *((int *)t21) = t17;
    xsi_driver_first_trans_fast(t2);
    goto LAB11;

LAB13:    t2 = (t0 + 1604U);
    t7 = *((char **)t2);
    t14 = *((unsigned char *)t7);
    t15 = (t14 == (unsigned char)2);
    t11 = t15;
    goto LAB15;

LAB16:    xsi_set_current_line(97, ng0);
    t1 = (t0 + 1420U);
    t6 = *((char **)t1);
    t16 = *((int *)t6);
    t17 = (t16 - 1);
    t1 = (t0 + 3660);
    t7 = (t1 + 32U);
    t8 = *((char **)t7);
    t18 = (t8 + 40U);
    t19 = *((char **)t18);
    *((int *)t19) = t17;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB18:    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)2);
    t3 = t11;
    goto LAB20;

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

LAB0:    xsi_set_current_line(103, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3696);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3492);
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

LAB0:    xsi_set_current_line(104, ng0);

LAB3:    t1 = (t0 + 1604U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3732);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3500);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3522877208_3212880686_p_6(char *t0)
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
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
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

LAB0:    xsi_set_current_line(107, ng0);
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
LAB8:    t19 = xsi_get_transient_memory(8U);
    memset(t19, 0, 8U);
    t20 = t19;
    memset(t20, (unsigned char)4, 8U);
    t21 = (t0 + 3768);
    t22 = (t21 + 32U);
    t23 = *((char **)t22);
    t24 = (t23 + 40U);
    t25 = *((char **)t24);
    memcpy(t25, t19, 8U);
    xsi_driver_first_trans_fast_port(t21);

LAB2:    t26 = (t0 + 3508);
    *((int *)t26) = 1;

LAB1:    return;
LAB3:    t2 = (t0 + 1328U);
    t9 = *((char **)t2);
    t10 = (0 - 15);
    t11 = (t10 * -1);
    t12 = (8U * t11);
    t13 = (0 + t12);
    t2 = (t9 + t13);
    t14 = (t0 + 3768);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 8U);
    xsi_driver_first_trans_fast_port(t14);
    goto LAB2;

LAB5:    t2 = (t0 + 1512U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB7;

LAB9:    goto LAB2;

}


extern void work_a_3522877208_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3522877208_3212880686_p_0,(void *)work_a_3522877208_3212880686_p_1,(void *)work_a_3522877208_3212880686_p_2,(void *)work_a_3522877208_3212880686_p_3,(void *)work_a_3522877208_3212880686_p_4,(void *)work_a_3522877208_3212880686_p_5,(void *)work_a_3522877208_3212880686_p_6};
	xsi_register_didat("work_a_3522877208_3212880686", "isim/fifo_tb_isim_beh.exe.sim/work/a_3522877208_3212880686.didat");
	xsi_register_executes(pe);
}
