#!/opt/local/bin/perl
use strict;
use warnings;

use Text::CSV;
use DBI;
use Data::Dumper;

my $csv = Text::CSV->new({ sep_char => ',' });
my $file = $ARGV[0] or die "Need to get CSV file on the command line\n";

my $db_name = "murder_data";
my $db_host = "localhost";
my $db_user = $ARGV[1] or die "Need to specify DB username on the command line\n";
my $db_pass = $ARGV[2] or die "Need to specify DB password on the command line\n";
my $dbh = DBI->connect("DBI:mysql:database=$db_name:host=$db_host",
	$db_user,
	$db_pass) or die "Can't connect to database: $DBI::errstr\n";

my @lookups = ("month", "circumstance", "sub_circumstance", "weapon", "ethnic_origin", "race", "relationship", "sex", "situation", "offense");
my %lookup_map;

foreach (@lookups) {
	my $sth_lookup = $dbh->prepare("SELECT id, code FROM " . $_);
	$sth_lookup->execute();
	warn "Problem in retrieving results", $sth_lookup->errstr(), "\n"
		if $sth_lookup->errstr();
	while (my @row = $sth_lookup->fetchrow_array) {
		my $id = $row[0];
		my $code = $row[1];
		$lookup_map{$_}{$code} = $id;
	}
}

open(my $data, '<', $file) or die "Could not open '$file' $!\n";
while ( my $line = <$data> ) {
	chomp $line;

	if ($csv->parse($line)) {
		my @fields = $csv->fields();
		my $id = $fields[0];
		my $state_county_fips = $fields[1];
		my $ori = $fields[2];
		my $state = $fields[3];
		my $agency_name = $fields[4];
		my $agency_type = $fields[5];
		my $source = $fields[6];
		my $solved = $fields[7];
		my $year = $fields[8];
		my $state_name = $fields[9];
		my $month = $fields[10];
		my $incident_number = $fields[11];
		my $action_type = $fields[12];
		my $offense = $fields[13];
		my $situation = $fields[14];
		my $victim_age = $fields[15];
		my $victim_sex = $fields[16];
		my $victim_race = $fields[17];
		my $victim_ethnic_origin = $fields[18];
		my $offender_age = $fields[19];
		my $offender_sex = $fields[20];
		my $offender_race = $fields[21];
		my $offender_ethnic_origin = $fields[22];
		my $weapon = $fields[23];
		my $relationship = $fields[24];
		my $circumstance = $fields[25];
		my $sub_circumstance = $fields[26];
		my $additional_victim_count = $fields[27];
		my $additional_offender_count = $fields[28];

		my $fips_state = substr($state_county_fips, 0, 2);
		$fips_state += 0;
		my $fips_county = substr($state_county_fips, 2);
		$fips_county += 0;

		# my $sth = $dbh->prepare("
		#	SELECT agency.id, county.id, state.id FROM agency, county, state WHERE agency.county_id = county.id AND county.state_id = state.id AND agency.originating_agency_id = ? AND county.fips_county = ? AND state.fips_state = ?");
		my $sth = $dbh->prepare("
			SELECT agency.id, county.id, state.id FROM agency, county, state WHERE agency.county_id = county.id AND county.state_id = state.id AND agency.originating_agency_id = ?");
		$sth->execute($ori);

		warn "Problem in retrieving results", $sth->errstr(), "\n"
			if $sth->errstr();
		my $rows = $sth->rows;

		if ( $rows == 1 ) {
			my @row = $sth->fetchrow_array();
			my $agency_id = $row[0];
			my $county_id = $row[1];
			my $state_id = $row[2];

			my $month_id = $lookup_map{'month'}{$month};
			my $offense_id = $lookup_map{'offense'}{$offense};
			my $situation_id = $lookup_map{'situation'}{$situation};
			my $victim_sex_id = $lookup_map{'sex'}{$victim_sex};
			my $victim_race_id = $lookup_map{'race'}{$victim_race};
			my $victim_ethnic_origin_id = $lookup_map{'ethnic_origin'}{$victim_ethnic_origin};
			my $offender_sex_id = $lookup_map{'sex'}{$offender_sex};
			my $offender_race_id = $lookup_map{'race'}{$offender_race};
			my $offender_ethnic_origin_id = $lookup_map{'ethnic_origin'}{$offender_ethnic_origin};
			my $weapon_id = $lookup_map{'weapon'}{$weapon};
			my $relationship_id = $lookup_map{'relationship'}{$relationship};
			my $circumstance_id = $lookup_map{'circumstance'}{$circumstance};
			my $sub_circumstance_id;
			
			if (exists $lookup_map{'sub_circumstance'}{$sub_circumstance}) {
				$sub_circumstance_id = $lookup_map{'sub_circumstance'}{$sub_circumstance};
			} else {
				$sub_circumstance_id = "null";
			}

			print "INSERT INTO case (agency_id, solved, year, month_id, incident_number, offense_id, situation_id, victim_age, victim_sex_id, victim_race_id, victim_ethnic_origin_id, offender_age, offender_sex_id, offender_race_id, offender_ethnic_origin_id, weapon_id, relationship_id, circumstance_id, sub_circumstance_id, additional_victim_count, additional_offender_count) VALUES (" . $agency_id . ", " . $solved . ", " . $year . ", " . $month_id . ", " . $incident_number . ", " . $offense_id .  ", " . $situation_id . ", " . $victim_age . ", " .  $victim_sex_id . ", " . $victim_race_id . ", " . $victim_ethnic_origin_id . ", " . $offender_age . ", " . $offender_sex_id . ", " . $offender_race_id . ", " . $offender_ethnic_origin_id . ", " . $weapon_id . ", " . $relationship_id . ", " . $circumstance_id . ", " . $sub_circumstance_id . ", " . $additional_victim_count . ", " . $additional_offender_count . ");\n";

		} elsif ( $rows == 0) {
			print "Couldn't find an agency for ORI: ". $ori . ", state/county FIPS: " . $state_county_fips . "\n";
		} else {
			print "Multiple results for ORI: ". $ori . ", state/county FIPS: " . $state_county_fips . "\n";
		}
	} else {
		warn "Line could not be parsed: $line\n";
	}
}
