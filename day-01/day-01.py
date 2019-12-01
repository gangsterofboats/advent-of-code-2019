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
fllst = open('day-01-input.txt', 'r').read().splitlines()
fl = [int(i) for i in fllst]

def part_one(filen):
    sum_fuel = 0
    for m in filen:
        sum_fuel += (m//3 - 2)
    print(sum_fuel)

def part_two(filen):
    sum_fuel = 0
    for m in filen:
        while (m := m//3 - 2) > 0:
            sum_fuel += m
    print(sum_fuel)

part_one(fl) # 3455717
part_two(fl) # 5180690
