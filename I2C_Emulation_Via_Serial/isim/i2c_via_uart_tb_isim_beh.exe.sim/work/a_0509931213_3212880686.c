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
static const char *ng0 = "D:/BSc_workspace/Bachelor_work/LCD_controller/lcd_timer.vhd";
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_1781507893_1035706684(char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );


static void work_a_0509931213_3212880686_p_0(char *t0)
{
    char t17[16];
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
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t18;
    unsigned int t19;

LAB0:    xsi_set_current_line(44, ng0);
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
LAB3:    t1 = (t0 + 2096);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(45, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t5 = t1;
    memset(t5, (unsigned char)2, 14U);
    t6 = (t0 + 2148);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 14U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 960U);
    t6 = *((char **)t2);
    t2 = (t0 + 3752U);
    t13 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t6, t2, 12000);
    if (t13 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB13;

LAB14:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 592U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(48, ng0);
    t7 = xsi_get_transient_memory(14U);
    memset(t7, 0, 14U);
    t8 = t7;
    memset(t8, (unsigned char)2, 14U);
    t9 = (t0 + 2148);
    t10 = (t9 + 32U);
    t14 = *((char **)t10);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 14U);
    xsi_driver_first_trans_fast(t9);
    goto LAB11;

LAB13:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 960U);
    t5 = *((char **)t1);
    t1 = (t0 + 3752U);
    t6 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t17, t5, t1, 1);
    t7 = (t17 + 12U);
    t18 = *((unsigned int *)t7);
    t19 = (1U * t18);
    t11 = (14U != t19);
    if (t11 == 1)
        goto LAB15;

LAB16:    t8 = (t0 + 2148);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t14 = (t10 + 40U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 14U);
    xsi_driver_first_trans_fast(t8);
    goto LAB11;

LAB15:    xsi_size_not_matching(14U, t19, 0);
    goto LAB16;

}

static void work_a_0509931213_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
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

LAB0:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t1 = (t0 + 3752U);
    t3 = ieee_p_1242562249_sub_1781507893_1035706684(IEEE_P_1242562249, t2, t1, 12000);
    if (t3 != 0)
        goto LAB3;

LAB4:
LAB5:    t9 = (t0 + 2184);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t9);

LAB2:    t14 = (t0 + 2104);
    *((int *)t14) = 1;

LAB1:    return;
LAB3:    t4 = (t0 + 2184);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t4);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_0509931213_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0509931213_3212880686_p_0,(void *)work_a_0509931213_3212880686_p_1};
	xsi_register_didat("work_a_0509931213_3212880686", "isim/i2c_via_uart_tb_isim_beh.exe.sim/work/a_0509931213_3212880686.didat");
	xsi_register_executes(pe);
}
