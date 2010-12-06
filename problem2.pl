#!/usr/bin/perl

use warnings;
use strict;

my @p = (1,1);
my $N = 4000000;
my $s = 0;

while ($p[1] <= $N) {
  @p = ( $p[1], $p[0]+$p[1] );
  $s += $p[1] unless $p[1] & 1;
  print "@p $s".$/;
}

print $s;

