/*
 * Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <sel4/config.h>
#include <sel4/simple_types.h>

#if defined(CONFIG_HAVE_CHERI)
/* Allow CHERI capability loads/stores by default */
#if defined(CONFIG_ARCH_CHERI_RISCV_V_0_9)
#define seL4_CHERI_RISCV_Default_VMAttributes 0x2lu
#else
#define seL4_CHERI_RISCV_Default_VMAttributes 0x1clu
#endif
#endif
