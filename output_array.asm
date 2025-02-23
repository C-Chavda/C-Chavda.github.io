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
;   Author name: Chandresh Chavda
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
;   The output_array function is responsible for displaying the array values to the user in a properly formatted manner.
;
; This file:
;   File name: output_array.asm
;   Language: X86-64 Assembly
;   Max page width: 124 columns
;   Assemble (standard): nasm -f elf64 -l output_array.lis -o output_array.o output_array.asm
;   Assemble (debug): nasm -f elf64 -gdwarf -l output_array.lis -o output_array.o output_array.asm
;   Optimal print specification: Landscape, 7 points, monospace, 8½x11 paper
;   Prototype of this function: extern double output_array();
;
; Notes:
;   This file contains the assembly module for the "Arrays of Floating Point Numbers" program, specifically the output_array function.
;   The output_array function displays the array of floating point numbers to the user in a formatted manner, with a specified number of decimal places.
;
;===== Begin code area ==========================================================================================================

extern printf

section .data
    floatformat db "%.9f ", 0
    intformat db "%d", 0
    newline db 10, 0

section .bss
;empty
section .text
global output_array
output_array:
    push rbp
    mov rbp, rsp
    push r12
    push r13
    push r14
             ; Align stack

    mov r12, rdi    ; array address
    ;mov r13, rax    ; array length
    mov r13, rsi    ; index counter
    ;mov rax, r13
    ;mov rdi, floatformat
    ;call printf
    mov r14, 0
.print_loop:
    cmp r14, r13    ; check if index < length
    jge .end_loop

    ; Print current element
    sub rsp, 8
    mov rdi, floatformat
    movsd xmm0, [r12 + r14*8]
    mov rax, 1
    call printf
    add rsp, 8

    inc r14
    jmp .print_loop

.end_loop:
    ; Print newline
    mov rax, 0
    mov rdi, newline
    call printf

    pop r14
    pop r13
    pop r12
    pop rbp
    ret