#! /usr/bin/env perl

use strict;
use warnings;

# Generate the array

# Fill in the first 16 colors. The exact hex codes vary by terminal and device
# This table comes from our .Xresources file. It should be close enough.
my @arr = qw(
	2e/34/36 cc/00/00 4e/9a/06 c4/a0/00 34/65/a4 75/50/7b 06/98/9a d3/d7/cf
	55/57/53 ef/29/29 8a/e2/34 fc/e9/4f 72/9f/cf ad/7f/a8 34/e2/e2 ee/ee/ec
);

# Main colors
for my $num (16 .. 231) {
	push @arr, number_to_color($num);
}

# Gray scale
for my $num (232 .. 255) {
	my $hex    = sprintf '%02x', 0x08 + 0x0a * ($num - 232);
	push @arr, join '/', ($hex) x 3;
}

print "This is your standard text color.\n";
my $width = 6;
for my $num (0 .. $#arr) {
	print  '[38;5;', $num, 'm';
	printf '%03d: ', $num;
	print  "$arr[$num] [0m";
	print "\n" if ($num + 1) % $width == 0;
}
print "\n";


sub number_to_color {
	use integer;
	my $num = shift;
	$num   -= 16;

	my @steps = qw(00 5f 87 af d7 ff);
	return join('/', $steps[($num / 36) % 6], $steps[($num / 6) % 6], $steps[$num % 6]);
}
