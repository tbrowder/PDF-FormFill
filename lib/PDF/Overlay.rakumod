unit class PDF::Overlay;

use Text::Utils :ALL;
use CSV::Table; # use method save
use PDF::GraphPaper;
use PDF::GraphPaper::Subs;
use PDF::GraphPaper::Vars;
use PDF::GraphPaper::GPaper;

sub parse-code-line-data(
    $file where *.IO.r,
    --> Hash
    ) is export {
    my %h;
    for $file.IO.lines -> $line is copy {
        $line = strip-comment $line;
        next unless $line ~~ /\S/;
        # separate into groups 
        # first group is key up to the ':'
        # second group is up to the ';', if any
        # third group, if any, follows the ';'
        # SAVE EMPTY KEYS
        my @parts = split-line $line, ':';
        my $key = @parts.head;
        my $rem = @parts.tail;
        $rem = normalize-text $rem;
        say "DEBUG: key '$key'";
        my @c = $key.comb;
        @c.pop;
        $key = @c.join;
        say "       bare key: $key";
        say "       remainder: '$rem'";
        %h{$key} = $rem;
    }
    %h;
}

sub handle-overlay-line(
    :$pdf-path,
    :%data,
    ) is export {
    # Given a hash of the input data lines
    # and the PDF document, place the data
    # at the directed position.
    
    # for each pdf page number: 1..N
    #   for each overlay position on that page
#       my @p = %data{
    #     move to the proper position 
    #       transform the angle if necessary,
    #         print the text
}

=begin comment
sub text2var(
    $text,
    $content,
    ) is export {
    # from ChatGPT
    my $name;
    OUR::{"\$" ~ "name"} = $text;
    $name = $content;
}
=end comment

