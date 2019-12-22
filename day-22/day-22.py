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
import collections
import itertools
import pprint

pp = pprint.PrettyPrinter(indent=4)
flines = open('day-22-input.txt', 'r').read().splitlines()

def part_one(filen):
    deck = collections.deque(range(10007))

    for l in filen:
        if 'cut' in l:
            splen = int(l.split()[1]) * -1
            deck.rotate(splen)
        elif 'increment' in l:
            nwdck = collections.deque([0] * 10007)
            parts = l.split()
            inpos = int(parts[-1])
            k = 0
            for val in deck:
                nwdck[k] = val
                k = (k + inpos) % 10007
            deck = nwdck.copy()
            nwdck.clear()
        elif 'new stack' in l:
            deck.reverse()
    print(deck.index(2019))

def part_two(filen):
    dsize = 119315717514047
    times = 101741582076661
    def mod_inverse(num, size):
        return pow(num, size - 2, size)
    def obtain_nth(off, inc, i, size):
        return (off + (i * inc)) % size

    offs = 0
    incr = 1
    for l in filen:
        if 'cut' in l:
            splen = int(l.split()[1])
            offs = (offs + (splen * incr)) % dsize
        elif 'increment' in l:
            parts = l.split()
            inpos = int(parts[-1])
            incr = (incr * mod_inverse(inpos, dsize)) % dsize
        elif 'new stack' in l:
            incr = (incr * -1) % dsize
            offs = (offs + incr) % dsize
    iet = pow(incr, times, dsize)
    f = (1 - incr) % dsize
    ofst = (offs * (1 - iet) * mod_inverse(f, dsize)) % dsize
    print(obtain_nth(ofst, iet, 2020, dsize))

part_one(flines) # 4703
part_two(flines) # 55627600867625
