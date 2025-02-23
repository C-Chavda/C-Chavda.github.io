// *******************************************************************************************************************************
// Program name: "Arrays of Floating Point Numbers". This program takes user input's of floating point number and places them into an array.
// Copyright (C) 2025  Chandresh Chavda                                                                                             *
//                                                                                                                               *
// This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License    *
// as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.        *
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty  *
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.                *
// You should have received a copy of the GNU General Public License along with this program. If not, see                       *
// <https://www.gnu.org/licenses/>.                                                                                             *
// *******************************************************************************************************************************

//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
// Author: Chandresh Chavda
// Author email: chav349@csu.fullerton.edu
// CWID: 885158899
// Class: 240-11 Section 11
// Program name: Arrays of Floating Point Numbers
// Programming languages: Two modules in C, six in X86, and one in bash.
// Date program began: 2025-Feb-22
// Date of last update: 2025-Feb-22
// Files in this program: main.c, manager.asm, input_array.asm, output_array.asm, sum.asm, sort.asm, swap.asm, isfloat.asm, run.sh.
// Testing: Alpha testing completed. All functions are correct.
// Status: Ready for release to customers

// Purpose of this program:
//  This program calculates the sum and mean of an array of floating point numbers and sorts the array.
//  This file:
//  File name: main.c
//  Language: C language
//  Max page width: 124 columns
//  Compile: gcc -c -m64 -Wall -no-pie -o main.o main.c -std=c2x
//  Link: gcc -m64 -no-pie -o main.out main.o manager.o input_array.o output_array.o sum.o swap.o sort.o isfloat.o -std=c2x -Wall -z noexecstack
//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3** 


#include <stdio.h>


//declaration for external function
extern double manager();

int main(void)
{
//inform user about the program and author
 printf("Welcome to Arrays of Floating Point Numbers.\n");
 printf("Brought to you by Chandresh Chavda\n");
 
 //call the manager function to start running the program
 double count = manager();
 
 //inform user of the result of the program before bidding farewell
 printf("\nMain has received %.10lf and will keep it for future use.\n",count);
 printf("Main will return 0 to the operating system. Bye.\n");
 return 0;
}