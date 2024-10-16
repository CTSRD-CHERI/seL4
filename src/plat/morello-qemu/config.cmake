#
# Copyright 2023, Hesham Almatary (hesham.almatary@cl.cam.ac.uk)
# Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: GPL-2.0-only
#

cmake_minimum_required(VERSION 3.7.2)

declare_platform(morello-qemu KernelPlatformMorelloQEMU PLAT_MORELLO_QEMU KernelSel4ArchAarch64)

if(KernelPlatformMorelloQEMU)

    # ARM_CPU is not currently used, but mention the name here
    # for completeness and for future Morello/CPU features that
    # may make use of this config (e.g., CHERI).
    if(NOT ARM_CPU)
        message(STATUS "ARM_CPU not set, defaulting to rainier")
        set(ARM_CPU "rainier")
    endif()

    # Currently no CHERI support exists in seL4 Morello. Future
    # support may extend the follwing config.
    if(NOT CHERI_MODE)
        message(STATUS "CHERI_MODE not set, disable it by default")
        set(CHERI_MODE "none")
    endif()

    set(QEMU_ARCH "morello")
    declare_seL4_arch(aarch64)
    set(KernelArmMorello ON)
    set(KernelArchArmV8a ON)

    # This DTS was generated by the following command:
    # qemu-system-morello -machine virt,gic-version=2 -cpu morello -nographic  -m size=2048  -kernel sel4.elf
    list(APPEND KernelDTSList "tools/dts/morello-qemu-gicv2.dts")
    list(APPEND KernelDTSList "src/plat/morello-qemu/overlay-morello-qemu.dts")

    declare_default_headers(
        TIMER_FREQUENCY 62500000
        MAX_IRQ 159
        NUM_PPI 32
        TIMER drivers/timer/arm_generic.h
        INTERRUPT_CONTROLLER arch/machine/gic_v2.h
        CLK_MAGIC 4611686019llu
        CLK_SHIFT 58u
    )

endif()

add_sources(
    DEP "KernelPlatformMorelloQEMU"
    CFILES src/arch/arm/machine/l2c_nop.c src/arch/arm/machine/gic_v2.c
)
