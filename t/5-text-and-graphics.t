# from David Warring, 2024-09-21
# modified by @tbrowder

my $debug = 1;

use Test;

use PDF::Content::Color :rgb;
use PDF::Content::FontObj;
#use PDF::Content::XObject;
use PDF::Lite;

use PDF::FormFill::FreeFonts;

my ($font, $font-size);

my %fonts = get-loaded-fonts-hash;

my PDF::Lite $pdf .= new;
$pdf.media-box = [0, 0, 8.5*72, 11*72];
my PDF::Lite::Page $page = $pdf.add-page;

#$font = $pdf.core-font(:family<Helvetica>);
$font = %fonts<t>;

$page.graphics: {
#    my PDF::Content::FontObj $font = $pdf.core-font( :family<Helvetica> );
    #   my PDF::Lite::XObject $form = .xobject-form(:BBox[0, 0, 95, 25]);
    #   $form.graphics: {
    #       .FillColor = rgb(.8, .9, .9);
    #       .Rectangle: |$form<BBox>;
    #       .paint: :fill;

    .MoveTo: 300, 500;
    .LineTo: 500, 500;
    .CloseStroke;

    my $font-size = 20;
    #.font = $font;
    .font = $font, $font-size;

    #       .FillColor = rgb(1, .3, .3);  # reddish
    .print("Simple Form", :position[300, 600], :aline<left>, :valign<top>);

    .print("Simple Form", :position[300, 500], :aline<center>, :valign<center>);

    #   }
    #   my PDF::Content::XObject $jpeg .= open: "t/images/jpeg.jpg";
    #   # sanity check of form vs image positioning
    #   my @p1 = .do($form, :position(10, 30), :width(80), :height(30), :valign<top>);

    #   my @p2 = .do($jpeg, :position(100, 30), :width(80), :height(30), :valign<top>);

    #   # This should form a grid
    #   .do($form, :position(10, 50), :width(80), :height(30), :valign<center>);
    #   .do($jpeg, :position(100, 50), :width(80), :height(30), :valign<center>);
    #   .do($form, :position(10, 70), :width(80), :height(30), :valign<bottom>);
    #   .do($jpeg, :position(100, 70), :width(80), :height(30), :valign<bottom>);
}

if $debug {
    my $ofil = "test5.pdf";
    $pdf.save-as: $ofil;
    say "DEBUG: See output pdf file: '$ofil'";
}

done-testing;
