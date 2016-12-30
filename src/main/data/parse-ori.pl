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
		my $state = $fields[1];
		my $county_fips = $fields[2];
		my $unit = $fields[3];
		my $state_county = $fields[4];
		my $fstate = $fields[5];
		my $state_county_fips = $fields[6];
		my $agency_name = $fields[7];

		my $fips_state = substr($state_county_fips, 0, 2);
		$fips_state += 0;
		my $fips_county = substr($state_county_fips, 2);
		$fips_county += 0;

		my $sth = $dbh->prepare("
			SELECT county.id, state.id FROM agency, county, state WHERE agency.county_id = county.id AND county.state_id = state.id AND agency.originating_agency_id = ? AND state.fips_state = ? AND county.fips_county = ?");
		$sth->execute($ori, $fips_state, $fips_county);

		warn "Problem in retrieving results", $sth->errstr(), "\n"
			if $sth->errstr();
		my $rows = $sth->rows;

		if ( $rows == 1 ) {
			my @row = $sth->fetchrow_array();
			my $county_id = $row[0];
			my $state_id = $row[1];

			print $ori . "::" . $county_id . "::" . $state_id . "\n";
		} elsif ( $rows == 0) {

			$sth = $dbh->prepare("
				SELECT county.id, state.id FROM county, state WHERE county.state_id = state.id AND state.fips_state = ? AND county.fips_county = ?");
			$sth->execute($fips_state, $fips_county);

			warn "Problem in retrieving results", $sth->errstr(), "\n"
				if $sth->errstr();
			$rows = $sth->rows;
			if ($rows == 1) {
				my @row = $sth->fetchrow_array();
				my $county_id = $row[0];
				my $state_id = $row[1];
				
				print "No results for " . $ori . "::" . $agency_name . "::" . $county_id . "\n";
			} else {
				print "Problem finding a county for " . $fips_state . "::" . $fips_county . "\n";
			}
		} else {
			print "Multiple results for " . $agency_name . "::" . $state . "\n";
		}
	} else {
		warn "Line could not be parsed: $line\n";
	}
}
