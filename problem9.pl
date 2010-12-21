#!/usr/bin/perl

sub pythagorean_triplet {
  my $N = shift;

  for (my $a=1; $a<=int($N/3)-1; $a++) {
    for (my $b=$a+1; $b<=int(($N-$a)/2); $b++) {
      my $c = $N - ($a + $b);
      next unless $a < $b; # FIXME should not be necessary
      next unless $b < $c; # FIXME should not be necessary
      return ($a,$b,$c) if ($a*$a) + ($b*$b) == ($c*$c);
    }
  }
}

my ($a,$b,$c) = pythagorean_triplet(1000);
printf "%d^2 + %d^2 = %d + %d = %d = %d^2".$/, $a,$b,($a*$a),($b*$b),($c*$c),$c;
printf "%d".$/, $a*$b*$c;
exit 0;

