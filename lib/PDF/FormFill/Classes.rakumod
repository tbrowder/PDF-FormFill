unit module PDF::FormFill::Classes;

use PDF::FormFill::Subs;

class DataLine is export {
    has $.code is required;
    has $.x is required;
    has $.y is required;
    has $.angle = 0;
    has $.text;
    has $.font;
    has $.font-size;
    has $.page-num;
}

class PageData is export {
}

