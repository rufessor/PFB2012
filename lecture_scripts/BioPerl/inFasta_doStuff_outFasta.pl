#!/usr/bin/perl -w  
#file: inFasta_doStuff_outFasta.pl
use strict;
use Bio::SeqIO;

my $file = shift;
my $seqIO_object = Bio::SeqIO->new(
                                        -file => $file,
                                        -format => 'fasta',
                                        );

my $out = Bio::SeqIO->new(-format => 'fasta');

while (my $seq_object = $seqIO_object->next_seq){
        my $id = $seq_object->id;
        my $desc = $seq_object->desc;
        my $seqString = $seq_object->seq;
        my $revComp = $seq_object->revcom;
        my $alphabet = $seq_object-> alphabet;
        my $translation_seq_obj  = $seq_object-> translate;
        my $translation  = $translation_seq_obj -> seq;
        my $seqLen = $seq_object->length;

        print "$translation_seq_obj\n";

        print "translation: $translation\n";
        print "alphapet: $alphabet\n";
        print "seqLen: $seqLen\n";

        $out->write_seq($seq_object); #prints to STOUT
}
