#!/opt/local/bin/perl
use strict;
use warnings;

use Text::CSV;
use DBI;

my $csv = Text::CSV->new({ sep_char => ',' });
my $file = $ARGV[0] or die "Need to get CSV file on the command line\n";

my $db_name = "murder_data";
my $db_host = "localhost";
my $db_user = $ARGV[1] or die "Need to specify DB username on the command line\n";
my $db_pass = $ARGV[2] or die "Need to specify DB password on the command line\n";
my $dbh = DBI->connect("DBI:mysql:database=$db_name:host=$db_host",
	$db_user,
	$db_pass) or die "Can't connect to database: $DBI::errstr\n";

open(my $data, '<', $file) or die "Could not open '$file' $!\n";
 
while ( my $line = <$data> ) {
	chomp $line;

	if ($csv->parse($line)) {
		my @fields = $csv->fields();
		my $ori = $fields[0];
		my $ori_name = $fields[1];
		my $year = $fields[2];
		my $murders = $fields[3];
		my $clearances = $fields[4];
		my $state_name = $fields[5];
		$state_name =~ s/District of Columbia/Washington DC/;
		my $county_name = $fields[6];
		$county_name =~ s/, [A-Z][A-Z]//;

		my $agency = $fields[7];

		my $sth = $dbh->prepare("
			SELECT agency.id FROM agency, county, state WHERE agency.county_id = county.id AND county.state_id = state.id AND agency.originating_agency_id = ? AND agency.name = ? AND county.name = ? AND state.name = ?");
		$sth->execute($ori, $agency, $county_name, $state_name);

		warn "Problem in retrieving results", $sth->errstr(), "\n"
			if $sth->errstr();
		my $rows = $sth->rows;

		if ( $rows == 1 ) {
			my @row = $sth->fetchrow_array();
			my $agency_id = $row[0];

			print $ori . "::" . $agency . "::" . $agency_id . "::" . $year . "::" . $murders . "::" . $clearances . "\n";
		} else {
			print "No results for " . $agency . "::", $county_name . "::" . $state_name . "\n";
		}
	} else {
		warn "Line could not be parsed: $line\n";
	}
}
