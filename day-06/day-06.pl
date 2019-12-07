#!/usr/bin/env perl
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
use Array::Utils qw(:all);
use common::sense;
use Data::Dumper;
use Graph;
use Graph::Directed;
use Graph::TransitiveClosure;
use v5.30;

# Function definition

sub part_one
{
    my @puzz_input = @{$_[0]};
    my $orbits = Graph::Directed->new;

    for my $line (@puzz_input)
    {
        my ($p, $s) = split /\)/, $line;
        $orbits->add_edge($p, $s);
    }
    say scalar $orbits->TransitiveClosure_Floyd_Warshall;
}

sub part_two
{
    my @puzz_input = @{$_[0]};
    my $orbits = Graph->new;

    for my $line (@puzz_input)
    {
        my ($p, $s) = split /\)/, $line;
        $orbits->add_edge($p, $s);
    }
    my @s = $orbits->SP_Dijkstra('COM', 'SAN');
    my @y = $orbits->SP_Dijkstra('COM', 'YOU');
    say((scalar array_diff(@s, @y)) - 2);
}

# Open input file

my $filename = 'day-06-input.txt';
open(my $fh, '<', $filename);
my @fl = <$fh>;
close $fh;
chomp(@fl);

# Main program

part_one(\@fl); # 261306
part_two(\@fl); # 382
