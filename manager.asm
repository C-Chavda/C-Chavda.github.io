; *******************************************************************************************************************************
; Program name: "Arrays of Floating Point Numbers". This program takes user inputs of floating point numbers and places them into an array.
; Copyright (C) 2025  Chandresh Chavda                                                                                             *
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
;   This program calculates the sum and mean of an array of floating point numbers and sorts the array.
;   The manager.asm file contains the core logic for controlling the flow of the program and managing various operations (like input, output, sum, etc.).
;
; This file:
;   File name: manager.asm
;   Language: X86-64 Assembly
;   Max page width: 124 columns
;   Assemble (standard): nasm -f elf64 -l manager.lis -o manager.o manager.asm
;   Assemble (debug): nasm -f elf64 -gdwarf -l manager.lis -o manager.o manager.asm
;   Optimal print specification: Landscape, 7 points, monospace, 8½x11 paper
;   Prototype of this function: extern double manager();
;
; Notes:
;   This file contains the assembly module for the "Arrays of Floating Point Numbers" program.
;   The manager function coordinates the execution of the entire program, orchestrating input, calculation, and output.
;
;===== Begin code area ==========================================================================================================

;declarations
extern printf
extern input_array
extern output_array
extern sum
extern sort

global manager

segment .data                 ;Place initialized data here
prompt_1 db 10,"This program will manage your arrays of 64-bit floats",0
prompt_2 db 10,"For the array enter a sequence of 64-bit floats separated by white space.",10,0
prompt_3 db "After the last input press enter followed by Control+D:",10,0
prompt_4 db 10,"These numbers were received and placed into an array",10,0
prompt_5 db "The sum of the inputted numbers is %.10f",10,0
prompt_6 db "The arithmetic mean of the numbers in the array is %.6f",10,0
prompt_7 db "This is the array after the sort process completed:",10,0
floatformat db 10, "%lf", 10, 0
intformat db 10, "%d", 10, 0
segment .bss      ;Declare pointers to un-initialized space in this segment.
align 64
backup resb 832

array resq 100 ; <name> <data-type> <size>


segment .text
manager:

;backup GPRs
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

;backup other registers
mov rax,7
mov rdx,0
xsave [backup]

;inform user what the program does/how it works in creating floating point number arrays
mov rax, 0
mov rdi, prompt_1
call printf

;inform the user how to input float values into the array
mov rax, 0
mov rdi, prompt_2
call printf

;inform user how to end the input prompt before the array is full
mov rax, 0
mov rdi, prompt_3
call printf

;call input_array function in order to obtain the float values from user and place them into array
mov rax, 0
mov rdi, array
mov rsi, 100
call input_array

;store the array length from input_array function in a non-volatile register to use for other functions
mov r13, rax

;tell user that these were the values received before printing the array values
mov rax, 0
mov rdi, prompt_4
call printf

;call output_array function to loop through the array and print each value for the user to see
mov rax, 0
mov rdi, array
mov rsi, r13
call output_array

;call sum function in order to calculate the sum of all the user submitted values in the array
mov rax, 0
mov rdi, array
mov rsi, r13
call sum


movsd xmm15, xmm0   ; Move mean to xmm0 for returning to main

mov rax, 1
mov rdi, prompt_5
movsd xmm0, xmm15   ; Moving sum into xmm0 to print
call printf

mov r14, r13
;calculate mean
cvtsi2sd xmm1, r13
movsd xmm0, xmm15
divsd xmm0, xmm1

mov r13, r14

; Print the Mean
mov rax, 1
mov rdi, prompt_6
call printf

mov rax, 0
mov rdi, prompt_7
call printf

; Sort the array in numerical order
mov rax, 0
mov rdi, array
mov rsi, r13
call sort

; Print out the sorted array
mov rax, 0
mov rdi, array
mov rsi, r13
call output_array

; Saving xmm15 (sum) 
mov rax, 0
push qword 0
movsd [rsp], xmm15

mov rax, 7
mov rax, 0
xrstor [backup]

; Sending the sum to main
movsd xmm0, [rsp]
pop rax

;Restore the GPRs
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
pop rbp   ;Restore rbp to the base of the activation record of the caller program
ret
;End of the function manager ====================================================================
