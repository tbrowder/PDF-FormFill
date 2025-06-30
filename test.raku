#!/usr/bin/env raku

use PDF::Overlay;

my $f = "example/tom.txt";

my %h = parse-code-line-data $f;
