; *******************************************************************************************************************************
; Program name: "Arrays of Floating Point Numbers". This program takes user input of floating point numbers and places them into an array.
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
;   This program takes user inputs of floating point numbers and places them into an array.
;   It calculates the sum, mean, and sorts the array. The swap function is used within the sorting process to exchange array values.
;
; This file:
;   File name: swap.asm
;   Language: X86-64 Assembly
;   Max page width: 124 columns
;   Assemble (standard): nasm -f elf64 -l swap.lis -o swap.o swap.asm
;   Assemble (debug): nasm -f elf64 -gdwarf -l swap.lis -o swap.o swap.asm
;   Prototype of this function: extern double swap();
;
; Notes:
;   This file contains the assembly module for the "Arrays of Floating Point Numbers" program, specifically the swap function,
;   which exchanges two floating point numbers during the sorting process.
;   It is used to help sort the array in ascending order as part of the overall program logic.
;
;===== Begin code area ==========================================================================================================

global swap

segment .data
    ; This segment is empty
segment .bss
    ; This segment is empty
segment .text

swap:

    ; Input: rdi = address of element 1, rsi = address of element 2
    
    movsd xmm0, [rdi]    ; xmm0 = *a
    movsd xmm1, [rsi]    ; xmm1 = *b
    
    ; Write swapped values back to memory
    movsd [rdi], xmm1    ; *a = xmm1
    movsd [rsi], xmm0    ; *b = xmm0
    ret