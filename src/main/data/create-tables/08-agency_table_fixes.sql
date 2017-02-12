-- Despite having indicators that it's within AZ, 'San Carlos Agency' points to 'Bigg, AL'
-- It should probably point to Gila County
UPDATE agency SET county_id = 93 WHERE id = 645;
DELETE FROM county WHERE id = 90;
-- Agency with ORI NY05190 should point to Suffolk County, NY
UPDATE agency SET county_id = 1841 WHERE id = 8081;
DELETE FROM county WHERE id = 1937;
-- Agencies that pointed to Dade, FL should point to Miami-Dade, FL
UPDATE agency SET county_id = 355 WHERE county_id = 324;
-- Delete the extras that were created due to this error
DELETE FROM agency WHERE id IN (13867, 13868, 13869, 13870, 13871, 13872, 13873, 13874, 13875, 13876, 13877);
-- Delete the NY04230 agency associated with Virginia
DELETE FROM agency WHERE id = 18536 AND originating_agency_id = 'NY04230';
-- Agency VA08702 should point to Franklin City
UPDATE agency SET county_id = 3148 WHERE originating_agency_id = 'VA08702';
DELETE FROM agency WHERE id = 21772 AND originating_agency_id = 'VA08702';
-- Agency VA10750 should point to Fairfax City
UPDATE agency SET county_id = 3147 WHERE originating_agency_id = 'VA10750'
DELETE FROM agency WHERE id = 21786 AND originating_agency_id = 'VA10750'
-- Agency VA12200 should point to Richmond City
UPDATE agency SET county_id = 3149 WHERE originating_agency_id = 'VA12200';
DELETE FROM agency WHERE id = 21806 AND originating_agency_id = 'VA12200';
-- Agency VA12203 should point to Richmond City
UPDATE agency SET county_id = 3149 WHERE originating_agency_id = 'VA12203';
DELETE FROM agency WHERE id = 21807 AND originating_agency_id = 'VA12203';
-- Agency VA122SP should point to Richmond City
UPDATE agency SET county_id = 3149 WHERE originating_agency_id = 'VA122SP';
DELETE FROM agency WHERE id = 21811 AND originating_agency_id = 'VA122SP';
-- Agency VA12300 should point to Roanoke City
UPDATE agency SET county_id = 3150 WHERE originating_agency_id = 'VA12300';
DELETE FROM agency WHERE id = 21812 AND originating_agency_id = 'VA12300';
-- Agency VA123SP should point to Roanoke City
UPDATE agency SET county_id = 3150 WHERE originating_agency_id = 'VA123SP';
DELETE FROM agency WHERE id = 21814 AND originating_agency_id = 'VA123SP';
-- Agency VA381SP should point to Roanoke City
UPDATE agency SET county_id = 3150 WHERE originating_agency_id = 'VA381SP';
DELETE FROM agency WHERE id = 21827 AND originating_agency_id = 'VA381SP';
-- Agency VAPPD00 should point to Richmond City
UPDATE agency SET county_id = 3149 WHERE originating_agency_id = 'VAPPD00';
DELETE FROM agency WHERE id = 21829 AND originating_agency_id = 'VAPPD00';
-- Agency VAVSP00 should point to Richmond City
UPDATE agency SET county_id = 3149 WHERE originating_agency_id = 'VAVSP00';
DELETE FROM agency WHERE id = 21830 AND originating_agency_id = 'VAVSP00';
-- Agency VA02101 is named "Chesterfield" not "Chesterfield County Police Department"
UPDATE clearance_rate SET agency_id = 11722 WHERE agency_id = 11721;
DELETE FROM agency WHERE id = 11721 AND originating_agency_id = 'VA02101';
-- Agency VA01001 was in Bedford City, not Bedford County.  No murders are reported 
-- to this agency because Bedford City is no longer incorporated.  Simply present
-- for historical accuracy
UPDATE agency SET county_id = 3146 WHERE id = 11693 AND originating_agency_id = 'VA01001';
DELETE FROM agency WHERE id = 21718 AND originating_agency_id = 'VA01001';
