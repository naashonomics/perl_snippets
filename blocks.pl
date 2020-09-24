#!/usr/bin/perl


use 5.18.0;
use warnings;

my $alpha = 'alpha';
my $beta = 'beta';
my $charlie = 'charlie';

func();

sub func {
    foreach my $x ( $alpha, $beta, $charlie ) {
        say $x;
    }
}
