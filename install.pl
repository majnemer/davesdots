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
	ackrc      => '.ackrc',
	toprc      => '.toprc',
	dir_colors => '.dir_colors',
	lessfilter => '.lessfilter',

	vim      => '.vim',
	vimrc    => '.vimrc',
	_vimrc   => '_vimrc',
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

	shinit  => '.shinit',

	Xdefaults  => '.Xdefaults',
	Xresources => '.Xresources',

	'uncrustify.cfg' => '.uncrustify.cfg',
	'indent.pro'     => '.indent.pro',

	xmobarrc    => '.xmobarrc',
	'xmonad.hs' => '.xmonad/xmonad.hs',

	'Wombat.xccolortheme'  => 'Library/Application Support/Xcode/Color Themes/Wombat.xccolortheme',
#	'Wombat.dvtcolortheme' => 'Library/Developer/Xcode/UserData/FontAndColorThemes/Wombat.dvtcolortheme',

	gitconfig => '.gitconfig',
	gitignore => '.gitignore',

	tigrc     => '.tigrc',

	caffeinate => 'bin/caffeinate',
	lock       => 'bin/lock',

	'git-info'            => 'bin/git-info',
	'git-untrack-ignored' => 'bin/git-untracked-ignored',

	gdbinit => '.gdbinit',
);

my $contained = (substr $scriptdir, 0, length($home)) eq $home;
my $prefix = undef;
if ($contained) {
	$prefix = substr $scriptdir, length($home);
	($prefix) = $prefix =~ m{^\/? (.+) [^/]+ $}x;
}

chomp(my $uname = `uname -s`);
`cc answerback.c -o answerback.$uname`;
if ($? != 0) {
	warn "Could not compile answerback.\n";
} else {
	$links{"answerback.$uname"} = "bin/answerback.$uname";
}


my $i = 0; # Keep track of how many links we added
for my $file (keys %links) {
	# See if this file resides in a directory, and create it if needed.
	my($path) = $links{$file} =~ m{^ (.+/)? [^/]+ $}x;
	mkpath("$home/$path") if $path;

	my $src  = "$scriptdir/$file";
	my $dest = "$home/$links{$file}";

	# If a link already exists, see if it points to this file. If so, skip it.
	# This prevents extra warnings caused by previous runs of install.pl.
	if(!$force && -e $dest && -l $dest) {
		next if readlink($dest) eq $src;
	}

	# Remove the destination if it exists and we were told to force an overwrite
	if($force && -d $dest) {
		rmtree($dest) || warn "Couldn't rmtree '$dest': $!\n";
	} elsif($force) {
		unlink($dest) || warn "Couldn't unlink '$dest': $!\n";
	}

	if ($contained) {
		chdir $home;
		$dest = "$links{$file}";
		$src = "$prefix$file";
		if ($path) {
			my $nesting = split(/\//, $dest) - 1;
			$src = "../"x $nesting . "$src";
		}
	}

	symlink($src => $dest) ? $i++ : warn "Couldn't link '$src' to '$dest': $!\n";
}

print "$i link";
print 's' if $i != 1;
print " created\n";
