#!/usr/bin/env python
################################################################################
# Copyright (C) 2019 Michael Wiseman                                           #
#                                                                              #
# This program is free software: you can redistribute it and/or modify it      #
# under the terms of the GNU Affero General Public License as published by the #
# Free Software Foundation, either version 3 of the License, or (at your       #
# option) any later version.                                                   #
#                                                                              #
# This program is distributed in the hope that it will be useful, but WITHOUT  #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        #
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License #
# for more details.                                                            #
#                                                                              #
# You should have received a copy of the GNU Affero General Public License     #
# along with this program.  If not, see <https://www.gnu.org/licenses/>.       #
################################################################################

import pprint

pp = pprint.PrettyPrinter(indent=4)

# Function definition

def part_one(tape):
    ptr = 0
    ipt = tape.copy()

    while ipt[ptr] != 99:
        op_code = f'{ipt[ptr]:05}'
        if op_code[3:] == '01':
            f = ipt[ipt[ptr + 1]] if op_code[2] == '0' else ipt[ptr + 1]
            s = ipt[ipt[ptr + 2]] if op_code[1] == '0' else ipt[ptr + 2]
            t = ipt[ptr + 3]
            ipt[t] = f + s
            ptr += 4
        elif op_code[3:] == '02':
            f = ipt[ipt[ptr + 1]] if op_code[2] == '0' else ipt[ptr + 1]
            s = ipt[ipt[ptr + 2]] if op_code[1] == '0' else ipt[ptr + 2]
            t = ipt[ptr + 3]
            ipt[t] = f * s
            ptr += 4
        elif op_code[3:] == '03':
            stv = input('Enter input value: ')
            ipt[ipt[ptr + 1]] = int(stv)
            ptr += 2
        elif op_code[3:] == '04':
            print(ipt[ipt[ptr + 1]])
            ptr += 2

def part_two(tape):
    ptr = 0
    ipt = tape.copy()

    while ipt[ptr] != 99:
        op_code = f'{ipt[ptr]:05}'
        if op_code[3:] == '01':
            f = ipt[ipt[ptr + 1]] if op_code[2] == '0' else ipt[ptr + 1]
            s = ipt[ipt[ptr + 2]] if op_code[1] == '0' else ipt[ptr + 2]
            t = ipt[ptr + 3]
            ipt[t] = f + s
            ptr += 4
        elif op_code[3:] == '02':
            f = ipt[ipt[ptr + 1]] if op_code[2] == '0' else ipt[ptr + 1]
            s = ipt[ipt[ptr + 2]] if op_code[1] == '0' else ipt[ptr + 2]
            t = ipt[ptr + 3]
            ipt[t] = f * s
            ptr += 4
        elif op_code[3:] == '03':
            stv = input('Enter input value: ')
            ipt[ipt[ptr + 1]] = int(stv)
            ptr += 2
        elif op_code[3:] == '04':
            print(ipt[ipt[ptr + 1]])
            ptr += 2
        elif op_code[3:] == '05':
            f = ipt[ipt[ptr + 1]] if op_code[2] == '0' else ipt[ptr + 1]
            s = ipt[ipt[ptr + 2]] if op_code[1] == '0' else ipt[ptr + 2]
            ptr = s if f != 0 else ptr + 3
        elif op_code[3:] == '06':
            f = ipt[ipt[ptr + 1]] if op_code[2] == '0' else ipt[ptr + 1]
            s = ipt[ipt[ptr + 2]] if op_code[1] == '0' else ipt[ptr + 2]
            ptr = s if f == 0 else ptr + 3
        elif op_code[3:] == '07':
            f = ipt[ipt[ptr + 1]] if op_code[2] == '0' else ipt[ptr + 1]
            s = ipt[ipt[ptr + 2]] if op_code[1] == '0' else ipt[ptr + 2]
            t = ipt[ptr + 3]
            ipt[t] = 1 if f < s else 0
            ptr += 4
        elif op_code[3:] == '08':
            f = ipt[ipt[ptr + 1]] if op_code[2] == '0' else ipt[ptr + 1]
            s = ipt[ipt[ptr + 2]] if op_code[1] == '0' else ipt[ptr + 2]
            t = ipt[ptr + 3]
            ipt[t] = 1 if f == s else 0
            ptr += 4

# Main program

fl = open('day-05-input.txt', 'r').read().split(',')
fl[-1] = fl[-1].strip()
fl = list(map(int, fl))

part_one(fl) # 10987514
part_two(fl) # 14195011
