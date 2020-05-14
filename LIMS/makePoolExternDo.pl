#!/usr/bin/perl 

########################################################################
# Tim M Strom   February 2007
########################################################################

use strict;
use CGI;
BEGIN {require './Solexa.pm';}

my $cgiquery     = new CGI;
my $file         = $cgiquery->param('file');
my $samples      = new Solexa;

########################################################################
# main
########################################################################

$samples->printHeader;
my $dbh=$samples->loadSessionId();

$samples->showMenu("makePoolExtern");
print "<span class=\"big\">Make Pool</span><br><br>" ;

print qq(
<form action="makePoolExternDo2.pl" method="post">
);
$samples->makePoolExtern($dbh,$file);
print qq(
<input type="submit" name="submit" value="MakePool">
</form>
Pool information is stored in this step.
);

$dbh->disconnect;

$samples->printFooter();
