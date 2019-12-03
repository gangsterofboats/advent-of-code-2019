#!/usr/bin/env ruby
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
require 'pp'

# Function definitions

def part_one(input)
    wire_one_dirs = input[0].split(',')
    wire_two_dirs = input[1].split(',')
    wire_one_pts = []
    wire_two_pts = []
    curr_pos = [0,0]

    wire_one_dirs.each do |d|
      dir = d[0]
      distance = d[1..-1].to_i
      case dir
      when 'U'
        (1..distance).each do |i|
          curr_pos[1] += 1
          wire_one_pts.push([curr_pos[0], curr_pos[1]])
        end
      when 'R'
        (1..distance).each do |i|
          curr_pos[0] += 1
          wire_one_pts.push([curr_pos[0], curr_pos[1]])
        end
      when 'D'
        (1..distance).each do |i|
          curr_pos[1] -= 1
          wire_one_pts.push([curr_pos[0], curr_pos[1]])
        end
      when 'L'
        (1..distance).each do |i|
          curr_pos[0] -= 1
          wire_one_pts.push([curr_pos[0], curr_pos[1]])
        end
      end
    end

    curr_pos = [0,0]
    wire_two_dirs.each do |d|
      dir = d[0]
      distance = d[1..-1].to_i
      case dir
      when 'U'
        (1..distance).each do |i|
          curr_pos[1] += 1
          wire_two_pts.push([curr_pos[0], curr_pos[1]])
        end
      when 'R'
        (1..distance).each do |i|
          curr_pos[0] += 1
          wire_two_pts.push([curr_pos[0], curr_pos[1]])
        end
      when 'D'
        (1..distance).each do |i|
          curr_pos[1] -= 1
          wire_two_pts.push([curr_pos[0], curr_pos[1]])
        end
      when 'L'
        (1..distance).each do |i|
          curr_pos[0] -= 1
          wire_two_pts.push([curr_pos[0], curr_pos[1]])
        end
      end
    end

    ntrsctns = (wire_one_pts & wire_two_pts)
    min_dist = 1.0/0 # Infinity
    ntrsctns.each do |x|
      dt = (0 - x[0]).abs + (0 - x[1]).abs
      if dt < min_dist
        min_dist = dt
      end
    end

    puts min_dist
end

def part_two(input)
  wire_one_dirs = input[0].split(',')
  wire_two_dirs = input[1].split(',')
  wire_one_pts = []
  wire_two_pts = []
  curr_pos = [0,0]
  grid = {}
  steps = 0

  wire_one_dirs.each do |d|
    dir = d[0]
    distance = d[1..-1].to_i
    case dir
    when 'U'
      (1..distance).each do |i|
        curr_pos[1] += 1
        steps += 1
        if not grid.key?(curr_pos.to_s)
          grid[curr_pos] = steps
        end
      end
    when 'R'
      (1..distance).each do |i|
        curr_pos[0] += 1
        steps += 1
        if not grid.key?(curr_pos.to_s)
          grid[curr_pos.to_s] = steps
        end
      end
    when 'D'
      (1..distance).each do |i|
        curr_pos[1] -= 1
        steps += 1
        if not grid.key?(curr_pos.to_s)
          grid[curr_pos.to_s] = steps
        end
      end
    when 'L'
      (1..distance).each do |i|
        curr_pos[0] -= 1
        steps += 1
        if not grid.key?(curr_pos.to_s)
          grid[curr_pos.to_s] = steps
        end
      end
    end
  end

  curr_pos = [0,0]
  steps = 0
  ntrsctns = []
  wire_two_dirs.each do |d|
    dir = d[0]
    distance = d[1..-1].to_i
    case dir
    when 'U'
      (1..distance).each do |i|
        curr_pos[1] += 1
        steps += 1
        if grid.key?(curr_pos.to_s)
          ntrsctns.push(steps + grid[curr_pos.to_s])
        end
      end
    when 'R'
      (1..distance).each do |i|
        curr_pos[0] += 1
        steps += 1
        if grid.key?(curr_pos.to_s)
          ntrsctns.push(steps + grid[curr_pos.to_s])
        end
      end
    when 'D'
      (1..distance).each do |i|
        curr_pos[1] -= 1
        steps += 1
        if grid.key?(curr_pos.to_s)
          ntrsctns.push(steps + grid[curr_pos.to_s])
        end
      end
    when 'L'
      (1..distance).each do |i|
        curr_pos[0] -= 1
        steps += 1
        if grid.key?(curr_pos.to_s)
          ntrsctns.push(steps + grid[curr_pos.to_s])
        end
      end
    end
  end
  puts ntrsctns.min
end

# Open input
fl = File.readlines('day-03-input.txt').map(&:chomp)

# Run functions
part_one(fl) # 870
part_two(fl) # 13698
