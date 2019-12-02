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
import collections
import itertools
import math
import pprint

pp = pprint.PrettyPrinter(indent=4)
fllst = open('day-02-input.txt', 'r').read().split(',')
fllst[-1] = fllst[-1].rstrip()
fl = [int(i) for i in fllst]

def part_one(input):
    ipt = input.copy()
    ipt[1] = 12
    ipt[2] = 2
    ptr = 0
    pos_f = 0
    pos_s = 0
    pos_t = 0

    while ipt[ptr] != 99:
        if ipt[ptr] == 1:
            pos_f = ipt[ptr + 1]
            pos_s = ipt[ptr + 2]
            pos_t = ipt[ptr + 3]
            ipt[pos_t] = ipt[pos_f] + ipt[pos_s]
        elif ipt[ptr] == 2:
            pos_f = ipt[ptr + 1]
            pos_s = ipt[ptr + 2]
            pos_t = ipt[ptr + 3]
            ipt[pos_t] = ipt[pos_f] * ipt[pos_s]
        ptr += 4
    print(ipt[0])

def part_two(input):
    for i in range(0,100):
        for j in range(0,100):
            ipt = input.copy()
            ipt[1] = i
            ipt[2] = j
            ptr = 0
            pos_f = 0
            pos_s = 0
            pos_t = 0

            while ipt[ptr] != 99:
                if ipt[ptr] == 1:
                    pos_f = ipt[ptr + 1]
                    pos_s = ipt[ptr + 2]
                    pos_t = ipt[ptr + 3]
                    ipt[pos_t] = ipt[pos_f] + ipt[pos_s]
                elif ipt[ptr] == 2:
                    pos_f = ipt[ptr + 1]
                    pos_s = ipt[ptr + 2]
                    pos_t = ipt[ptr + 3]
                    ipt[pos_t] = ipt[pos_f] * ipt[pos_s]
                ptr += 4
            if ipt[0] == 19690720:
                print(f'{(i * 100) + j}')
                break

part_one(fl) # 4570637
part_two(fl) # 5485
