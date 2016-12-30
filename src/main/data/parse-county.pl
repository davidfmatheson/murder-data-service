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
		my $state = $fields[0];
		my $state_fips = $fields[1];
		my $county_fips = $fields[2];
		my $county_name = $fields[3];
		
		my $sth = $dbh->prepare("
			SELECT county.id, county.name FROM county, state WHERE county.state_id = state.id AND state.abbreviation = ? AND county.name = ?");
		$sth->execute($state, $county_name);

		warn "Problem in retrieving results", $sth->errstr(), "\n"
			if $sth->errstr();
		my $rows = $sth->rows;

		if ( $rows == 1 ) {
			my @row = $sth->fetchrow_array();
			my $county_id = $row[0];
			my $county_original_name = $row[1];

			print $state . "::" . $county_id . "::" . $county_name . "::" . $county_fips . "\n";
		} elsif ( $rows == 0) {
			my $sth = $dbh->prepare("
				SELECT id FROM state WHERE state.abbreviation = ?");
			$sth->execute($state);
			
			warn "Problem in retrieving results", $sth->errstr(), "\n"
				if $sth->errstr();
			$rows = $sth->rows;
			
			if ( $rows == 1 ) {
				my @row = $sth->fetchrow_array();
				my $state_id = $row[0];
				
				print "No results for " . $state . "::" . $state_id . "::" . $county_name . "::" . $county_fips . "\n";
			} else {
				print "Problem getting a state.id for " . $state . "\n";
			}
		} else {
			print "Multiple results for " . $state . "::" . $county_name . "\n";
		}
	} else {
		my $err = $csv->error_diag;
		die "Line could not be parsed: $err\n";
	}
}
