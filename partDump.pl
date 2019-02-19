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

printf "%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s\n", "url", "name", "title", "techrequired", "cost", "entryCost", "mass", "crashTolerance", "maxTemp", "skinMaxTemp", "maxPressure", "size", "tier", "meta", "tech";
foreach $k (keys %parts) {
	$p = $parts{$k};
	$parentUrl = $p->{'parentUrl'};
	$parentUrl =~ s/([a-zA-Z0-9]*)\/.*/$1/;
	$p->{'entryCost'} = 0 if not defined $p->{'entryCost'};
	$p->{'maxPressure'} = 0 if not defined $p->{'maxPressure'};
	$p->{'maxTemp'} = 0 if not defined $p->{'maxTemp'};
	$p->{'skinMaxTemp'} = 0 if not defined $p->{'skinMaxTemp'};
	$p->{'crashTolerance'} = 0 if not defined $p->{'crashTolerance'};
	$p->{'mass'} = 0 if not defined $p->{'mass'};
	$p->{'cost'} = 0 if not defined $p->{'cost'};
	$p->{'TechRequired'} = 'UnDeFiNed' if not defined $p->{'TechRequired'};
	$p->{'title'} = 'UnDeFiNed' if not defined $p->{'title'};
	$p->{'meta_level'} = 'UnDeFiNed' if not defined $p->{'meta_level'};
	$p->{'tier'} = 'UnDeFiNed' if not defined $p->{'tier'};
	$p->{'tech'} = 'UnDeFiNed' if not defined $p->{'tech'};
	$p->{'size'} = 'UnDeFiNed' if not defined $p->{'size'};
#	print Dumper $p;
	$p->{'TechHidden'} = 'False' if not defined $p->{'TechHidden'};
	if (lc $p->{'TechHidden'} ne "true") {
		printf "%s, %s, \"%s\", %s, %d, %d, %f, %f, %d, %d, %d, %s, %s, %s, %s\n", $parentUrl, $k, $p->{'title'}, $p->{'TechRequired'}, $p->{'cost'}, $p->{'entryCost'}, $p->{'mass'}, $p->{'crashTolerance'}, $p->{'maxTemp'}, $p->{'skinMaxTemp'}, $p->{'maxPressure'}, $p->{'size'}, $p->{'tier'}, $p->{'meta_level'}, $p->{'tech'};
	}
}
