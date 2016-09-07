#!/usr/bin/perl

use strict;
use warnings;
 
use CGI;

my $q = new CGI;

$q->param('mailfrom') or $q->param('mailfrom', 'info@v-design.kiev.ua');
$q->param('mailsubj') or $q->param('mailsubj', '(!) Message from www.v-design.kiev.ua');
$q->param('mailbody') or $q->param('mailbody', '--- Empty message ---');

sendmail(
    $q->param('mailfrom'),
    'via@v-design.kiev.ua',
    $q->param('mailsubj'),
    $q->param('mailbody')
);

print qq[Content-type: text/html; charset=windows-1251

<html><head><title>Отправка сообщения..</title>
<meta http-equiv="refresh" content="5;url=http://www.v-design.kiev.ua/" />
</head><body style="padding: 150px 0; text-align: center; font: bold 12pt Verdana, Tahoma, Arial; color: #1E0A00">
Ваше сообщение отправлено.. Возврат на главную страницу через 5 сек.
</body></html>];

sub sendmail {
    open(M, '|/usr/sbin/sendmail -v -t >../log/lastmail.log 2>&1')
        or die "Can not close sendmail pipe: $!";

    print M (
        "Content-Type: text/plain; charset=windows-1251\n" .
        "From: $_[0]\n" .
        "To: <$_[1]>\n" .
        "Subject: $_[2]\n" .
        "X-Mailer: V-Design.kiev.ua site engine v0.1\n\n" .
        $_[3] . "\n\n"
    ) and close M or die "Can not close sendmail pipe: $!";
}
