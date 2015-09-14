#!/usr/bin/perl
use 5.010;
use strict;
use warnings;
use MIME::Base64;

# Path of the PDF file which we want
my $path = "TestPDF.pdf";
open my $fh, '<', $path or die "Can't open file $!";
my $file_content = do { local $/; <$fh> };
my $encoded_str = encode_base64($file_content);
$encoded_str =~ s/\n/\\n/g;
my $base64_str = "base64_str.txt";
open(my $fh1, ">", $base64_str)or die "cannot open > $base64_str: $!";
print $fh1 $encoded_str;


