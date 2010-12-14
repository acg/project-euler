#!/usr/bin/perl

use warnings;
use strict;


sub sieve
{
  my $primes = shift;
  my ($n1,$n2) = (shift,shift);
  my @sieve = map $n1+$_ => (0 .. $n2-$n1);

  for my $prime (@$primes) {
    my $k0 = $prime * int ($n1 / $prime);
    $k0 += $prime if $k0 < $n1;
    for (my $k = $k0; $k <= $n2; $k += $prime) {
      $sieve[$k-$n1] = undef;
    }
  }

  my @newprimes = grep defined($_) => @sieve;
  return \@newprimes;
}

my $nth = shift or die;
my $size = shift;
my @primes = ( 2 );

while (@primes < $nth)
{
  my $n1 = $primes[-1];
  my $n2 = $n1 * $n1;
  $n1++;
  $n2 = $n1 + $size if $size && $n2 - $n1 > $size;
  my $newprimes = sieve( \@primes, $n1, $n2 );
  push @primes, @$newprimes;
}

#print "@primes";
print $primes[$nth-1];
exit 0;

