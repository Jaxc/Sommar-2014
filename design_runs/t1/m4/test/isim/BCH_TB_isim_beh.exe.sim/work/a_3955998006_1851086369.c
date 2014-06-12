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
extern char *STD_STANDARD;
extern char *WORK_P_1677991042;



static void work_a_3955998006_1851086369_p_0(char *t0)
{
    char t13[16];
    char t15[16];
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
    char *t14;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    int t24;
    int t25;
    unsigned char t26;

LAB0:    t1 = (t0 + 2984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(121, ng0);

LAB6:    t2 = (t0 + 3304);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t6 = (t0 + 3304);
    *((int *)t6) = 0;
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t2 = (t0 + 1832U);
    t6 = *((char **)t2);
    t10 = (0 - 0);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t2 = (t6 + t12);
    t14 = ((STD_STANDARD) + 1080);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 0;
    t17 = (t16 + 4U);
    *((int *)t17) = 15;
    t17 = (t16 + 8U);
    *((int *)t17) = 1;
    t18 = (15 - 0);
    t19 = (t18 * 1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t7 = xsi_base_array_concat(t7, t13, t14, (char)99, t3, (char)97, t2, t15, (char)101);
    t19 = (1U + 16U);
    t5 = (17U != t19);
    if (t5 == 1)
        goto LAB11;

LAB12:    t17 = (t0 + 3384);
    t20 = (t17 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t7, 17U);
    xsi_driver_first_trans_fast(t17);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t2 = ((WORK_P_1677991042) + 1288U);
    t6 = *((char **)t2);
    t18 = *((int *)t6);
    t24 = (t18 + 1);
    t25 = (t24 - 0);
    t10 = (t25 * 1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t2 = (t4 + t12);
    t5 = *((unsigned char *)t2);
    t7 = (t0 + 1192U);
    t14 = *((char **)t7);
    t8 = *((unsigned char *)t14);
    t9 = (t5 ^ t8);
    if (t9 == 1)
        goto LAB13;

LAB14:    t3 = (unsigned char)0;

LAB15:    t7 = (t0 + 3448);
    t17 = (t7 + 56U);
    t20 = *((char **)t17);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t3;
    xsi_driver_first_trans_fast_port(t7);
    goto LAB2;

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

LAB11:    xsi_size_not_matching(17U, t19, 0);
    goto LAB12;

LAB13:    t7 = (t0 + 1352U);
    t16 = *((char **)t7);
    t26 = *((unsigned char *)t16);
    t3 = t26;
    goto LAB15;

}


extern void work_a_3955998006_1851086369_init()
{
	static char *pe[] = {(void *)work_a_3955998006_1851086369_p_0};
	xsi_register_didat("work_a_3955998006_1851086369", "isim/BCH_TB_isim_beh.exe.sim/work/a_3955998006_1851086369.didat");
	xsi_register_executes(pe);
}
