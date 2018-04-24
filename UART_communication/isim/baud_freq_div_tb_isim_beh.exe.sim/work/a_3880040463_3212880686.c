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
static const char *ng0 = "D:/BSc_workspace/Bachelor_work/UART_communication/baud_freq_div.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919437128_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_2110375371_1035706684(char *, char *, char *, char *, char *);


static void work_a_3880040463_3212880686_p_0(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;

LAB0:    xsi_set_current_line(60, ng0);
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
LAB3:    t1 = (t0 + 2932);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(61, ng0);
    t1 = xsi_get_transient_memory(9U);
    memset(t1, 0, 9U);
    t5 = t1;
    memset(t5, (unsigned char)2, 9U);
    t6 = (t0 + 3000);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 9U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1052U);
    t6 = *((char **)t2);
    t2 = (t0 + 5620U);
    t7 = (t0 + 1236U);
    t8 = *((char **)t7);
    t7 = (t0 + 5652U);
    t9 = ieee_p_1242562249_sub_1919437128_1035706684(IEEE_P_1242562249, t13, t8, t7, 1);
    t14 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t6, t2, t9, t13);
    if (t14 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 5620U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t13, t2, t1, 1);
    t6 = (t13 + 12U);
    t21 = *((unsigned int *)t6);
    t22 = (1U * t21);
    t3 = (9U != t22);
    if (t3 == 1)
        goto LAB13;

LAB14:    t7 = (t0 + 3000);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t15 = *((char **)t10);
    memcpy(t15, t5, 9U);
    xsi_driver_first_trans_fast(t7);

LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 592U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(64, ng0);
    t10 = xsi_get_transient_memory(9U);
    memset(t10, 0, 9U);
    t15 = t10;
    memset(t15, (unsigned char)2, 9U);
    t16 = (t0 + 3000);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    memcpy(t20, t10, 9U);
    xsi_driver_first_trans_fast(t16);
    goto LAB11;

LAB13:    xsi_size_not_matching(9U, t22, 0);
    goto LAB14;

}

static void work_a_3880040463_3212880686_p_1(char *t0)
{
    char t3[16];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 1052U);
    t2 = *((char **)t1);
    t1 = (t0 + 5620U);
    t4 = (t0 + 1236U);
    t5 = *((char **)t4);
    t4 = (t0 + 5652U);
    t6 = ieee_p_1242562249_sub_1919437128_1035706684(IEEE_P_1242562249, t3, t5, t4, 1);
    t7 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t2, t1, t6, t3);
    if (t7 != 0)
        goto LAB3;

LAB4:
LAB5:    t13 = (t0 + 3036);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 2940);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 3036);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3880040463_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(77, ng0);
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
LAB3:    t1 = (t0 + 2948);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1612U);
    t5 = *((char **)t1);
    t1 = (t0 + 3072);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 9U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 868U);
    t6 = *((char **)t2);
    t12 = *((unsigned char *)t6);
    t13 = (t12 == (unsigned char)3);
    if (t13 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 592U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    t3 = t11;
    goto LAB9;

LAB10:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1144U);
    t7 = *((char **)t2);
    t2 = (t0 + 3072);
    t8 = (t2 + 32U);
    t9 = *((char **)t8);
    t14 = (t9 + 40U);
    t15 = *((char **)t14);
    memcpy(t15, t7, 9U);
    xsi_driver_first_trans_fast(t2);
    goto LAB11;

}

static void work_a_3880040463_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t1 = (t0 + 5752);
    t4 = xsi_mem_cmp(t1, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB7:    t5 = (t0 + 5754);
    t7 = xsi_mem_cmp(t5, t2, 2U);
    if (t7 == 1)
        goto LAB4;

LAB8:    t8 = (t0 + 5756);
    t10 = xsi_mem_cmp(t8, t2, 2U);
    if (t10 == 1)
        goto LAB5;

LAB9:
LAB6:    xsi_set_current_line(97, ng0);
    t1 = (t0 + 1748U);
    t2 = *((char **)t1);
    t1 = (t0 + 3108);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 9U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t1 = (t0 + 2956);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(91, ng0);
    t11 = (t0 + 1544U);
    t12 = *((char **)t11);
    t11 = (t0 + 3108);
    t13 = (t11 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t12, 9U);
    xsi_driver_first_trans_fast(t11);
    goto LAB2;

LAB4:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 1612U);
    t2 = *((char **)t1);
    t1 = (t0 + 3108);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 9U);
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 1680U);
    t2 = *((char **)t1);
    t1 = (t0 + 3108);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 9U);
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB10:;
}


extern void work_a_3880040463_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3880040463_3212880686_p_0,(void *)work_a_3880040463_3212880686_p_1,(void *)work_a_3880040463_3212880686_p_2,(void *)work_a_3880040463_3212880686_p_3};
	xsi_register_didat("work_a_3880040463_3212880686", "isim/baud_freq_div_tb_isim_beh.exe.sim/work/a_3880040463_3212880686.didat");
	xsi_register_executes(pe);
}
