#!/usr/bin/perl -w

use Data::Dumper;

my $fName="../ModuleManager.ConfigCache";

open(my $FILE, '<', $fName);

my %parts;
my $pLine = "UNDEF";
my $continue = 0;
my $pName = "";
my %phash = ();

while (my $line = <$FILE>) {
	chomp $line;
	$line =~ s/^\s+|\s+$//g;
	if ($line =~ /.*{.*/) {
		if ($pLine =~ /^PART$/) {
			$continue = 1;
		} else {
			$continue = 0;
		}
	} elsif ($line =~ /(.*) = (.*)/) {
		if ($continue eq 1) {
			my $att = $1;
			my $value = $2;
			if ($att eq "name") {
				$pName = $value;
				$phash = {};
				$parts{$pName} = $phash;
			} else {
				$phash->{$att} = $value;
			}
		}
	}
	$pLine = $line;
}

#print Dumper \%parts;

#exit 0;

foreach $k (keys %parts) {
	$p = $parts{$k};
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
	printf "%s, \"%s\", %s, %d, %d, %f, %f, %d, %d, %d, %s, %s, %s, %s\n", $k, $p->{'title'}, $p->{'TechRequired'}, $p->{'cost'}, $p->{'entryCost'}, $p->{'mass'}, $p->{'crashTolerance'}, $p->{'maxTemp'}, $p->{'skinMaxTemp'}, $p->{'maxPressure'}, $p->{'size'}, $p->{'tier'}, $p->{'meta_level'}, $p->{'tech'};
}
