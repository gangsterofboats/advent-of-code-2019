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
use File::Slurp;
use v5.30;

sub part_one
{
    my @ipt = @{$_[0]};
    $ipt[1] = 12;
    $ipt[2] = 2;
    my $ptr = 0;
    my $pos_f = 0;
    my $pos_s = 0;
    my $pos_t = 0;

    while ($ipt[$ptr] != 99)
    {
        if ($ipt[$ptr] == 1)
        {
            $pos_f = $ipt[$ptr + 1];
            $pos_s = $ipt[$ptr + 2];
            $pos_t = $ipt[$ptr + 3];
            $ipt[$pos_t] = $ipt[$pos_f] + $ipt[$pos_s];
        }
        elsif ($ipt[$ptr] == 2)
        {
            $pos_f = $ipt[$ptr + 1];
            $pos_s = $ipt[$ptr + 2];
            $pos_t = $ipt[$ptr + 3];
            $ipt[$pos_t] = $ipt[$pos_f] * $ipt[$pos_s];
        }
        $ptr += 4;
    }
    say($ipt[0]);
}

sub part_two
{
    foreach my $noun (0..99)
    {
        foreach my $verb (0..99)
        {
            my @ipt = @{$_[0]};
            $ipt[1] = $noun;
            $ipt[2] = $verb;
            my $ptr = 0;
            my $pos_f = 0;
            my $pos_s = 0;
            my $pos_t = 0;

            while ($ipt[$ptr] != 99)
            {
                if ($ipt[$ptr] == 1)
                {
                    $pos_f = $ipt[$ptr + 1];
                    $pos_s = $ipt[$ptr + 2];
                    $pos_t = $ipt[$ptr + 3];
                    $ipt[$pos_t] = $ipt[$pos_f] + $ipt[$pos_s];
                }
                elsif ($ipt[$ptr] == 2)
                {
                    $pos_f = $ipt[$ptr + 1];
                    $pos_s = $ipt[$ptr + 2];
                    $pos_t = $ipt[$ptr + 3];
                    $ipt[$pos_t] = $ipt[$pos_f] * $ipt[$pos_s];
                }
                $ptr += 4;
            }
            if ($ipt[0] == 19690720)
            {
                say (($noun * 100) + $verb);
            }
        }
    }
}

my $filename = 'day-02-input.txt';
my $fl = read_file($filename);
my @input = split /,/, $fl;

part_one(\@input); # 4570637
part_two(\@input); # 5485
