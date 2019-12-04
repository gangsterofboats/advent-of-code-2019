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

def part_one(s, e)
  valid_pass = 0
  digits = ('0'..'9').to_a
  dubs = false
  increasing = false

  (s..e).each do |n|
    ns = n.to_s.split('')

    digits.each do |c|
      if n.to_s.include? c*2
        dubs = true
        break
      else
        dubs = false
      end
    end
    if ns == ns.sort
      increasing = true
    else
      increasing = false
    end
    if dubs and increasing
      valid_pass += 1
    end
  end
  puts valid_pass
end

def part_two(s, e)
  valid_pass = 0
  digits = ('0'..'9').to_a
  dubs = false
  increasing = false

  (s..e).each do |n|
    ns = n.to_s.split('')

    digits.each do |c|
      if n.to_s.include? c*2 and not n.to_s.include? c*3
        dubs = true
        break
      else
        dubs = false
      end
    end
    if ns == ns.sort
      increasing = true
    else
      increasing = false
    end
    if dubs and increasing
      valid_pass += 1
    end
  end
  puts valid_pass
end

# Main part

# Given input
strt = 273025
nd = 767253

part_one(strt, nd) # 910
part_two(strt, nd) # 598
