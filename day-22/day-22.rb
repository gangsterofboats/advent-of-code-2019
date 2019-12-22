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

flines = File.readlines('day-22-input.txt').map(&:chomp)

def part_one(filen)
  deck = (0..10006).to_a

  filen.each do |line|
    if line.include? 'cut'
      r = line.split[1].to_i
      deck.rotate!(r)
    elsif line.include? 'increment'
      ndeck = [-1] * 10007
      parts = line.split
      incr_pos = parts[-1].to_i
      cur_pos = 0
      deck.each do |val|
        ndeck[cur_pos] = val
        cur_pos = (cur_pos + incr_pos) % 10007
      end
      deck = ndeck.clone
      ndeck.clear
    elsif line.include? 'new stack'
      deck.reverse!
    end
  end

  puts deck.index(2019)
end

def part_two(filen)
  deck = 119315717514047
  repeat = 101741582076661
  def inverse_mod(number, size)
    return number.pow(size - 2, size)
  end
  def obtain_nth(offset, increment, integer, size)
    return (offset + (integer * increment)) % size
  end

  off = 0
  inc = 1
  filen.each do |line|
    if line.include? 'cut'
      r = line.split[1].to_i
      off = (off + (r * inc)) % deck
    elsif line.include? 'increment'
      parts = line.split
      ipos = parts[-1].to_i
      inc = (inc * inverse_mod(ipos, deck)) % deck
    elsif line.include? 'new stack'
      inc = (inc * -1) % deck
      off = (off + inc) % deck
    end
  end
  incr = inc.pow(repeat, deck)
  f = (1 - inc) % deck
  offs = (off * (1 - incr) * inverse_mod(f, deck)) % deck
  puts obtain_nth(offs, incr, 2020, deck)
end

part_one(flines) # 4703
part_two(flines) # 55627600867625
