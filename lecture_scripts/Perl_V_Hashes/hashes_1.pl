#!/usr/bin/perl
use warnings;
use strict;

my %genetic_code = (
 "CCA" => "Pro",
 "ATG" => "Met",
 "AAA" => "lys",
);


#use key to get value
#like using index to get value in an array
my $aa = $genetic_code{"ATG"};
print $aa , "\n";
print "-----\n";
my @codons =  keys (%genetic_code);
foreach my $codon (@codons){
  my $aa = $genetic_code{$codon};
  print "key:$codon  value:$aa\n";
}
print "-----\n";

#sorting keys, then retrieving the value
foreach my $codon (sort @codons){
  my $aa = $genetic_code{$codon};
  print "key:$codon  value:$aa\n";
}
print "-----\n";

# sort ==== sort { $a cmp $b }
#same as above with explicit sort function
foreach my $codon (sort {$a cmp $b} @codons){
  my $aa = $genetic_code{$codon};
  print "key:$codon  value:$aa\n";
}
print "-----\n";

$genetic_code{"TGT"} = "Cys";

## sorting the values
## this custom sort is just like { value_a cmp value_b } 
foreach my $codon ( sort {$genetic_code{$a} cmp $genetic_code{$b}} keys (%genetic_code) ){
  my $aa = $genetic_code{$codon};
  print "key:$codon  value:$aa\n";
}
print "-----\n";

delete $genetic_code{"ATG"};

foreach my $codon ( sort {$genetic_code{$a} cmp $genetic_code{$b}} keys (%genetic_code) ){
  my $aa = $genetic_code{$codon};
  print "key:$codon  value:$aa\n";
}
#print join("--",@codons), "\n";
