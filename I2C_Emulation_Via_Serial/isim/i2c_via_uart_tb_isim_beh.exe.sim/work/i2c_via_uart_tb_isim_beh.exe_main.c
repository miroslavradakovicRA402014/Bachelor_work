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
char *IEEE_P_3499444699;
char *IEEE_P_1242562249;
char *IEEE_P_3620187407;
char *WORK_P_1809911496;
char *WORK_P_1825677762;
char *UNISIM_P_0947159679;
char *WORK_P_0583247548;
char *STD_TEXTIO;
char *IEEE_P_2717149903;
char *IEEE_P_1367372525;
char *UNISIM_P_3222816464;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    work_p_0583247548_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    unisim_p_0947159679_init();
    work_p_1809911496_init();
    work_p_1825677762_init();
    std_textio_init();
    ieee_p_2717149903_init();
    ieee_p_1367372525_init();
    unisim_p_3222816464_init();
    unisim_a_0780662263_2014779070_init();
    unisim_a_0850834979_2152628908_init();
    unisim_a_0714155612_2768510774_init();
    unisim_a_0018426790_2768510774_init();
    unisim_a_1297477671_0429821216_init();
    unisim_a_0215099764_2584565154_init();
    unisim_a_1490675510_1976025627_init();
    work_a_2248698854_0912031422_init();
    work_a_3021253016_3212880686_init();
    work_a_1067640401_3212880686_init();
    work_a_2205529533_3212880686_init();
    work_a_1156261981_3212880686_init();
    work_a_0892741282_3212880686_init();
    work_a_1489787017_3212880686_init();
    work_a_2023191012_3212880686_init();
    work_a_0915519090_3212880686_init();
    work_a_1091000080_3212880686_init();
    work_a_4016710299_3212880686_init();
    work_a_0509931213_3212880686_init();
    work_a_3594044432_3212880686_init();
    work_a_0809595292_3212880686_init();
    work_a_3594497202_3212880686_init();
    work_a_3596068334_3212880686_init();
    work_a_3219417343_3212880686_init();
    work_a_3194697436_3212880686_init();
    work_a_0928455289_3212880686_init();
    work_a_3895332195_3212880686_init();
    work_a_2168191763_3212880686_init();
    work_a_3194606462_2372691052_init();


    xsi_register_tops("work_a_3194606462_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    WORK_P_1809911496 = xsi_get_engine_memory("work_p_1809911496");
    WORK_P_1825677762 = xsi_get_engine_memory("work_p_1825677762");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    WORK_P_0583247548 = xsi_get_engine_memory("work_p_0583247548");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    UNISIM_P_3222816464 = xsi_get_engine_memory("unisim_p_3222816464");

    return xsi_run_simulation(argc, argv);

}
