#! /usr/bin/env perl

use strict;
use warnings;

# Generate the array

my @steps = qw(00 5f 87 af d7 ff);
my @arr;

# Main colors
my $COLOR_BASE = 16;
for my $num ($COLOR_BASE .. 231) {
	$arr[$num] = number_to_color($num);
}

# Gray scale
my $GRAY_BASE = 232;
for my $num ($GRAY_BASE .. 255) {
	my $hex    = sprintf '%02x', 0x08 + 0x0a * ($num - $GRAY_BASE);
	$arr[$num] = join '/', ($hex) x 3;
}

my $width = 6;
for my $num ($COLOR_BASE .. $#arr) {
	print  '[38;5;', $num, 'm';
	printf '%02x: ', $num;
	print  "$arr[$num] [0m ";
	print "\n" if ($num - $COLOR_BASE + 1) % $width == 0;
}


sub number_to_color {
	use integer;
	my $num = shift;
	$num   -= 16;

	return join('/', $steps[($num / 36) % 6], $steps[($num / 6) % 6], $steps[$num % 6]);
}
