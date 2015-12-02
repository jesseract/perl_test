# Project two : Perl / Database
#
# You will write a Perl script to output the contents of a table in a database.
#
# 1) Create a database containing one table with data.  (You must have at lease three columns.)  (You can use the data from project one.)
#
# 2) Using the DBI Perl module, write a perl script that connects to a database.
#
# 3) The script selects the contents of the table you created.
#
# 4) Finally the script prints out the contents of the table.
#
# We are looking for a syntactically correct perl script.
#
# Helpful Hint:
#
# Use SQLite for a simple database.  (https://www.sqlite.org/)
#!/usr/bin/perl

use DBI;
use strict;
#strict is a compliler flag that tells the Perl compiler to generate an error if you access a variable without declaration, use symbolic references or try to use a bareword identifier in an improper way

my $driver = "SQLite";
my $database = "companions.db";
my $dsn = "DBI:$driver:dbname=$database";
#dsn = data source name; it contains the type of the database. It will give DBI the clue to which DBD to load
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;

print "Opened database successfully\n";

my $sth  = $dbh->prepare("SELECT * FROM companions");
$sth->execute();
#sth = statement handle object 

while ( (my $first_name, my $last_name, my $home) = $sth->fetchrow_array() ) 
#fetchrow_array returns the values of the next row in the result set as a list that we can assign to an array
{
    	print "$first_name\t\t $last_name\t\t $home \n";
}

$sth->finish();

$dbh->disconnect();


