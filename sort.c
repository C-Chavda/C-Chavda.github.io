// *******************************************************************************************************************************
//  Program name: "Arrays of Floating Point Numbers". This program takes user input of floating point numbers and places them into an array.
//  Copyright (C) 2025  Chandresh Chavda                                                                                             *
//                                                                                                                               *
//  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License    *
//  as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.        *
//  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty  *
//  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.                *
//  You should have received a copy of the GNU General Public License along with this program. If not, see                      *
//  <https://www.gnu.org/licenses/>.                                                                                             *
// *******************************************************************************************************************************

//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
// Author: Chandresh Chavda
// Author email: chav349@csu.fullerton.edu
// CWID: 885158899
// Class: 240-11 Section 11
// Program name: Arrays of Floating Point Numbers
// Programming languages: C and X86 Assembly
// Date program began: 2025-Feb-22
// Date of last update: 2025-Feb-22
// Files in this program: main.c, manager.asm, input_array.asm, output_array.asm, sum.asm, sort.asm, swap.asm, isfloat.asm, run.sh.
// Testing: Alpha testing completed. All functions are correct.
// Status: Ready for release to customers

// Purpose of this program:
//  This program calculates the sum and mean of an array of floating point numbers and sorts the array.
//  The "sort.c" file contains the logic for sorting the floating point numbers in ascending order.


// This file:
//  File name: sort.c
//  Language: C
//  Max page width: 124 columns
//  Compile: gcc -c -m64 -Wall -no-pie -o sort.o sort.c -std=c2x
//  Link: gcc -m64 -no-pie -o main.out main.o manager.o input_array.o output_array.o sum.o swap.o sort.o isfloat.o -std=c2x -Wall -z noexecstack

extern void swap(double *a, double *b);

void sort(double *array, int length) 
{
    // Bubble sort implementation
    for(int pass = 0; pass < length-1; pass++) 
    {
        // Single pass through array
        for(int current = 0; current < length-pass-1; current++) 
        {
            // Compare adjacent elements
            if(array[current] > array[current+1]) 
            {
                // Call assembly swap function
                swap(&array[current], &array[current+1]);
            }
        }
    }
}

