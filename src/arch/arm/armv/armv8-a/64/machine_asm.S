/*
 * Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
 *
 * SPDX-License-Identifier: GPL-2.0-only
 */

#include <machine/assembler.h>

BEGIN_FUNC(lockTLBEntry)
#ifdef __ARM_MORELLO_PURECAP_BENCHMARK_ABI
    and x30, x30, #~1
    ret x30
#else
    ret
#endif
END_FUNC(lockTLBEntry)
