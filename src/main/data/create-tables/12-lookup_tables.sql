-- Weapon
DROP TABLE IF EXISTS weapon;

CREATE TABLE weapon (id integer, code varchar(255), description varchar(255), PRIMARY KEY(id));

INSERT INTO weapon (id, code, description) VALUES (1, '11', 'Firearm, type not stated');
INSERT INTO weapon (id, code, description) VALUES (2, '12', 'Handgun - pistol, revolver, etc');
INSERT INTO weapon (id, code, description) VALUES (3, '13', 'Rifle');
INSERT INTO weapon (id, code, description) VALUES (4, '14', 'Shotgun');
INSERT INTO weapon (id, code, description) VALUES (5, '15', 'Other gun');
INSERT INTO weapon (id, code, description) VALUES (6, '20', 'Knife or cutting instrument');
INSERT INTO weapon (id, code, description) VALUES (7, '30', 'Blunt object - hammer, club, etc');
INSERT INTO weapon (id, code, description) VALUES (8, '40', 'Personal weapons, includes beating');
INSERT INTO weapon (id, code, description) VALUES (9, '50', 'Poison - does not include gas');
INSERT INTO weapon (id, code, description) VALUES (10, '55', 'Pushed or thrown out window');
INSERT INTO weapon (id, code, description) VALUES (11, '60', 'Explosives');
INSERT INTO weapon (id, code, description) VALUES (12, '65', 'Fire');
INSERT INTO weapon (id, code, description) VALUES (13, '70', 'Narcotics or drugs, sleeping pills');
INSERT INTO weapon (id, code, description) VALUES (14, '75', 'Drowning');
INSERT INTO weapon (id, code, description) VALUES (15, '80', 'Strangulation - hanging');
INSERT INTO weapon (id, code, description) VALUES (16, '85', 'Asphyxiation - includes death by gas');
INSERT INTO weapon (id, code, description) VALUES (17, '90', 'Other or type unknown');

ALTER TABLE weapon MODIFY COLUMN id integer NOT NULL AUTO_INCREMENT;

-- Crime
DROP TABLE IF EXISTS offense;

CREATE TABLE offense (id integer, code varchar(255), description varchar(255), PRIMARY KEY(id));

INSERT INTO offense (id, code, description) VALUES(1, 'A', 'Murder and non-negligent manslaughter');
INSERT INTO offense (id, code, description) VALUES(2, 'B', 'Manslaughter by negligence');

ALTER TABLE offense MODIFY COLUMN id integer NOT NULL AUTO_INCREMENT;

-- Situation
DROP TABLE IF EXISTS situation;

CREATE TABLE situation (id integer, code varchar(255), description varchar(255), PRIMARY KEY(id));

INSERT INTO situation (id, code, description) VALUES(1, 'A', 'Single victim/single offender');
INSERT INTO situation (id, code, description) VALUES(2, 'B', 'Single victim/unknown offender(s)');
INSERT INTO situation (id, code, description) VALUES(3, 'C', 'Single victim/multiple offenders');
INSERT INTO situation (id, code, description) VALUES(4, 'D', 'Multiple victims/single offender');
INSERT INTO situation (id, code, description) VALUES(5, 'E', 'Multiple victims/multiple offenders');
INSERT INTO situation (id, code, description) VALUES(6, 'F', 'Multiple victims/unknown offender(s)');

ALTER TABLE situation MODIFY COLUMN id integer NOT NULL AUTO_INCREMENT;

-- Sex
DROP TABLE IF EXISTS sex;

CREATE TABLE sex (id integer, code varchar(255), description varchar(255), PRIMARY KEY(id));

INSERT INTO sex (id, code, description) VALUES(1, 'F', 'Female');
INSERT INTO sex (id, code, description) VALUES(2, 'M', 'Male');
INSERT INTO sex (id, code, description) VALUES(3, 'U', 'Unknown');

ALTER TABLE sex MODIFY COLUMN id integer NOT NULL AUTO_INCREMENT;

-- Race
DROP TABLE IF EXISTS race ;

CREATE TABLE race (id integer, code varchar(255), description varchar(255), PRIMARY KEY(id));

INSERT INTO race (id, code, description) VALUES(1, 'A', 'Asian or Pacific Islander');
INSERT INTO race (id, code, description) VALUES(2, 'B', 'Black');
INSERT INTO race (id, code, description) VALUES(3, 'I', 'American Indian or Alaskan Native');
INSERT INTO race (id, code, description) VALUES(4, 'W', 'White');
INSERT INTO race (id, code, description) VALUES(5, 'U', 'Unknown');

ALTER TABLE race MODIFY COLUMN id integer NOT NULL AUTO_INCREMENT;

-- Ethnic Origin
DROP TABLE IF EXISTS ethnic_origin ;

CREATE TABLE ethnic_origin (id integer, code varchar(255), description varchar(255), PRIMARY KEY(id));

INSERT INTO ethnic_origin (id, code, description) VALUES(1, 'H', 'Hispanic origin');
INSERT INTO ethnic_origin (id, code, description) VALUES(2, 'N', 'Not of Hispanic origin');
INSERT INTO ethnic_origin (id, code, description) VALUES(3, 'U', 'Unknown or not reported');

ALTER TABLE ethnic_origin MODIFY COLUMN id integer NOT NULL AUTO_INCREMENT;

-- Relationship
DROP TABLE IF EXISTS relationship ;

CREATE TABLE relationship (id integer, code varchar(255), description varchar(255), PRIMARY KEY(id));
INSERT INTO relationship (id, code, description) VALUES(1, 'AQ', 'Acquaintance');
INSERT INTO relationship (id, code, description) VALUES(2, 'BF', 'Boyfriend');
INSERT INTO relationship (id, code, description) VALUES(3, 'BR', 'Brother');
INSERT INTO relationship (id, code, description) VALUES(4, 'CH', 'Common-law husband');
INSERT INTO relationship (id, code, description) VALUES(5, 'CW', 'Common-law wife');
INSERT INTO relationship (id, code, description) VALUES(6, 'DA', 'Daughter');
INSERT INTO relationship (id, code, description) VALUES(7, 'EE', 'Employee');
INSERT INTO relationship (id, code, description) VALUES(8, 'ER', 'Employer');
INSERT INTO relationship (id, code, description) VALUES(9, 'FA', 'Father');
INSERT INTO relationship (id, code, description) VALUES(10, 'FR', 'Friend');
INSERT INTO relationship (id, code, description) VALUES(11, 'GF', 'Girlfriend');
INSERT INTO relationship (id, code, description) VALUES(12, 'HO', 'Homosexual relationship');
INSERT INTO relationship (id, code, description) VALUES(13, 'HU', 'Husband');
INSERT INTO relationship (id, code, description) VALUES(14, 'IL', 'In-law');
INSERT INTO relationship (id, code, description) VALUES(15, 'MO', 'Mother');
INSERT INTO relationship (id, code, description) VALUES(16, 'NE', 'Neighbor');
INSERT INTO relationship (id, code, description) VALUES(17, 'OF', 'Other family');
INSERT INTO relationship (id, code, description) VALUES(18, 'OK', 'Other - known to victim');
INSERT INTO relationship (id, code, description) VALUES(19, 'SD', 'Stepdaughter');
INSERT INTO relationship (id, code, description) VALUES(20, 'SF', 'Stepfather');
INSERT INTO relationship (id, code, description) VALUES(21, 'SI', 'Sister');
INSERT INTO relationship (id, code, description) VALUES(22, 'SM', 'Stepmother');
INSERT INTO relationship (id, code, description) VALUES(23, 'SO', 'Son');
INSERT INTO relationship (id, code, description) VALUES(24, 'SS', 'Stepson');
INSERT INTO relationship (id, code, description) VALUES(25, 'ST', 'Stranger');
INSERT INTO relationship (id, code, description) VALUES(26, 'UN', 'Relationship not determined');
INSERT INTO relationship (id, code, description) VALUES(27, 'WI', 'Wife');
INSERT INTO relationship (id, code, description) VALUES(28, 'XH', 'Ex-husband');
INSERT INTO relationship (id, code, description) VALUES(29, 'XW', 'Ex-wife');

ALTER TABLE relationship MODIFY COLUMN id integer NOT NULL AUTO_INCREMENT;

-- Circumstance
DROP TABLE IF EXISTS circumstance ;

CREATE TABLE circumstance (id integer, code varchar(255), description varchar(255), PRIMARY KEY(id));

INSERT INTO circumstance (id, code, description) VALUES (1, '2', 'Rape');
INSERT INTO circumstance (id, code, description) VALUES (2, '3', 'Robbery');
INSERT INTO circumstance (id, code, description) VALUES (3, '5', 'Burglary');
INSERT INTO circumstance (id, code, description) VALUES (4, '6', 'Larceny');
INSERT INTO circumstance (id, code, description) VALUES (5, '7', 'Motor vehicle theft');
INSERT INTO circumstance (id, code, description) VALUES (6, '9', 'Arson');
INSERT INTO circumstance (id, code, description) VALUES (7, '10', 'Prostitution and commercialized vice');
INSERT INTO circumstance (id, code, description) VALUES (8, '17', 'Other sex offense');
INSERT INTO circumstance (id, code, description) VALUES (9, '18', 'Narcotic drug laws');
INSERT INTO circumstance (id, code, description) VALUES (10, '19', 'Gambling');
INSERT INTO circumstance (id, code, description) VALUES (11, '26', 'Other - not specified');
INSERT INTO circumstance (id, code, description) VALUES (12, '32', 'Abortion');
INSERT INTO circumstance (id, code, description) VALUES (13, '40', 'Lovers triangle');
INSERT INTO circumstance (id, code, description) VALUES (14, '41', 'Child killed by babysitter');
INSERT INTO circumstance (id, code, description) VALUES (15, '42', 'Brawl due to influence of alcohol');
INSERT INTO circumstance (id, code, description) VALUES (16, '43', 'Brawl due to influence of narcotics');
INSERT INTO circumstance (id, code, description) VALUES (17, '44', 'Argument over money or property');
INSERT INTO circumstance (id, code, description) VALUES (18, '45', 'Other arguments');
INSERT INTO circumstance (id, code, description) VALUES (19, '46', 'Gangland killings');
INSERT INTO circumstance (id, code, description) VALUES (20, '47', 'Juvenile gang killings');
INSERT INTO circumstance (id, code, description) VALUES (21, '48', 'Institutional killings');
INSERT INTO circumstance (id, code, description) VALUES (22, '49', 'Sniper attack');
INSERT INTO circumstance (id, code, description) VALUES (23, '50', 'Victim shot in hunting accident');
INSERT INTO circumstance (id, code, description) VALUES (24, '51', 'Gun-cleaning death - other than self');
INSERT INTO circumstance (id, code, description) VALUES (25, '52', 'Children playing with gun');
INSERT INTO circumstance (id, code, description) VALUES (26, '53', 'Other negligent handling of gun');
INSERT INTO circumstance (id, code, description) VALUES (27, '59', 'All other manslaughter by negligence');
INSERT INTO circumstance (id, code, description) VALUES (28, '60', 'Other');
INSERT INTO circumstance (id, code, description) VALUES (29, '70', 'All suspected felony type');
INSERT INTO circumstance (id, code, description) VALUES (30, '80', 'Felon killed by private citizen');
INSERT INTO circumstance (id, code, description) VALUES (31, '81', 'Felon killed by police');
INSERT INTO circumstance (id, code, description) VALUES (32, '99', 'Circumstances undetermined');

ALTER TABLE circumstance MODIFY COLUMN id integer NOT NULL AUTO_INCREMENT;

-- Sub-circumstance
DROP TABLE IF EXISTS sub_circumstance ;

CREATE TABLE sub_circumstance (id integer, code varchar(255), description varchar(255), PRIMARY KEY(id));

INSERT INTO sub_circumstance (id, code, description) VALUES (1, 'A', 'Felon attacked police officer');
INSERT INTO sub_circumstance (id, code, description) VALUES (2, 'B', 'Felon attacked fellow police officer');
INSERT INTO sub_circumstance (id, code, description) VALUES (3, 'C', 'Felon attacked a civilian');
INSERT INTO sub_circumstance (id, code, description) VALUES (4, 'D', 'Felon attempted flight from a crime');
INSERT INTO sub_circumstance (id, code, description) VALUES (5, 'E', 'Felon killed in commission of a crime');
INSERT INTO sub_circumstance (id, code, description) VALUES (6, 'F', 'Felon resisted arrest');
INSERT INTO sub_circumstance (id, code, description) VALUES (7, 'G', 'Not enough information to determine');

ALTER TABLE sub_circumstance MODIFY COLUMN id integer NOT NULL AUTO_INCREMENT;

-- Months
DROP TABLE IF EXISTS month;

CREATE TABLE month (id integer, code integer, description varchar(255), PRIMARY KEY(id));
INSERT INTO month (id, code, description) VALUES (1, 1, 'January');
INSERT INTO month (id, code, description) VALUES (2, 2, 'February');
INSERT INTO month (id, code, description) VALUES (3, 3, 'March');
INSERT INTO month (id, code, description) VALUES (4, 4, 'April');
INSERT INTO month (id, code, description) VALUES (5, 5, 'May');
INSERT INTO month (id, code, description) VALUES (6, 6, 'June');
INSERT INTO month (id, code, description) VALUES (7, 7, 'July');
INSERT INTO month (id, code, description) VALUES (8, 8, 'August');
INSERT INTO month (id, code, description) VALUES (9, 9, 'September');
INSERT INTO month (id, code, description) VALUES (10, 10, 'October');
INSERT INTO month (id, code, description) VALUES (11, 11, 'November');
INSERT INTO month (id, code, description) VALUES (12, 12, 'December');

ALTER TABLE month MODIFY COLUMN id integer NOT NULL AUTO_INCREMENT;
