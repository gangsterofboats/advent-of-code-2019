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

fl = File.readlines('day-01-input.txt').map(&:chomp).map(&:to_i)

def part_one(input)
  sum_fuel = 0
  input.each do |m|
    sum_fuel += ((m/3).floor - 2)
  end
  puts sum_fuel
end

def part_two(input)
  sum_fuel = 0
  input.each do |m|
    while m > 0
      m = (m/3 - 2)
      sum_fuel += m if m > 0
    end
  end
  puts sum_fuel
end

part_one(fl) # 3455717
part_two(fl) # 5180690
