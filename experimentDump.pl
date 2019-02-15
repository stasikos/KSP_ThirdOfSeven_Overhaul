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
		if ($pLine =~ /^EXPERIMENT_DEFINITION$/) {
			$continue = 1;
		} else {
			$continue = 0;
		}
	} elsif ($line =~ /(.*) = (.*)/) {
		my $att = $1;
		my $value = $2;
		if ($continue eq 1) {
			if ($att eq "id") {
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

printf "%s, %s, %s, %s, %s, %s, %s, %s\n", "url", "id", "title", "baseValue", "scienceCap", "requireAtmosphere", "situationMask", "biomeMask";
foreach $k (keys %parts) {
	$p = $parts{$k};
	$parentUrl = $p->{'parentUrl'};
	$parentUrl =~ s/([a-zA-Z0-9]*)\/.*/$1/;
	$p->{'requireAtmosphere'} = 0 if not defined $p->{'entryCost'};
#	print Dumper $p;
	printf "%s, %s, \"%s\", %d, %d, %s, %d, %d\n", $parentUrl, $k, $p->{'title'}, $p->{'baseValue'}, $p->{'scienceCap'}, $p->{'requireAtmosphere'}, $p->{'situationMask'}, $p->{'biomeMask'};
}
