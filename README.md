[![Actions Status](https://github.com/tbrowder/PDF-Overlay/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/PDF-Overlay/actions) [![Actions Status](https://github.com/tbrowder/PDF-Overlay/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/PDF-Overlay/actions) [![Actions Status](https://github.com/tbrowder/PDF-Overlay/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/PDF-Overlay/actions)

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

**PDF::Overlay** provides the user with the capability to overlay desired graphics on the pages of an existing PDF document. In order to do that, the user must first create a text file with appropriate instructions. Then use that file with the Raku script installed with this package.

The Raku script, `pdf-overlay`
------------------------------

    pdf-overlay --pdf-in <input PDF to overlay> --overlay <overlay description file> 
        --pdf-out <output PDF>

The overlay description file
----------------------------

### Line format

The user's desires are shown in single, coded input line. Blank lines and comments from a '#' to the end of a line are ignored. Each data line is first broken into one or more groups by a `:` (colon) and a `;` (semicolon). For example, this `key0:` is one string group, this `key1: some data` becomes two string groups, and this `key2: other data; more data` has three string groups. The first group contains a code that governs some action. Any remaining groups provide information to contruct a specific overlay item or some attribute of the overlay. 

Notes:

  * comments and blank lines are allowed but ignored.

  * any line without a beginning `code:` is ignored.

  * paper size must be Letter (default) or A4.

### Currently recognized codes

    begin: # not required but recommended for clarity for documentation
    paper: Letter
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

