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
use common::sense;
use Data::Dumper;
use v5.30;

# Function definition

sub part_one
{
    my ($s, $e) = @_;
    my $valid_pass = 0;
    my @digits = ('0'..'9');
    my $dubs = 0; # false
    my $increasing = 0; # false

    foreach my $n ($s..$e)
    {
        my @ns = split //, $n;
        my @xs = sort {$a <=> $b} @ns;

        foreach my $c (@digits)
        {
            if (index($n, $c x 2) != -1)
            {
                $dubs = 1; # true
                last if $dubs;
            }
            else
            {
                $dubs = 0; # false
            }
        }
        if (@ns ~~ @xs)
        {
            $increasing = 1; # true
        }
        else
        {
            $increasing = 0; # false
        }
        if ($dubs && $increasing)
        {
            $valid_pass++;
        }
    }
    say $valid_pass;
}

sub part_two
{
    my ($s, $e) = @_;
    my $valid_pass = 0;
    my @digits = ('0'..'9');
    my $dubs = 0; # false
    my $increasing = 0; # false

    foreach my $n ($s..$e)
    {
        my @ns = split //, $n;
        my @xs = sort {$a <=> $b} @ns;

        foreach my $c (@digits)
        {
            if ((index($n, $c x 2) != -1) && (index($n, $c x 3) == -1))
            {
                $dubs = 1; # true
                last if $dubs;
            }
            else
            {
                $dubs = 0; # false
            }
        }
        if (@ns ~~ @xs)
        {
            $increasing = 1; # true
        }
        else
        {
            $increasing = 0; # false
        }
        if ($dubs && $increasing)
        {
            $valid_pass++;
        }
    }
    say $valid_pass;
}

# Main part

# Given input
my $start = 273025;
my $end = 767253;

part_one($start, $end); # 910
part_two($start, $end); # 598
