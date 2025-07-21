[![Actions Status](https://github.com/tbrowder/PDF-FormFill/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/PDF-FormFill/actions) [![Actions Status](https://github.com/tbrowder/PDF-FormFill/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/PDF-FormFill/actions) [![Actions Status](https://github.com/tbrowder/PDF-FormFill/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/PDF-FormFill/actions)

NAME
====

**PDF::Overlay** - Given a text file with instructions, overlays data on pages of an input PDF document

SYNOPSIS
========

```raku
use PDF::Overlay;
...
```

DESCRIPTION
===========

**PDF::Overlay** provides the user with the capability to overlay desired graphics on the pages of an existing PDF document. In order to do that, there are several steps to follow:

Step 1. The user must create a text file (a template) with appropriate instructions to place the required information on a copy of the original document.

Step 2. Create a data input file for any user with the required information to enter in the overlay file.

The Raku script, `pdf-overlay`
------------------------------

    pdf-overlay --pdf-in <input PDF to overlay> --overlay <overlay description file> 
        --pdf-out <output PDF>

The overlay description file
----------------------------

### Line format

The user's desires are shown in single, coded input lines. Blank lines and comments from a '#' to the end of a line are ignored. Each data line is first broken into one or more groups by a `:` (colon) and a `;` (semicolon). For example, this `key0:` is one string group, this `key1: some data` becomes two string groups, and this `key2: other data; more data` has three string groups. The first group contains a code that governs some action. Any remaining groups provide information to contruct a specific overlay item or some attribute of the overlay. 

Notes:

  * Comments and blank lines are allowed but ignored.

  * Any line without a beginning `code:` is ignored.

  * Paper size must be Letter or A4. The default is `Paper`. The default is `t12` (Times-Roman, 12 points).

  * The `font: code` includes the font size as described in the required package `FontFactotory::Type1`. Multiple font entries are allowed on succeeding line, with the most recent (lowest in the command list) overriding former settings.

  * X,Y values are the coordinates (in PS Points, 72/inch) of the starting point for the line of text on the page, with origin at the lower left corner of the paper. 

  * Text is normally rendered parallel to the X axis, but it may be rotated if need be. Use the `angle=N` value where N is the desired angle with positive rotation in the counter-clockwise direction. The value is assumed to be zero (no rotation) if the `angle=?` space is empty.

### Currently recognized codes

    begin: # not required but recommended for clarity for documentation
    paper: Letter
    font: <code from the desired font in package C<FontFactory::Type1>
    orientation: Portrait
    page: 1
    text: x,y,angle=0; the text to put on the line...
    text: ....
    page: 3
    #...
    end: # not required but recommended for clarity for documentation

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2025 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

