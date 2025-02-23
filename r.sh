# *************************************************************************************************************************
# Program name: "Arrays of Floating Point Numbers"                                                                                         *
# Author name: Chandresh Chavda                                                                                             *
# Author email: chav349@csu.fullerton.edu                                                                                   *
# CWID: 885158899                                                                                                           *
# Class: 240-11 Section 11                                                                                                  *
# Date program modified: 2025-Feb-22                                                                                           *
# Program information:                                                                                                      *
# This file is the script file that accompanies the "Arrays of Floating Point Numbers" program.                                             *
# It prepares the necessary files for execution in normal mode.                                               *
#                                                                                                                           *
# License Information:                                                                                                      *
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
# as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.      *
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.       *
# A copy of the GNU General Public License v3 is available at: https://www.gnu.org/licenses/                                  *
# *************************************************************************************************************************


#Delete some un-needed files
rm -f *.o *.out


# Assemble the x86 Assembly modules

nasm -f elf64 -l isfloat.lis -o isfloat.o isfloat.asm


gcc -c -m64 -Wall -o main.o main.c -fno-pie -no-pie -std=c2x

nasm -f elf64 -l manager.lis -o manager.o manager.asm


nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm


nasm -f elf64 -l sum.lis -o sum.o sum.asm


nasm -f elf64 -l swap.lis -o swap.o swap.asm

nasm -f elf64 -l output_array.lis -o output_array.o output_array.asm



gcc -c -m64 -Wall -o sort.o sort.c -fno-pie -no-pie -std=c2x


gcc -m64 -no-pie -o main.out main.o manager.o input_array.o output_array.o sum.o swap.o sort.o isfloat.o -z noexecstack


chmod +x r.sh
chmod +x main.out
./main.out

