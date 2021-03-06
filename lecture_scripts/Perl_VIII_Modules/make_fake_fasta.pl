#!/usr/bin/perl                                                                                       
# Dave Messina 2012-10-18

use strict;
use warnings;
use Getopt::Long;

# defaults for command-line options
my $length = 30;
my $number = 10;
my $help;

# process command-line options
GetOptions('l|length:i' => \$length,
	   'n|number:i' => \$number,
	   'h|help'     => \$help);

# usage statement
my $usage = "make_fake_fasta.pl - generate random DNA seqs

Options:
-n <number>   the number of sequences to make (default: 10)
-l <length>   the length of each sequence     (default: 30)

";
die $usage if $help;

# define my DNA alphabet
my @nucs = qw(A C T G);

# loop once for each fasta I want to make
for (my $i = 1; $i <= $number; $i++) {
	my $seq;

	# make the string of random nucleotides
	for (my $j = 1; $j <= $length; $j++) {
    	my $index = int(rand (4)); # 4 nucleotides, so rand(4)
    	my $nuc = $nucs[$index];
    	$seq .= $nuc;
	}
	
	# print out the fasta header and the sequence
	print ">fake$i\n";
	print $seq, "\n";
}
