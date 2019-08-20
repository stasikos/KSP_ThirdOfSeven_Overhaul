#!/usr/bin/perl -w

use Data::Dumper;

my $fName="../ModuleManager.ConfigCache";

open(my $FILE, '<', $fName);

my %parts;
my $pLine = "UNDEF";
my $continue = 0;
my $pName = "";
my %phash = ();

$lastUrl = "UnDeFiNeD";

while (my $line = <$FILE>) {
	chomp $line;
	$line =~ s/^\s+|\s+$//g;
	if ($line =~ /.*parentUrl = (.*)/) {
		$lastUrl = $1;
	}
	if ($line =~ /.*{.*/) {
		if ($pLine =~ /^PART$/) {
			$continue = 1;
		} else {
			$continue = 0;
		}
	} elsif ($line =~ /(.*) = (.*)/) {
		my $att = $1;
		my $value = $2;
		if ($continue eq 1) {
			if ($att eq "name") {
				$pName = $value;
				$phash = {};
				$phash->{'parentUrl'} = $lastUrl;
				$parts{$pName} = $phash;
				#print "last = $lastUrl\n";
			} else {
				$phash->{$att} = $value;
			}
		} 
	}
	$pLine = $line;
}

#print Dumper \%parts;

#exit 0;

my %nodes;

foreach $k (keys %parts) {
	$p = $parts{$k};
	$p->{'TechRequired'} = 'UnDeFiNed' if not defined $p->{'TechRequired'};
#	print Dumper $p;
	$p->{'TechHidden'} = 'False' if not defined $p->{'TechHidden'};
	if (lc $p->{'TechHidden'} ne "true") {
		$nodes{$p->{'TechRequired'}}++;
	}
}

foreach $k (keys %nodes) {
	printf "%s\t%d\n", $k, $nodes{$k};
}
