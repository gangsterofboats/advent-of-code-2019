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
use POSIX;
use v5.30;

sub part_one
{
    my @input = @{$_[0]};
    my $sum_fuel = 0;

    for my $m (@input)
    {
        $sum_fuel += (POSIX::floor($m/3) - 2);
    }
    say $sum_fuel;
}

sub part_two
{
    my @input = @{$_[0]};
    my $sum_fuel = 0;

    for my $m (@input)
    {
        while ($m > 0)
        {
            $m = (POSIX::floor($m/3) - 2);
            $sum_fuel += $m if $m > 0;
        }
    }
    say $sum_fuel;
}

my $filename = 'day-01-input.txt';
open(my $fh, '<', $filename);
my @fl = <$fh>;
close $fh;
chomp(@fl);

part_one(\@fl); # 3455717
part_two(\@fl); # 5180690
