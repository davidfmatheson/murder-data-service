-- Despite having indicators that it's within AZ, 'San Carlos Agency' points to 'Bigg, AL'
-- It should probably point to Gila County
UPDATE agency SET county_id = 4 WHERE id = 645;
DELETE FROM county WHERE id = 90;
-- Agency with ORI NY05190 should point to Suffolk County, NY
UPDATE agency SET county_id = 1841 WHERE id = 8081;
DELETE FROM county WHERE id = 1937;
