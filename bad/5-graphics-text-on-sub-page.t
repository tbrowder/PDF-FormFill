# from David Warring, 2024-09-21
# modified by @tbrowder

my $debug = 1;

use Test;

use PDF::Content::Color :rgb;
use PDF::Content::FontObj;
use PDF::Lite;

use PDF::FormFill::FreeFonts;

my ($font, $font-size);

my %fonts = get-loaded-fonts-hash;

sub print-text-sub {...}

my PDF::Lite $pdf .= new;
$pdf.media-box = [0, 0, 8.5*72, 11*72];
my PDF::Lite::Page $page = $pdf.add-page;

$font = %fonts<t>;
$font-size = 20;


$page.graphics: {
    # do graphics stuff
    .MoveTo: 300, 500;
    .LineTo: 500, 500;
    .CloseStroke;
     
    #.font = $font, $font-size;
    my %opts;
    # first print
    %opts<align>  = "left";
    %opts<valign> = "top";
    %opts<posx>   = 300;
    %opts<posy>   = 600;
    my $text      = "Simple Form";
    print-text-sub(:$text, :$page, :$font, $font-size, :%opts); 
#   .print("Simple Form", :position[300, 600], :aline<left>, :valign<top>);
#   .print("Simple Form", :position[300, 500], :aline<center>, :valign<center>);
}

if $debug {
    my $ofil = "test5.pdf";
    $pdf.save-as: $ofil;
    say "DEBUG: See output pdf file: '$ofil'";
}

sub print-text-sub(
    :$text!,
    :$page!,
    :$font!,
    :$font-size!,
    :%opts!,
) is export {
    my $x      = %opts<posx>;
    my $y      = %opts<posy>;
    my $align  = %opts<align>;
    my $valign = %opts<valign>;
    given $page.gfx {
        .BeginText;
        .text-position = $x, $y;
        .say $text;
        .EndText;
    }
} # end of sub print-text-sub

done-testing;
