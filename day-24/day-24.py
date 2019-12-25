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
import numpy

##############
# UNFINISHED #
##############

# Function definition
def part_one(filen):
    states = []
    init_state = ''.join(filen)
    states.append(init_state)
    curr_state = numpy.array(list(init_state))
    curr_state.shape = (5,5)
    repeated_state = -1

    while True:
        next_state = numpy.zeros((5,5), dtype=numpy.str)
        for y in range(5):
            for x in range(5):
                curr_tile = curr_state[y,x]
                bugs = 0
                if x == 0:
                    bugs += 1 if curr_state[y,x+1] == '#' else 0
                elif x == 4:
                    bugs += 1 if curr_state[y,x-1] == '#' else 0
                else:
                    bugs += 1 if curr_state[y,x+1] == '#' else 0
                    bugs += 1 if curr_state[y,x-1] == '#' else 0
                if y == 0:
                    bugs += 1 if curr_state[y+1,x] == '#' else 0
                elif y == 4:
                    bugs += 1 if curr_state[y-1,x] == '#' else 0
                else:
                    bugs += 1 if curr_state[y+1,x] == '#' else 0
                    bugs += 1 if curr_state[y-1,x] == '#' else 0
                if curr_tile == '#' and bugs == 1:
                    next_state[y,x] = '#'
                elif curr_tile == '.' and (bugs == 1 or bugs == 2):
                    next_state[y,x] = '#'
                else:
                    next_state[y,x] = '.'
        n_state_s = ''.join(''.join(s for s in row) for row in next_state)
        if n_state_s in states:
            repeated_state = states.index(n_state_s)
            break
        else:
            states.append(n_state_s)
            curr_state = numpy.copy(next_state)
    sum = 0
    r_state = list(states[repeated_state])
    for index, val in enumerate(r_state):
        if val == '#':
            sum += 2**index
    print(sum)

# def part_two(filen):

# Import input
pp = pprint.PrettyPrinter(indent=4)
flines = open('day-24-input.txt', 'r').read().splitlines()

# Main program
part_one(flines) # 18400817
# part_two(flines) # 1944
