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

char *STD_STANDARD;
char *WORK_P_1677991042;
char *IEEE_P_2592010699;
char *IEEE_P_1242562249;
char *STD_TEXTIO;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_p_1677991042_init();
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    std_textio_init();
    work_a_0893032269_3865418524_init();
    work_a_2986367104_0421280854_init();
    work_a_1515588183_3048611814_init();
    work_a_2822075963_1074958504_init();
    work_a_1535979869_1406692110_init();
    work_a_3995485201_0938330868_init();
    work_a_3955998006_1851086369_init();
    work_a_1664626272_0023041890_init();
    work_a_2913565458_0977417895_init();
    work_a_0346670496_0332810869_init();
    work_a_1640774207_0771649113_init();
    work_a_3614385607_4143107536_init();
    work_a_0906740788_1527262382_init();
    work_a_1013598774_1949178628_init();


    xsi_register_tops("work_a_1013598774_1949178628");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_1677991042 = xsi_get_engine_memory("work_p_1677991042");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");

    return xsi_run_simulation(argc, argv);

}
