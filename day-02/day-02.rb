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

fl = File.read('day-02-input.txt').chomp.split(',').map(&:to_i)

def part_one(input)
  ipt = input.dup
  ipt[1] = 12
  ipt[2] = 2
  ptr = 0
  pos_f = 0
  pos_s = 0
  pos_t = 0

  while ipt[ptr] != 99
    if ipt[ptr] == 1
      pos_f = ipt[ptr + 1]
      pos_s = ipt[ptr + 2]
      pos_t = ipt[ptr + 3]
      ipt[pos_t] = ipt[pos_f] + ipt[pos_s]
    elsif ipt[ptr] == 2
      pos_f = ipt[ptr + 1]
      pos_s = ipt[ptr + 2]
      pos_t = ipt[ptr + 3]
      ipt[pos_t] = ipt[pos_f] * ipt[pos_s]
    end
    ptr += 4
  end
  puts ipt[0]
end

def part_two(input)
  (0..99).each do |noun|
    (0..99).each do |verb|
      ipt = input.dup
      ipt[1] = noun
      ipt[2] = verb
      ptr = 0
      pos_f = 0
      pos_s = 0
      pos_t = 0

      while ipt[ptr] != 99
        if ipt[ptr] == 1
          pos_f = ipt[ptr + 1]
          pos_s = ipt[ptr + 2]
          pos_t = ipt[ptr + 3]
          ipt[pos_t] = ipt[pos_f] + ipt[pos_s]
        elsif ipt[ptr] == 2
          pos_f = ipt[ptr + 1]
          pos_s = ipt[ptr + 2]
          pos_t = ipt[ptr + 3]
          ipt[pos_t] = ipt[pos_f] * ipt[pos_s]
        end
        ptr += 4
      end
      if ipt[0] == 19690720
        print("#{(noun * 100) + verb}")
        break
      end
    end
  end
end

part_one(fl) # 4570637
part_two(fl) # 5485
