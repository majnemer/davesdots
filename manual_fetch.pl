#! /usr/bin/env perl

use warnings;
use strict;

### manual_fetch.pl
# a small Perl script to fetch the latest snapshot of a git repo from gitweb
# using minimal requirements (perl, tar, gzip, and (curl or wget))

# URL of this repo in gitweb
my $URL = 'http://majnematic.com/cgi-bin/gitweb.cgi?p=davesdots.git';

my $html  = http_fetch($URL);
my($hash) = $html =~ m{
	gitweb\.cgi\?p=davesdots\.git;a=snapshot;h=([0-9a-fA-F]+);sf=tgz "> snapshot
}xi;

print "fetching: $URL;a=snapshot;h=$hash;sf=tgz\n";
my $tgz = http_fetch("$URL;a=snapshot;h=$hash;sf=tgz");
extract_tgz($tgz);

sub http_fetch {
	use LWP::Simple 'get';

	my $url = shift;
	return get($url);
}

sub extract_tgz {
	my $data = shift;

	open(my $pipe, '|-', 'tar', '-xz') || die "manual_fetch.pl: tar failed: $!";
	print $pipe $data;
	close($pipe);
}
