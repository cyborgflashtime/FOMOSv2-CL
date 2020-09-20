// put arm assembly here to run fomos.rs
// compile this to img

.globl _main
.extern LD_STACK_PTR

.section ".text.boot"

_main:
    ldr     x30, =LD_STACK_PTR
    mov     sp, x30
    bl      fomos

// fomos is a function in FOMSO.rs

.equ PSCI_SYSTEM_OFF, 0x84000008
.globl system_off
system_off:
    ldr     x0, =PSCI_SYSTEM_OFF
    hvc     #0

