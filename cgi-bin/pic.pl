#!/usr/bin/perl

use strict;
use warnings;
 
use CGI;
use Image::Magick;

my $q = new CGI;

showImage($q->param('i'), '155x116');

sub showImage {
    my ($file, $geom) = @_;
    print $q->header(-type => 'image/jpeg');

    my $p = new Image::Magick;

    $p->Read("../portfolio/$file");

    if ($geom) {
        my ($x, $m, $y) = ($geom =~ /^(\d+)([x,])(\d+)$/gmx);
        if    ($m eq 'x') { $p->Resize(geometry => $geom) }
        elsif ($m eq ',') { $p->Resize(width => $x, height => $y) }
    }

    binmode STDOUT;
    $p->Write('jpg:-');
    exit;
}
