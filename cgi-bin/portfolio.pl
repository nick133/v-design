#!/usr/local/bin/perl

use strict;
use warnings;
 
use CGI;

my ($q, $dir, $npages, $page, @imgs);

$q = new CGI;

print $q->header(
  -type             => 'text/html; charset=windows-1251',
  -content_language => 'ru',
  -style_type       => 'text/css',
  -script_type      => 'text/javascript'
) . qq[<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">
<?xml version="1.0" encoding="windows-1251"?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
  <meta name="Title" content="Versiya-Design Studio" />
  <meta name="Author" content="Nick <webmaster\@v-design.kiev.ua>" />
  <meta name="Copyright" content="(C) 2008 Versiya Design>" />

  <title>Версия-дизайн: студия ландшафного дизайна и дизайна интерьеров - декор, стиль, цвет, свет</title>

  <link rel="stylesheet" href="/style.css" />
  <script type="text/javascript" src="/script.js"></script> 

<script type="text/javascript">
preloadImages(
    'images/nav-map-hover.gif', 'images/nav-home-hover.gif', 'images/nav-mail-hover.gif',

    'images/manu-home-hover.jpg', 'images/manu-services-hover.jpg',
    'images/manu-portfolio-hover.jpg', 'images/manu-articles-hover.jpg',
    'images/manu-contacts-hover.jpg' );"
</script>    

  <script type="text/javascript" src="/highslide/highslide-with-gallery.js"></script>
  <link rel="stylesheet" type="text/css" href="/highslide/highslide.css" />

<script type="text/javascript">
hs.graphicsDir = 'highslide/graphics/';
hs.align = 'center';
hs.transitions = ['expand', 'crossfade'];
hs.outlineType = 'rounded-white';
hs.wrapperClassName = 'controls-in-heading';
hs.fadeInOut = true;
hs.dimmingOpacity = 0.50;

if (hs.addSlideshow) hs.addSlideshow({
    interval: 5000,
    repeat: false,
    useControls: true,
    fixedControls: false,
    overlayOptions: {
        opacity: 1,
        position: 'top right',
        hideOnMouseOut: false
    }
});
</script>
</head>
<body>
<div id="mainbox">
<a href="mailto:via\@v-design.kiev.ua?Subject=General Question"
  onmouseover="setImage('nav3', 'images/nav-mail-hover.gif');"
  onmouseout="setImage('nav3', 'images/nav-mail.gif');"
><img class="nav" id="nav3" src="images/nav-mail.gif" title="Свяжитесь с нами" alt="почта&gt;" /></a>
<a href="index.html"
  onmouseover="setImage('nav2', 'images/nav-home-hover.gif');"
  onmouseout="setImage('nav2', 'images/nav-home.gif');"
><img class="nav" id="nav2" src="images/nav-home.gif" title="Главная страница" alt="главная&gt;"/></a>
<a href="#"
  onmouseover="setImage('nav1', 'images/nav-map-hover.gif');"
  onmouseout="setImage('nav1', 'images/nav-map.gif');"
><img class="nav" id="nav1" src="images/nav-map.gif" title="Карта сайта" alt="карта сайта&gt;" /></a>

<table class="main" cellspacing="0" cellpadding="0">
<tr>
  <td><img src="images/menu-top.jpg" /></td>
  <td rowspan="7" id="content2" class="content">
    <img id="ptitle" src="images/title-portfolio.jpg" />
    <div class="portfolio">
    <div class="highslide-gallery">
];

$dir = '../portfolio';

opendir(RD, $dir) or die "Access denied to directory <$dir>: $!";

for(sort(readdir RD)) {
    if ( /^[a-z\d\-_]+\.jpg$/igmx and -r "$dir/$_" )
        { push @imgs, $_ }
}

$page = ( $q->param('p') or 1 );
$npages = npages( ($#imgs)+1, 9 );
$page = $npages if $page > $npages;

closedir RD or die "Can not close directory <$dir>: $!";

for (my $i = 9*$page-9; $i < 9*$page; $i++) {
    $imgs[$i] or last;
    print qq[<a href="/portfolio/$imgs[$i]" class="highslide, borderless" onclick="return hs.expand(this)">
    <div class="pthumb" style="background-image: url('/cgi-bin/pic.pl?i=$imgs[$i]')"></div></a>\n
    <div class="highslide-heading">Наши работы</div>
    ];
}

print '<div id="pagebar">' . pagebar( $page, ($#imgs)+1, 9,
    '<span class="currpage">%d</span>',
    '<a href="/portfolio%d.html">%d</a>', ' | ' ) . qq[
    </div></div></div>
  </td>
</tr>
<tr>
  <td><a href="index.html"
        onmouseover="setImage('ihome', 'images/menu-home-hover.jpg')"
        onmouseout="setImage('ihome', 'images/menu-home.jpg')"
      ><img id="ihome" src="images/menu-home.jpg" /></a></td>
</tr>
<tr>
  <td><a href="services.html"
        onmouseover="return setImage('iservices', 'images/menu-services-hover.jpg');"
        onmouseout="return setImage('iservices', 'images/menu-services.jpg');"
      ><img id="iservices" src="images/menu-services.jpg" /></a></td>
</tr>
<tr>
  <td><a href="portfolio.html"
        onmouseover="return setImage('iportfolio', 'images/menu-portfolio-hover.jpg');"
        onmouseout="return setImage('iportfolio', 'images/menu-portfolio.jpg');"
      ><img id="iportfolio" src="images/menu-portfolio.jpg" /></a></td>
</tr>
<tr>
  <td><a href="articles.html"
        onmouseover="return setImage('iarticles', 'images/menu-articles-hover.jpg');"
        onmouseout="return setImage('iarticles', 'images/menu-articles.jpg');"
      ><img id="iarticles" src="images/menu-articles.jpg" /></a></td>
</tr>
<tr>
  <td><a href="contacts.html"
        onmouseover="return setImage('icontacts', 'images/menu-contacts-hover.jpg');"
        onmouseout="return setImage('icontacts', 'images/menu-contacts.jpg');"
      ><img id="icontacts" src="images/menu-contacts.jpg" /></a></td>
</tr>
<tr>
  <td><img src="images/menu-bottom.jpg" /></td>
</tr>
</table>

<div id="empty-bottom">
  &copy; 2008-2011 студия "Версия-дизайн"
</div>
</div>
</body>
</html>];

sub npages {
    my ($items, $maxonpage) = @_;
    return 1 if $maxonpage >= $items;

    my $n = $items / $maxonpage;
    $n = sprintf('%d', $n) + 1 if index($n, '.') > 0;
}

#
# pagebar( $curr_page, $items, $max_on_page, $curr_pagecode, $pagecode, $sepcode )
#
# In $pagecode and $curr_pagecode use '%d' for page number.
# Returns pagebar code calculated from MAX_ON_PAGE, and ITEMS.
#
sub pagebar {
    my (
        $curr_page, $items, $maxonpage,
        $curr_pagecode, $pagecode, $sepcode
    ) = @_;

    my ($barcode, $npages) = ( '', npages($items, $maxonpage) );

    return $barcode if $npages == 1; # Do not show pagebar if only 1 page

    for (my $i = 1; $i <= $npages; $i++) {
        my $code = ($i == $curr_page) ? $curr_pagecode : $pagecode;

        $code =~ s|%d|$i|gmx and $barcode .= $code;
        $barcode .= $sepcode if $sepcode and $i < $npages;
    }

    $barcode;
}

__END__