/*
 * Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
 * Copyright 2015, 2016 Hesham Almatary <heshamelmatary@gmail.com>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <sel4/config.h>
#include <sel4/simple_types.h>

#if defined(CONFIG_HAVE_CHERI)
/* 32-bit CHERI-RISC-V doesn't have PTE bits */
#define seL4_CHERI_RISCV_Default_VMAttributes 0
#endif
