#!/bin/perl
# $Id: 256.perl,v 1.1 2011-01-18 19:20:17-08 dmfrank - $
for $char (0..255) {
   printf "%c", $char;
   print "\n" if $char % 16 == 15;
}
