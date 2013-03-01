#!/usr/bin/perl
print $0, $/;
print $], $/;
print scalar localtime 2_147_483_647, $/;
print scalar localtime 2_147_483_648, $/;
