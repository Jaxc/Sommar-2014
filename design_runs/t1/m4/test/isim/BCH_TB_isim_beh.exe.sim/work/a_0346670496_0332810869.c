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
extern char *WORK_P_1677991042;
extern char *STD_STANDARD;



static void work_a_0346670496_0332810869_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(42, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = ((WORK_P_1677991042) + 1288U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 1);
    t6 = (t5 - 0);
    t7 = (t6 * 1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t10 = *((unsigned char *)t1);
    t11 = (t0 + 3488);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t10;
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t16 = (t0 + 3392);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0346670496_0332810869_p_1(char *t0)
{
    char t16[16];
    char t17[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 3072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);

LAB6:    t2 = (t0 + 3408);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t6 = (t0 + 3408);
    *((int *)t6) = 0;
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t5 = (t3 == (unsigned char)1);
    if (t5 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t13 = (0 - 0);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t2 = (t4 + t15);
    t7 = ((STD_STANDARD) + 1080);
    t10 = (t17 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 13;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t18 = (13 - 0);
    t19 = (t18 * 1);
    t19 = (t19 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t19;
    t6 = xsi_base_array_concat(t6, t16, t7, (char)99, (unsigned char)0, (char)97, t2, t17, (char)101);
    t19 = (1U + 14U);
    t3 = (15U != t19);
    if (t3 == 1)
        goto LAB14;

LAB15:    t11 = (t0 + 3552);
    t12 = (t11 + 56U);
    t20 = *((char **)t12);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t6, 15U);
    xsi_driver_first_trans_fast(t11);

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

LAB11:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t2 = (t0 + 3552);
    t7 = (t2 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t6, 15U);
    xsi_driver_first_trans_fast(t2);
    goto LAB12;

LAB14:    xsi_size_not_matching(15U, t19, 0);
    goto LAB15;

}


extern void work_a_0346670496_0332810869_init()
{
	static char *pe[] = {(void *)work_a_0346670496_0332810869_p_0,(void *)work_a_0346670496_0332810869_p_1};
	xsi_register_didat("work_a_0346670496_0332810869", "isim/BCH_TB_isim_beh.exe.sim/work/a_0346670496_0332810869.didat");
	xsi_register_executes(pe);
}
