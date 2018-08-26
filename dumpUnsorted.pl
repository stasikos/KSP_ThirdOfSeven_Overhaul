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
#	print Dumper $p;
	if (!($p->{'TechRequired'} =~ m/(size[0-9]{4})|([a-z]+[0-9]{0,4}_t?)/)) {
		$p->{'entryCost'} = 0 if (undef $p->{'entryCost'}) ;
		printf "%s, \"%s\", %s, %d, %d\n", $k, $p->{'title'}, $p->{'TechRequired'}, $p->{'cost'}, $p->{'entryCost'};
	}
}
