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

# Function definition

def part_one(puzz_input)
  layers = puzz_input.each_slice(150).to_a
  zeros = []

  layers.each do |layer|
    zeros.push(layer.count(0))
  end
  lz = zeros.rindex(zeros.min)
  puts(layers[lz].count(1) * layers[lz].count(2))
end

def part_two(puzz_input)
  layers = puzz_input.each_slice(150).to_a
  image = [-1] * 150

  (0..99).each do |y_axis|
    (0..149).each do |x_axis|
      if layers[y_axis][x_axis] != 2 and image[x_axis] != 1 and image[x_axis] != 0
        image[x_axis] = layers[y_axis][x_axis]
      end
    end
  end
  img = image.each_slice(25).to_a
  img.each do |line|
    l = ''
    line.each do |c|
      if c == 1
        l += '#'
      else
        l += ' '
      end
    end
    puts l
  end
end

# Main program

fl = File.read('day-08-input.txt').chomp.split('').map(&:to_i)

part_one(fl) # 2500
part_two(fl) # CYUAH
