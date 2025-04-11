

.section .text
.syntax unified
.cpu cortex-m4

//P111 = User LED
//P012  TX 
//P013  RX

.equ GPIO0_BASE, 0x40040000  // p284
.equ GPIO0_ODR, 0x0        // p286

.equ GPIO1_BASE, 0x40040020  // p284
.equ GPIO1_ODR, 0x0        // p286



.global _start
.type _start, %function

    .word   0x20000630 //p71
    .word   _start
    .word   _start
    .word   _start

.org 0x200
_start:

loop:

    bl wait

    ldr r0, =GPIO0_BASE
    ldr r1, =0x30003000   
    str r1, [r0, #GPIO0_ODR]

    ldr r0, =GPIO1_BASE
    ldr r1, =0x00000800   
    str r1, [r0, #GPIO1_ODR]

    bl wait

    ldr r0, =GPIO0_BASE
    ldr r1, =0x00003000    
    str r1, [r0, #GPIO0_ODR]

    ldr r0, =GPIO1_BASE
    ldr r1, =0x08000800   
    str r1, [r0, #GPIO1_ODR]


    b loop

wait:
    mov r3, #0
wait1:
    mov r2, #0 
wait2:

    add r2, r2, #1
    cmp r2, #1000
    bne wait2
    add r3, r3, #1    
    cmp r3, #100
    bne wait1

    bx lr



