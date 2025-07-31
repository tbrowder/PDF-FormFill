#!/usr/bin/env raku

# found in dir /example:
# README.txt
# gb-form-location.template
# gb-overlay.template
# gb-person-data.template
# gbumc-safe-sanctuary-application.pdf
# sample-person.txt

my $data-dir = %*ENV<PDF_OVERLAY_PRIVATE_DIR> // '.'; #;

my $vscale = 1;
my $inpdf  = 
my $outpdf =
my $pdata  = "$data-dir/missy"
my $opdata =


