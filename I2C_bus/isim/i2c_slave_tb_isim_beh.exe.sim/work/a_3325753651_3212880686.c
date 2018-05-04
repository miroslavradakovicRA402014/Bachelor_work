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
static const char *ng0 = "/home/rtrk/Workspace/BSc_workspace/Bachelor_work/I2C_bus/i2c_slave.vhd";



static void work_a_3325753651_3212880686_p_0(char *t0)
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
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 5416U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 5216U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 12296);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 12440);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 6056U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t2 = (t0 + 12440);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t11;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB7:    t2 = (t0 + 5256U);
    t5 = *((char **)t2);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;
    goto LAB9;

}

static void work_a_3325753651_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5};

LAB0:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 5896U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 12312);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(83, ng0);
    t5 = (t0 + 5576U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB9;

LAB10:    t4 = (unsigned char)0;

LAB11:    if (t4 != 0)
        goto LAB6;

LAB8:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 12504);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    *((unsigned char *)t9) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB7:    goto LAB2;

LAB4:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 5576U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t7 = (t4 == (unsigned char)2);
    if (t7 == 1)
        goto LAB15;

LAB16:    t3 = (unsigned char)0;

LAB17:    if (t3 != 0)
        goto LAB12;

LAB14:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 12504);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB13:    goto LAB2;

LAB5:    xsi_set_current_line(96, ng0);
    t1 = (t0 + 12504);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    *((unsigned char *)t9) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    xsi_set_current_line(84, ng0);
    t5 = (t0 + 12504);
    t12 = (t5 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)1;
    xsi_driver_first_trans_fast(t5);
    goto LAB7;

LAB9:    t5 = (t0 + 5736U);
    t9 = *((char **)t5);
    t10 = *((unsigned char *)t9);
    t11 = (t10 == (unsigned char)2);
    t4 = t11;
    goto LAB11;

LAB12:    xsi_set_current_line(91, ng0);
    t1 = (t0 + 12504);
    t6 = (t1 + 56U);
    t9 = *((char **)t6);
    t12 = (t9 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB13;

LAB15:    t1 = (t0 + 5736U);
    t5 = *((char **)t1);
    t8 = *((unsigned char *)t5);
    t10 = (t8 == (unsigned char)2);
    t3 = t10;
    goto LAB17;

}

static void work_a_3325753651_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5};

LAB0:    xsi_set_current_line(102, ng0);
    t1 = (t0 + 5896U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 12328);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(104, ng0);
    t4 = (t0 + 12568);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(105, ng0);
    t1 = (t0 + 12632);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB4:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 12568);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(108, ng0);
    t1 = (t0 + 12632);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(110, ng0);
    t1 = (t0 + 12568);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(111, ng0);
    t1 = (t0 + 12632);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

}

static void work_a_3325753651_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(116, ng0);

LAB3:    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)3, 8U);
    t3 = (t0 + 12696);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_fast(t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3325753651_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(117, ng0);

LAB3:    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)2, 16U);
    t3 = (t0 + 12760);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 16U);
    xsi_driver_first_trans_fast(t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3325753651_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(120, ng0);
    t1 = (t0 + 6856U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 12824);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)4;
    xsi_driver_first_trans_fast(t11);

LAB2:    t16 = (t0 + 12344);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 5736U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t1 = (t0 + 12824);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3325753651_3212880686_p_6(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(123, ng0);
    t1 = (t0 + 6696U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 12888);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)4;
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t16 = (t0 + 12360);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 7176U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t1 = (t0 + 12888);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_3325753651_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3325753651_3212880686_p_0,(void *)work_a_3325753651_3212880686_p_1,(void *)work_a_3325753651_3212880686_p_2,(void *)work_a_3325753651_3212880686_p_3,(void *)work_a_3325753651_3212880686_p_4,(void *)work_a_3325753651_3212880686_p_5,(void *)work_a_3325753651_3212880686_p_6};
	xsi_register_didat("work_a_3325753651_3212880686", "isim/i2c_slave_tb_isim_beh.exe.sim/work/a_3325753651_3212880686.didat");
	xsi_register_executes(pe);
}
