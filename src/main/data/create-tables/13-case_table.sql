DROP TABLE IF EXISTS case;

CREATE TABLE case_report (
	id							integer NOT NULL AUTO_INCREMENT, 
	agency_id					integer NOT NULL, 
	solved						boolean,
	year						integer,
	month_id					integer NOT NULL,
	incident_number				integer,
	offense_id					integer NOT NULL,
	situation_id				integer NOT NULL,
	victim_age					integer,
	victim_sex_id				integer NOT NULL,
	victim_race_id				integer NOT NULL,
	victim_ethnic_origin_id		integer NOT NULL,
	offender_age				integer,
	offender_sex_id				integer NOT NULL,
	offender_race_id			integer NOT NULL,
	offender_ethnic_origin_id	integer NOT NULL,
	weapon_id					integer NOT NULL,
	relationship_id				integer NOT NULL,
	circumstance_id				integer NOT NULL,
	sub_circumstance_id			integer,
	additional_victim_count		integer,
	additional_offender_count	integer,
    PRIMARY KEY (id), 
    FOREIGN KEY (agency_id)					REFERENCES agency(id),
    FOREIGN KEY (month_id)					REFERENCES month(id),
    FOREIGN KEY (offense_id)				REFERENCES offense(id),
    FOREIGN KEY (situation_id)				REFERENCES situation(id),
    FOREIGN KEY (victim_sex_id)				REFERENCES sex(id),
    FOREIGN KEY (victim_race_id)			REFERENCES race(id),
    FOREIGN KEY (victim_ethnic_origin_id)	REFERENCES ethnic_origin(id),
    FOREIGN KEY (offender_sex_id)			REFERENCES sex(id),
    FOREIGN KEY (offender_race_id)			REFERENCES race(id),
    FOREIGN KEY (offender_ethnic_origin_id)	REFERENCES ethnic_origin(id),
    FOREIGN KEY (weapon_id)					REFERENCES weapon(id),
    FOREIGN KEY (relationship_id)			REFERENCES relationship(id),
    FOREIGN KEY (circumstance_id)			REFERENCES circumstance(id),
    FOREIGN KEY (sub_circumstance_id)		REFERENCES sub_circumstance(id));
