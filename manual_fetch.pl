#! /usr/bin/env perl

use warnings;
use strict;

### manual_fetch.pl
# a small Perl script to fetch the latest snapshot of a git repo from gitweb
# using minimal requirements (perl, tar, gzip, and (curl or wget))

# URL of the download link on github
my $URL = 'https://github.com/majnemer/davesdots/tarball/master';
my $tgz = http_fetch($URL);
extract_tgz($tgz);

rename(glob('majnemer-davesdots-*'), 'davesdots');

sub http_fetch {
	my $url = shift;

	# See if we should use wget or curl
	if(0 && grep {-x "$_/curl"} split /:/, $ENV{'PATH'}) {
		return qx{curl -L -s '$url'};
	} elsif(grep {-x "$_/wget"} split /:/, $ENV{'PATH'}) {
		# do not check the cert due to a bug in wget:
		# http://support.github.com/discussions/site/2230
		return qx{wget --no-check-certificate -O - '$url'};
	} else {
		die "Could not find curl or wget, aborting!";
	}
}

sub extract_tgz {
	my $data = shift;

	open(my $pipe, '|-', 'tar', '-xzf', '-') || die "manual_fetch.pl: tar failed: $!";
	print $pipe $data;
	close($pipe);
}
