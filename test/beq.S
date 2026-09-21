.section .text
.globl _start

_start:
    addi x1, x0, 10
    addi x2, x0, 10
    beq  x1, x2, 8
    addi x3, x0, 99
    addi x3, x0, 55
