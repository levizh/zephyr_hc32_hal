/**
 * @file
 * @brief System/hardware module for hc32f460 platform
 *
 * This module provides routines to initialize and support board-level
 * hardware for the hc32f460 platform.
 */

/* ---------------------------------------------------------------------------------------*/
/*  @file:    platform_init.S                                                      */
/*  @purpose: CMSIS Cortex-M4 Core Device Startup File                                    */
/*            hc32f460                                                                */
/* ---------------------------------------------------------------------------------------*/
/* Copyright (C) 2024-2025, Xiaohua Semiconductor Co., Ltd.                               */
/*****************************************************************************/
/* Version: GCC for ARM Embedded Processors                                  */
/*****************************************************************************/

#include <zephyr/toolchain.h>
#include <zephyr/linker/sections.h>
#include <zephyr/arch/cpu.h>


#if defined(CONFIG_PLATFORM_SPECIFIC_INIT) && defined(CONFIG_SOC_HC32F460)

    .syntax unified
    .arch armv7-m
    .text
    .thumb

GTEXT(z_arm_platform_init)
SECTION_FUNC(TEXT,z_arm_platform_init)

/* sram3 must set wait cycles is 1 */
SetSRAM3Wait:
    ldr         r0, =0x40050804
    mov         r1, #0x77
    str         r1, [r0]

    ldr         r0, =0x4005080C
    mov         r1, #0x77
    str         r1, [r0]

    ldr         r0, =0x40050800
    mov         r1, #0x1100
    str         r1, [r0]

    ldr         r0, =0x40050804
    mov         r1, #0x76
    str         r1, [r0]

    ldr         r0, =0x4005080C
    mov         r1, #0x76
    str         r1, [r0]
	bx          lr
#endif
