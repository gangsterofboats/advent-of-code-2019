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
use bigint;
use common::sense;
use Data::Dumper;
use List::MoreUtils qw(first_index);
use v5.30;

##############
# UNFINISHED #
##############

# Function definition

sub part_one
{
    my @input = @{$_[0]};
    my @deck = (0..10006);

    sub rotate
    {
        my ($list, $n) = @_;
        push @$list, splice @$list, 0, $n;
    }

    for my $line (@input)
    {
        if (index($line, 'cut') != -1)
        {
            my ($first, $r) = split(' ', $line);
            rotate(\@deck, $r);
        }
        elsif (index($line, 'increment') != -1)
        {
            my @new_deck = (-1) x 10007;
            my @parts = split(' ', $line);
            my $jump = $parts[-1];
            my $cur_pos = 0;
            for my $val (@deck)
            {
                $new_deck[$cur_pos] = $val;
                $cur_pos = ($cur_pos + $jump) % 10007;
            }
            @deck = @new_deck;
            @new_deck = [];
        }
        elsif (index($line, 'stack') != -1)
        {
            @deck = reverse @deck;
        }
    }
    say first_index {$_ eq 2019} @deck;
}

sub part_two
{
    my @input = @{$_[0]};
    my $deck = Math::BigInt->new('119315717514047');
    my $repeat = Math::BigInt->new('101741582076661');

    sub get_nth
    {
        my ($offset, $increment, $integer, $size) = @_;
        return ($offset + ($integer * $increment)) % $size;
    }
    my $off = Math::BigInt->bzero();
    my $inc = Math::BigInt->new('1');
    for my $line (@input)
    {
        if (index($line, 'cut') != -1)
        {
            my ($first, $r) = split ' ', $line;
            $off = ($off + ($r * $inc)) % $deck;
        }
        elsif (index($line, 'increment') != -1)
        {
            my @parts = split ' ', $line;
            my $jump = Math::BigInt->new($parts[-1]);
            # my $bmp = $jump->bmodpow($deck - 2, $deck);
            my $bmp = $jump->bmodinv($deck);
            $inc = ($inc * $bmp) % $deck;
        }
        elsif (index($line, 'stack') != -1)
        {
            $inc = ($inc * -1) % $deck;
            $off = ($off + $inc) % $deck;
        }
    }
    # my $incr = $inc->bmodpow($repeat, $deck);
    my $incr = $inc->bmodinv($repeat);
    my $f = Math::BigInt->new((1 - $inc) % $deck);
    # my $offs = ($off * (1 - $incr) * $f->bmodpow($deck - 2, $deck)) % $deck;
    my $offs = ($off * (1 - $incr) * $f->bmodinv($deck)) % $deck;
    say get_nth($offs, $incr, 2020, $deck);
}

# Main part

# Given input
my $filename = 'day-22-input.txt';
open(my $fh, '<', $filename);
my @flines = <$fh>;
close $fh;
chomp(@flines);

# part_one(\@flines); # 4703
part_two(\@flines); # 55627600867625
