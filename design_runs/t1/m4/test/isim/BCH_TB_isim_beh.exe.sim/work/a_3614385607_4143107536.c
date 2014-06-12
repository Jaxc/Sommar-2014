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
static const char *ng0 = "/home/jaxc/Desktop/projekt/sommar-14/design_runs/t1/m4/sim.vhd";
extern char *STD_STANDARD;



static void work_a_3614385607_4143107536_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(84, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 3488);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 11U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3392);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3614385607_4143107536_p_1(char *t0)
{
    char t14[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 3072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(86, ng0);

LAB6:    t2 = (t0 + 3408);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t6 = (t0 + 3408);
    *((int *)t6) = 0;
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t5 = (t3 == (unsigned char)1);
    if (t5 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 3552);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t13 = (t7 + 56U);
    t15 = *((char **)t13);
    memcpy(t15, t4, 11U);
    xsi_driver_first_trans_fast(t2);

LAB12:    goto LAB2;

LAB5:    t4 = (t0 + 992U);
    t5 = xsi_signal_has_event(t4);
    if (t5 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)1);
    t3 = t9;
    goto LAB10;

LAB11:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t8 = *((unsigned char *)t6);
    t2 = (t0 + 1672U);
    t7 = *((char **)t2);
    t10 = (0 - 0);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t2 = (t7 + t12);
    t15 = ((STD_STANDARD) + 1080);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 0;
    t18 = (t17 + 4U);
    *((int *)t18) = 9;
    t18 = (t17 + 8U);
    *((int *)t18) = 1;
    t19 = (9 - 0);
    t20 = (t19 * 1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t13 = xsi_base_array_concat(t13, t14, t15, (char)99, t8, (char)97, t2, t16, (char)101);
    t20 = (1U + 10U);
    t9 = (11U != t20);
    if (t9 == 1)
        goto LAB14;

LAB15:    t18 = (t0 + 3552);
    t21 = (t18 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t13, 11U);
    xsi_driver_first_trans_fast(t18);
    goto LAB12;

LAB14:    xsi_size_not_matching(11U, t20, 0);
    goto LAB15;

}


extern void work_a_3614385607_4143107536_init()
{
	static char *pe[] = {(void *)work_a_3614385607_4143107536_p_0,(void *)work_a_3614385607_4143107536_p_1};
	xsi_register_didat("work_a_3614385607_4143107536", "isim/BCH_TB_isim_beh.exe.sim/work/a_3614385607_4143107536.didat");
	xsi_register_executes(pe);
}
