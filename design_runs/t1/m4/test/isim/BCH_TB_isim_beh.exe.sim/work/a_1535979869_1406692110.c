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
static const char *ng0 = "/home/jaxc/Desktop/projekt/sommar-14/design_runs/t1/m4/dec.vhd";



static void work_a_1535979869_1406692110_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 3488);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3392);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1535979869_1406692110_p_1(char *t0)
{
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
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;

LAB0:    t1 = (t0 + 3072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);

LAB6:    t2 = (t0 + 3408);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t6 = (t0 + 3408);
    *((int *)t6) = 0;
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t5 = (t3 == (unsigned char)1);
    if (t5 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t13 = (3 - 0);
    t14 = (t13 * 1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t2 = (t6 + t16);
    t5 = *((unsigned char *)t2);
    t8 = (t3 ^ t5);
    t7 = (t0 + 3552);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t17 = *((char **)t12);
    *((unsigned char *)t17) = t8;
    xsi_driver_first_trans_delta(t7, 0U, 1, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t13 = (0 - 0);
    t14 = (t13 * 1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t2 = (t4 + t16);
    t3 = *((unsigned char *)t2);
    t6 = (t0 + 1672U);
    t7 = *((char **)t6);
    t18 = (3 - 0);
    t19 = (t18 * 1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t6 = (t7 + t21);
    t5 = *((unsigned char *)t6);
    t8 = (t3 ^ t5);
    t10 = (t0 + 3552);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t17 = (t12 + 56U);
    t22 = *((char **)t17);
    *((unsigned char *)t22) = t8;
    xsi_driver_first_trans_delta(t10, 1U, 1, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t13 = (1 - 0);
    t14 = (t13 * 1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t2 = (t4 + t16);
    t3 = *((unsigned char *)t2);
    t6 = (t0 + 3552);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t3;
    xsi_driver_first_trans_delta(t6, 2U, 1, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t13 = (2 - 0);
    t14 = (t13 * 1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t2 = (t4 + t16);
    t3 = *((unsigned char *)t2);
    t6 = (t0 + 3552);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t3;
    xsi_driver_first_trans_delta(t6, 3U, 1, 0LL);

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

LAB11:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t8 = *((unsigned char *)t6);
    t2 = (t0 + 3552);
    t7 = (t2 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t8;
    xsi_driver_first_trans_delta(t2, 0U, 1, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 5431);
    t3 = (3U != 3U);
    if (t3 == 1)
        goto LAB14;

LAB15:    t6 = (t0 + 3552);
    t7 = (t6 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 3U);
    xsi_driver_first_trans_delta(t6, 1U, 3U, 0LL);
    goto LAB12;

LAB14:    xsi_size_not_matching(3U, 3U, 0);
    goto LAB15;

}


extern void work_a_1535979869_1406692110_init()
{
	static char *pe[] = {(void *)work_a_1535979869_1406692110_p_0,(void *)work_a_1535979869_1406692110_p_1};
	xsi_register_didat("work_a_1535979869_1406692110", "isim/BCH_TB_isim_beh.exe.sim/work/a_1535979869_1406692110.didat");
	xsi_register_executes(pe);
}
