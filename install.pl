#! /usr/bin/env perl

# install.pl
# script to create symlinks from the checkout of davesdots to the home directory

use strict;
use warnings;

use File::Path qw(mkpath rmtree);
use File::Glob ':glob';
use Cwd 'cwd';

my $scriptdir = cwd() . '/' . $0;
$scriptdir    =~ s{/ [^/]+ $}{}x;

my $home = bsd_glob('~', GLOB_TILDE);

if(grep /^(?:-h|--help|-\?)$/, @ARGV) {
	print <<EOH;
install.pl: installs symbolic links from dotfile repo into your home directory

Options:
	-f          force an overwrite existing files
	-h, -?      print this help

Destination directory is "$home".
Source files are in "$scriptdir".
EOH
	exit;
}

my $force = 0;
$force = 1 if grep /^(?:-f|--force)$/, @ARGV;

unless(eval {symlink('', ''); 1;}) {
	die "Your symbolic links are not very link-like.\n";
}

my %links = (
	screenrc   => '.screenrc',
	toprc      => '.toprc',
	dircolors  => '.dircolors',
	gdircolors => '.gdircolors',
	lessfilter => '.lessfilter',

	vim      => '.vim',
	vimrc    => '.vimrc',
	gvimrc   => '.gvimrc',

	commonsh => '.commonsh',

	inputrc  => '.inputrc',

	bash          => '.bash',
	bashrc        => '.bashrc',
	bash_profile  => '.bash_profile',

	zsh      => '.zsh',
	zshrc    => '.zshrc',

	ksh      => '.ksh',
	kshrc    => '.kshrc',
	mkshrc   => '.mkshrc',

	sh      => '.sh',
	shinit  => '.shinit',

	Xdefaults  => '.Xdefaults',
	Xresources => '.Xresources',

	'uncrustify.cfg' => '.uncrustify.cfg',
	'indent.pro'     => '.indent.pro',

	xmobarrc    => '.xmobarrc',
	'xmonad.hs' => '.xmonad/xmonad.hs',

	gitconfig => '.gitconfig',

	caffeinate => 'bin/caffeinate',
	lock       => 'bin/lock',
);

my $i = 0; # Keep track of how many links we added
for my $file (keys %links) {
	# See if this file resides in a directory, and create it if needed.
	my($path) = $links{$file} =~ m{^ (.+/)? [^/]+ $}x;
	mkpath("$home/$path") if $path;

	my $src  = "$scriptdir/$file";
	my $dest = "$home/$links{$file}";

	# If a link already exists, see if it points to this file. If so, skip it.
	# This prevents extra warnings caused by previous runs of install.pl.
	if(-e $dest && -l $dest) {
		next if readlink($dest) eq $src;
	}

	# Remove the destination if it exists and we were told to force an overwrite
	if($force && -f $dest) {
		unlink($dest) || warn "Couldn't unlink '$dest': $!\n";
	} elsif($force && -d $dest) {
		rmtree($dest) || warn "Couldn't rmtree '$dest': $!\n";
	}

	symlink($src => $dest) ? $i++ : warn "Couldn't link '$src' to '$dest': $!\n";
}

print "$i link";
print 's' if $i != 1;
print " created\n";
