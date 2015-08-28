#!/usr/bin/perl

use strict;
my %keys;
my %sets;
my %dels;
my %both;

my %base;

print $ARGV[0]."\t|".$ARGV[1]."\n";
my $file1 = $ARGV[0];
my $file2 = $ARGV[1];
sub load_keys
{
    my $filename = shift;
    open (MYFILE, $filename) or die "Can't open $filename\n";
    while(<MYFILE>)
    {
        if($_ =~ m/\W(\S\S\S) key (\S\S*) /)
        {
            my $op = $1;
            my $key = $2;
            if (!$keys{$key}) {
                $keys{$key} = $_;
            } else {
                $keys{$key} = $keys{$key}."||".$_;
                $both{$key} = $keys{$key};
            }
            if ($op eq "SET") {
                $sets{$key} = $_;
            } else {
                $dels{$key} = $_;
            }
        }
    }
    close (MYFILE);
}

load_keys($file1);
load_keys($file2);

my @allkeys = keys %keys;
my @allsets = keys %sets;
my @alldels = keys %dels;
my @allboths = keys %both;

print "Got ".($#allkeys + 1)." keys\n";
print "Got ".($#allsets + 1)." sets\n";
print "Got ".($#alldels + 1)." dels\n";
print "Got ".($#allboths + 1)." boths\n";


for (my $i = 0; $i < 10000; $i++) { $base{"key".$i} = 1; }


foreach my $key (keys %base) {
    if (!$keys{$key}) {
        print "Missing ".$key."\n";
    }
}
1
