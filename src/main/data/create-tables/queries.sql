SELECT county.name, state.abbreviation FROM county, state WHERE county.state_id = state.id;

-- Agency with state and county FIPS
SELECT agency.name
     , CONCAT(LPAD(state.fips_state, 2, '0'), LPAD(county.fips_county, 3, '0'))
     , county.name
     , state.abbreviation
  FROM agency,
       county,
	   state
 WHERE agency.county_id = county.id
   AND county.state_id = state.id;

SELECT agency.originating_agency_id
     , clearance_rate.year
     , clearance_rate.murders
     , clearance_rate.clearances
     , state.abbreviation
     , county.name
     , agency.name
  FROM state
     , county
     , agency
     , clearance_rate
 WHERE county.state_id          = state.id
   AND agency.county_id         = county.id
   AND clearance_rate.agency_id = agency.id
;

-- Agencies that have more than one ORI
SELECT agency.name
     , county.name
	 , state.name
     , COUNT(agency.originating_agency_id)
	 , GROUP_CONCAT(agency.originating_agency_id)
  FROM state
     , county
     , agency
 WHERE county.state_id          = state.id
   AND agency.county_id         = county.id
GROUP BY agency.name, county.name, state.name
HAVING COUNT(agency.originating_agency_id) > 1
ORDER BY state.name, county.name, agency.name
;

-- Agencies that have more than one ORI that are actually referred to in UCR
SELECT agency.name
     , county.name
	 , state.name
     , COUNT(agency.originating_agency_id)
  FROM state
     , county
     , agency
 WHERE county.state_id          = state.id
   AND agency.county_id         = county.id
   AND EXISTS (
	SELECT 1 FROM clearance_rate WHERE agency_id = agency.id
   )
GROUP BY agency.name, county.name, state.name
HAVING COUNT(agency.originating_agency_id) > 1
ORDER BY state.name, county.name, agency.name
;

SELECT agency.name
     , county.name
	 , state.name
     , clearance_rate.year
  FROM state
     , county
     , agency
	 , clearance_rate
 WHERE county.state_id          = state.id
   AND agency.county_id         = county.id
   AND clearance_rate.agency_id = agency.id
   AND clearance_rate.clearances > clearance_rate.murders
ORDER BY state.name DESC, county.name DESC, agency.name DESC, clearance_rate.year
;
