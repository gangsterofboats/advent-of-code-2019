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

##############
# UNFINISHED #
##############



use Array::Utils qw(:all);
use common::sense;
use Data::Dumper;
use v5.30;

sub part_one
{
    my @ipt = @{$_[0]};
    my @wire_one_dirs = split /,/, $ipt[0];
    my @wire_two_dirs = split /,/, $ipt[1];
    my $tst = $wire_one_dirs[0];
    my @wire_one_pts;
    my @wire_two_pts;
    my @curr_pos = (0,0);

    foreach my $d (@wire_one_dirs)
    {
        my $dir = substr($d, 0, 1);
        my $distance = substr($d, 1);

        given ($dir)
        {
            when ('U')
            {
                foreach my $i (1..$distance)
                {
                    $curr_pos[1]++;
                    push(@wire_one_pts, "$curr_pos[0],$curr_pos[1]");
                }
            }
            when ('R')
            {
                foreach my $i (1..$distance)
                {
                    $curr_pos[0]++;
                    push(@wire_one_pts, "$curr_pos[0],$curr_pos[1]");
                }
            }
            when ('D')
            {
                foreach my $i (1..$distance)
                {
                    $curr_pos[1]--;
                    push(@wire_one_pts, "$curr_pos[0],$curr_pos[1]");
                }
            }
            when ('L')
            {
                foreach my $i (1..$distance)
                {
                    $curr_pos[0]--;
                    push(@wire_one_pts, "$curr_pos[0],$curr_pos[1]");
                }
            }
        }
    }

    @curr_pos = (0, 0);
    foreach my $d (@wire_two_dirs)
    {
        my $dir = substr($d, 0, 1);
        my $distance = substr($d, 1);

        given ($dir)
        {
            when ('U')
            {
                foreach my $i (1..$distance)
                {
                    $curr_pos[1]++;
                    push(@wire_two_pts, "$curr_pos[0],$curr_pos[1]");
                }
            }
            when ('R')
            {
                foreach my $i (1..$distance)
                {
                    $curr_pos[0]++;
                    push(@wire_two_pts, "$curr_pos[0],$curr_pos[1]");
                }
            }
            when ('D')
            {
                foreach my $i (1..$distance)
                {
                    $curr_pos[1]--;
                    push(@wire_two_pts, "$curr_pos[0],$curr_pos[1]");
                }
            }
            when ('L')
            {
                foreach my $i (1..$distance)
                {
                    $curr_pos[0]--;
                    push(@wire_two_pts, "$curr_pos[0],$curr_pos[1]");
                }
            }
        }
    }

    my @ntrsctns = intersect(@wire_one_pts, @wire_two_pts);
    my $min_distance = 10000000000000000;
    foreach my $n (@ntrsctns)
    {
        my ($x, $y) = split /,/, $n;
        my $manhattan = abs(0 - $x) + abs (0 - $y);
        if ($manhattan < $min_distance)
        {
            $min_distance = $manhattan;
        }
    }
    say $min_distance;
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

my $filename = 'day-03-input.txt';
open(my $fh, '<', $filename);
my @fl = <$fh>;
close $fh;
chomp(@fl);

part_one(\@fl); # 870
# part_two(\@fl); # 13698
