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

##############
# UNFINISHED #
##############



import pprint
from itertools import permutations

pp = pprint.PrettyPrinter(indent=4)

# Function definition

def intcode_machine(tape, phs_sttng, npt_sgnl):
    ptr = 0
    ipt = tape.copy()
    inputs = [npt_sgnl, phs_sttng]

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
            if len(inputs) != 0:
                ipt[ipt[ptr + 1]] = inputs.pop()
            else:
                stv = input('Enter input value: ')
                ipt[ipt[ptr + 1]] = stv
            ptr += 2
        elif op_code[3:] == '04':
            otpt = ipt[ipt[ptr + 1]] if op_code[2] == '0' else ipt[ptr + 1]
            ptr += 2
            return(otpt)
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

def part_one(puzz_input):
    phase_sets = list(permutations(range(0,5)))
    signal_outputs = []

    for phase_setting in phase_sets:
        input_signal = 0
        for phase in phase_setting:
            input_signal = intcode_machine(puzz_input, phase, input_signal)
        signal_outputs.append(input_signal)
    print(max(signal_outputs))

def part_two(puzz_input):
    phase_sets = list(permutations(range(5,10)))
    signal_outputs = []
    signal_states = {'A': [], 'B': [], 'C': [], 'D': [], 'E': []}

    for phase_setting in phase_sets:
        input_signal = 0
        for phase in phase_setting:
            input_signal = intcode_machine(puzz_input, phase, input_signal)
        signal_outputs.append(input_signal)
    print(max(signal_outputs))

# Main program

fl = open('day-07-input.txt', 'r').read().split(',')
fl[-1] = fl[-1].strip()
fl = list(map(int, fl))

part_one(fl) # 19650
# part_two(fl) # 35961106
