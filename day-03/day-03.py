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
fl = open('day-03-input.txt', 'r').read().splitlines()

def part_one(input):
    wire_one_dirs = input[0].split(',')
    wire_two_dirs = input[1].split(',')
    wire_one_pts = set()
    wire_two_pts = set()
    curr_pos = [0,0]

    for d in wire_one_dirs:
        dir = d[0]
        distance = int(d[1:])
        if dir == 'U':
            for i in range(0, distance):
                curr_pos[1] += 1
                wire_one_pts.add((curr_pos[0], curr_pos[1]))
        elif dir == 'R':
            for i in range(0, distance):
                curr_pos[0] += 1
                wire_one_pts.add((curr_pos[0], curr_pos[1]))
        elif dir == 'D':
            for i in range(0, distance):
                curr_pos[1] -= 1
                wire_one_pts.add((curr_pos[0], curr_pos[1]))
        elif dir == 'L':
            for i in range(0, distance):
                curr_pos[0] -= 1
                wire_one_pts.add((curr_pos[0], curr_pos[1]))

    curr_pos = [0,0]
    for d in wire_two_dirs:
        dir = d[0]
        distance = int(d[1:])
        if dir == 'U':
            for i in range(0, distance):
                curr_pos[1] += 1
                wire_two_pts.add((curr_pos[0], curr_pos[1]))
        elif dir == 'R':
            for i in range(0, distance):
                curr_pos[0] += 1
                wire_two_pts.add((curr_pos[0], curr_pos[1]))
        elif dir == 'D':
            for i in range(0, distance):
                curr_pos[1] -= 1
                wire_two_pts.add((curr_pos[0], curr_pos[1]))
        elif dir == 'L':
            for i in range(0, distance):
                curr_pos[0] -= 1
                wire_two_pts.add((curr_pos[0], curr_pos[1]))

    ntrsctns = (wire_one_pts & wire_two_pts)
    min_dist = 100000000000000
    for x in ntrsctns:
        dt = abs(0 - x[0]) + abs(0 - x[1])
        if dt < min_dist:
            min_dist = dt
    print(min_dist)

def part_two(input):
    wire_one_dirs = input[0].split(',')
    wire_two_dirs = input[1].split(',')
    wire_one_pts = set()
    wire_two_pts = set()
    curr_pos = [0,0]
    grid = {}
    steps = 0

    for d in wire_one_dirs:
        dir = d[0]
        distance = int(d[1:])
        if dir == 'U':
            for i in range(0, distance):
                curr_pos[1] += 1
                steps += 1
                if not tuple(curr_pos) in grid:
                    grid[tuple(curr_pos)] = steps
        elif dir == 'R':
            for i in range(0, distance):
                curr_pos[0] += 1
                steps += 1
                if not tuple(curr_pos) in grid:
                    grid[tuple(curr_pos)] = steps
        elif dir == 'D':
            for i in range(0, distance):
                curr_pos[1] -= 1
                steps += 1
                if not tuple(curr_pos) in grid:
                    grid[tuple(curr_pos)] = steps
        elif dir == 'L':
            for i in range(0, distance):
                curr_pos[0] -= 1
                steps += 1
                if not tuple(curr_pos) in grid:
                    grid[tuple(curr_pos)] = steps

    curr_pos = [0,0]
    steps = 0
    ntrsctns = []
    for d in wire_two_dirs:
        dir = d[0]
        distance = int(d[1:])
        if dir == 'U':
            for i in range(0, distance):
                curr_pos[1] += 1
                steps += 1
                if tuple(curr_pos) in grid:
                    ntrsctns.append(steps+grid[tuple(curr_pos)])
        elif dir == 'R':
            for i in range(0, distance):
                curr_pos[0] += 1
                steps += 1
                if tuple(curr_pos) in grid:
                    ntrsctns.append(steps+grid[tuple(curr_pos)])
        elif dir == 'D':
            for i in range(0, distance):
                curr_pos[1] -= 1
                steps += 1
                if tuple(curr_pos) in grid:
                    ntrsctns.append(steps+grid[tuple(curr_pos)])
        elif dir == 'L':
            for i in range(0, distance):
                curr_pos[0] -= 1
                steps += 1
                if tuple(curr_pos) in grid:
                    ntrsctns.append(steps+grid[tuple(curr_pos)])
    print(min(ntrsctns))

part_one(fl) # 870
part_two(fl) # 13698
