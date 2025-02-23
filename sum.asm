; *******************************************************************************************************************************
; Program name: "Arrays of Floating Point Numbers". This program takes user inputs of floating point numbers and places them into an array.
; Copyright (C) 2025  Jonathan Diep                                                                                             *
;                                                                                                                               *
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License    *
; as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.        *
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty  *
; of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.                *
; You should have received a copy of the GNU General Public License along with this program. If not, see                       *
; <https://www.gnu.org/licenses/>.                                                                                             *
; *******************************************************************************************************************************

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
; Author information
;   Author name: Chandesh Chavda
;   Author email: chav349@csu.fullerton.edu
;   CWID: 885158899
;   Class: 240-11 Section 11
;
; Program information
;   Program name: Arrays of Floating Point Numbers
;   Programming language: X86-64 Assembly
;   Date program began: 2025-Feb-22
;   Date of last update: 2025-Feb-22
;   Files in this program: main.c, manager.asm, input_array.asm, output_array.asm, sum.asm, sort.asm, swap.asm, isfloat.asm, run.sh.
;   Testing: Alpha testing completed. All functions are correct.
;   Status: Ready for release to customers
;
; Purpose
;   This program takes user inputs of floating point numbers and places them into an array.
;   It calculates the sum, mean, and sorts the array. The swap function is used during sorting to exchange two values in the array.
;
; This file:
;   File name: swap.asm
;   Language: X86-64 Assembly
;   Max page width: 124 columns
;   Assemble (standard): nasm -f elf64 -l swap.lis -o swap.o swap.asm
;   Assemble (debug): nasm -f elf64 -gdwarf -l swap.lis -o swap.o swap.asm
;   Optimal print specification: Landscape, 7 points, monospace, 8½x11 paper
;   Prototype of this function: extern double swap();
;
; Notes:
;   This file contains the assembly module for the "Arrays of Floating Point Numbers" program, specifically the swap function.
;   The swap function exchanges two floating point values in the array during the sorting process.
;
;===== Begin code area ==========================================================================================================

; Declarations
extern printf

global sum

section .data

section .bss
    align 64
    backup_storage_area resb 832   ; To backup the registers for context switching

section .text
sum:
    ; Backup general-purpose registers (GPRs)
    push rbp
    mov rbp, rsp
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    pushf

    ; Backup other registers
    mov rax, 7
    mov rdx, 0
    xsave [backup_storage_area]   ; Save state of registers to backup

    ; Store array address (rdi) and array length (rsi)
    mov r12, rdi   ; r12 contains the address of the array
    mov r13, rsi   ; r13 contains the length of the array
  ; Initialize counter (r14) to 0
    mov r14, 0  ; r14 is the loop counter


  
sum_loop:

    ; Add the current array element to xmm9 (accumulating sum)
    sub rsp, 8
    movsd xmm15, [r12 + r14*8]
    addsd xmm14, xmm15
    add rsp, 8
    ; Increment the counter
    inc r14
    cmp r14, r13
    jl sum_loop   ; Repeat the loop
    jg sum_exit

sum_exit:
  movsd xmm0, xmm14
    ; Restore the registers (stack cleanup)
    popf
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rbp  ; Restore rbp to the base of the activation record

    ret   ; Return from function
