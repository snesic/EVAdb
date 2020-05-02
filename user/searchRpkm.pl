#!/usr/bin/perl 

########################################################################
# Tim M Strom   February 2007
########################################################################

use strict;
#use lib "/srv/www/cgi-bin/mysql/test";
use Snv;

my $snv         = new Snv;
my $cgi         = new CGI;
my $name        = $cgi->param('name');

$snv->printHeader();
$snv->loadSessionId();

$name           = $snv->htmlencode($name);
my $search      = $snv->initSearchRpkm($name);
	
$snv->showMenu("searchRpkm");
print "<span class=\"big\">Search</span><br><br>" ;

print "<form action=\"searchRpkmDo.pl\" method=\"post\" name=\"myform\">" ;

$snv->drawMask($search);

print "</form>" ;

$snv->printFooter();
