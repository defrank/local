#!/bin/sh
# $Id: fixfile.sh,v 1.1 2011-01-18 19:20:17-08 dmfrank - $
#
# NAME
#    fixfile.sh - fix basic formatting in a text file
#
# SYNOPSIS
#    fixfile.sh [filename...]
#
# DESCRIPTION
#    Fixes basic formatting on a text file:
#    Expands tabs to 8 spaces using expand(1).
#    Deletes trailing carriage return characters.
#    Adds a final newline if missing from the file.
#
# BUGS
#    Does not fix lines longer than 72 characters.
#

for file in $* ; do
   cid + $file
   if [ `basename $file` != Makefile ] ; then expand='%!expand\n' ; fi
   expand="$expand"'%s/\r//\nw\nq'
   echo $0: file=$file
   /usr/bin/echo "$expand" | /usr/bin/ex $file
   checksource $file
   cid + $file
done
