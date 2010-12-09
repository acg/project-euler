#!/usr/bin/perl

use warnings;
use strict;


sub sieve
{
  my $primes = shift;
  my ($n1,$n2) = (shift,shift);
  my %sieve;

  $sieve{$_} = 1 for ($n1 .. $n2);

  for my $prime (@$primes) {
    my $k0 = $prime * int ($n1 / $prime);
    for (my $k = $k0; $k <= $n2; $k += $prime) {
      delete $sieve{$k};
    }
  }

  my @newprimes = sort { $a <=> $b } map { 0+$_ } keys %sieve;
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

