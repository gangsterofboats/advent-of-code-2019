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
import string

pp = pprint.PrettyPrinter(indent=4)


# Function definition

def part_one(start, end):
    valid_pass = 0

    for n in range(start, end + 1):
        ns = list(str(n))
        xs = list(str(n))
        xs.sort(key=int)

        for c in string.digits:
            if c*2 in str(n):
                dubs = True
                break
            else:
                dubs = False
        if ns == xs:
            increasing = True
        else:
            increasing = False
        if dubs and increasing:
            valid_pass += 1
    print(valid_pass)

def part_two(start, end):
    valid_pass = 0

    for n in range(start, end + 1):
        ns = list(str(n))
        xs = list(str(n))
        xs.sort(key=int)

        for c in string.digits:
            if c*2 in str(n) and not c*3 in str(n):
                dubs = True
                break
            else:
                dubs = False
        if ns == xs:
            increasing = True
        else:
            increasing = False
        if dubs and increasing:
            valid_pass += 1
    print(valid_pass)

# Main part

# Given input
s = 273025
e = 767253

part_one(s, e) # 910
part_two(s, e) # 598
