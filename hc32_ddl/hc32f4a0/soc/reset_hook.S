/**
 * @file
 * @brief System/hardware module for hc32f4a0 platform
 *
 * This module provides routines to initialize and support board-level
 * hardware for the hc32f4a0 platform.
 */

/* ---------------------------------------------------------------------------------------*/
/*  @file:    reset_hook.S                                                      */
/*  @purpose: CMSIS Cortex-M4 Core Device Startup File                                    */
/*            hc32f4a0                                                                */
/* ---------------------------------------------------------------------------------------*/
/* Copyright (C) 2024-2025, Xiaohua Semiconductor Co., Ltd.                               */
/*****************************************************************************/
/* Version: GCC for ARM Embedded Processors                                  */
/*****************************************************************************/

#include <zephyr/toolchain.h>
#include <zephyr/linker/sections.h>
#include <zephyr/arch/cpu.h>


#if defined(CONFIG_SOC_RESET_HOOK) && defined(CONFIG_SOC_HC32F4A0)

    .syntax unified
    .arch armv7-m
    .text
    .thumb

GTEXT(soc_reset_hook)
SECTION_FUNC(TEXT,soc_reset_hook)

ClearSramSR:
    LDR     R0, =0x40050810
	LDR     R1, =0x1FF
	STR     R1, [R0]
#endif
