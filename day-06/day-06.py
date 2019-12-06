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

def planet_chain(satellite, plan_paths):
    if plan_paths[satellite] in plan_paths:
        return [plan_paths[satellite]]+planet_chain(plan_paths[satellite],plan_paths)
    else:
        return []

def part_one(puzz_input):
    orbits = {}

    for l in puzz_input:
        p, s = l.split(')')
        orbits[s] = p

    paths = 0
    for sat in orbits:
        paths = len(planet_chain(sat, orbits)) + paths + 1
    print(paths)

def part_two(puzz_input):
    orbits = {}

    for l in puzz_input:
        p, s = l.split(')')
        orbits[s] = p
    frm = set(planet_chain('YOU', orbits))
    tow = set(planet_chain('SAN', orbits))
    print(len(frm ^ tow))

# Main program

fllst = open('day-06-input.txt', 'r').read().splitlines()

part_one(fllst) # 261306
part_two(fllst) # 382
