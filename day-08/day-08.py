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
import numpy
import pprint

pp = pprint.PrettyPrinter(indent=4)

# Function definition

def part_one(puzz_input):
    ipt = list(map(int, puzz_input))
    layers = numpy.array(ipt).reshape([-1, 150])
    zeros = []

    for layer in layers:
        zeros.append(numpy.count_nonzero(layer==0))
    lz = numpy.argmin(zeros)
    print(numpy.count_nonzero(layers[lz] == 1) * numpy.count_nonzero(layers[lz] == 2))

def part_two(puzz_input):
    ipt = list(map(int, puzz_input))
    layers = numpy.array(ipt).reshape([-1, 150])
    layer = numpy.argmax(layers < 2, axis = 0)
    image = numpy.array([layers[y, x] for x, y in enumerate(layer)]).reshape([6,25])
    for line in image:
        print(''.join(['#' if i == 1 else ' ' for i in line]))

# Main program

fl = open('day-08-input.txt', 'r').read().strip()

part_one(fl) # 2500
part_two(fl) # CYUAH
