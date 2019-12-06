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
import networkx as nx
import pprint

pp = pprint.PrettyPrinter(indent=4)

# Function definition

def part_one(puzz_input):
    orbits = nx.DiGraph()

    for l in puzz_input:
        p, s = l.split(')')
        orbits.add_edge(p, s)
    print(nx.transitive_closure(orbits).size())

def part_two(puzz_input):
    orbits = nx.Graph()

    for l in puzz_input:
        p, s = l.split(')')
        orbits.add_edge(p, s)
    print(nx.shortest_path_length(orbits, 'YOU', 'SAN') - 2)

# Main program

fllst = open('day-06-input.txt', 'r').read().splitlines()

part_one(fllst) # 261306
part_two(fllst) # 382
