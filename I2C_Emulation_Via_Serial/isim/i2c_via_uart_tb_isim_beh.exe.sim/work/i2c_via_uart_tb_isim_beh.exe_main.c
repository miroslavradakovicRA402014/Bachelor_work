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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *IEEE_P_1242562249;
char *IEEE_P_3499444699;
char *WORK_P_1809911496;
char *WORK_P_1825677762;
char *WORK_P_0583247548;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_0583247548_init();
    work_p_1809911496_init();
    work_p_1825677762_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    work_a_0930825134_3212880686_init();
    work_a_1067640401_3212880686_init();
    work_a_3522877208_3212880686_init();
    work_a_0892741282_3212880686_init();
    work_a_1489787017_3212880686_init();
    ieee_p_3620187407_init();
    work_a_2023191012_3212880686_init();
    work_a_0915519090_3212880686_init();
    work_a_1091000080_3212880686_init();
    work_a_2837951248_3212880686_init();
    work_a_3596068334_3212880686_init();
    work_a_1985537419_3212880686_init();
    work_a_0048043731_3212880686_init();
    work_a_1385757030_3212880686_init();
    work_a_3194606462_2372691052_init();


    xsi_register_tops("work_a_3194606462_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    WORK_P_1809911496 = xsi_get_engine_memory("work_p_1809911496");
    WORK_P_1825677762 = xsi_get_engine_memory("work_p_1825677762");
    WORK_P_0583247548 = xsi_get_engine_memory("work_p_0583247548");

    return xsi_run_simulation(argc, argv);

}
