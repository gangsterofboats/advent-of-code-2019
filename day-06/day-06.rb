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
require 'rgl/adjacency'
require 'rgl/dijkstra'
require 'rgl/transitivity'
require 'set'

# Function definition

def planet_chain(satellite, plan_paths)
  if plan_paths.key? plan_paths[satellite]
    return [plan_paths[satellite]] + planet_chain(plan_paths[satellite],plan_paths)
  else
    return []
  end
end

def part_one(puzz_input)
  orbits = {}

  puzz_input.each do |line|
    p, s = line.split(')')
    orbits[s] = p
  end

  paths = 0
  orbits.each do |k,v|
    paths = planet_chain(k, orbits).length + paths + 1
  end
  puts paths

  # orbits = RGL::DirectedAdjacencyGraph.new

  # puzz_input.each do |line|
    # p, s = line.split(')')
    # orbits.add_edge(p, s)
  # end
  # puts orbits.transitive_closure.size # Does not work for some reason
end

def part_two(puzz_input)
  orbits = RGL::DirectedAdjacencyGraph.new

  edge_weights = {}
  puzz_input.each do |line|
    p, s = line.split(')')
    orbits.add_edge(p, s)
    edge_weights[[p,s]] = 1
  end
  s = orbits.dijkstra_shortest_path(edge_weights, 'COM', 'SAN').to_set
  y = orbits.dijkstra_shortest_path(edge_weights, 'COM', 'YOU').to_set
  puts (s ^ y).length - 2
end

# Main program

fl = File.readlines('day-06-input.txt').map(&:chomp)

part_one(fl) # 261306
part_two(fl) # 382
