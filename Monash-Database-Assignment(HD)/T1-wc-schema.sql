--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-wc-schema.sql

--Student ID: 30864941
--Student Name: Andrew Lee
--Unit Code: 2094 
--Applied Class No: 07 

/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- PASSENGER
CREATE TABLE passenger (


passenger_id NUMBER (6) NOT NULL PRIMARY KEY,
passenger_fname VARCHAR (30), 
passenger_lname VARCHAR (30),
passenger_dob DATE NOT NULL,
passenger_gender CHAR (1) NOT NULL,
passenger_contact CHAR (10) UNIQUE,
guardian_id NUMBER (6)

);


COMMENT ON COLUMN passenger.passenger_id IS 
'unique identifier for a passenger';

COMMENT ON COLUMN passenger.passenger_fname IS
'passenger first name';

COMMENT ON COLUMN passenger.passenger_lname IS 
'passenger last name';

COMMENT ON COLUMN passenger.passenger_dob IS
'passenger date of birth';

COMMENT ON COLUMN passenger.passenger_gender IS
'passenger gender(M for male,F for female or X for non-binary/indeterminate/intersex/unspecified/other)';

COMMENT ON COLUMN passenger.passenger_contact IS
'passenger contact number';

COMMENT ON COLUMN passenger.guardian_id IS
'passenger guardian id';



-- MANIFEST
CREATE TABLE manifest (

manifest_id NUMBER (7) NOT NULL PRIMARY KEY,
passenger_id NUMBER (6) NOT NULL,
cruise_id NUMBER(6) NOT NULL,
manifest_board_datetime DATE,
ship_code NUMBER (4) NOT NULL,
cabin_no NUMBER(5) NOT NULL


);
 
COMMENT ON COLUMN manifest.manifest_id IS
'manifest_id';

COMMENT ON COLUMN manifest.manifest_board_datetime IS
'date/time passenger boarded ship';


-- Add all missing FK Constraints below here

ALTER TABLE passenger ADD(
CONSTRAINT fk_guard FOREIGN KEY (guardian_id) REFERENCES passenger(passenger_id),
CONSTRAINT passenger_gender_constraint CHECK (passenger_gender IN ('M','F','X'))
); 

ALTER TABLE manifest ADD( 
    CONSTRAINT fk_PASSENGER FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id),
    CONSTRAINT fk_CRUISE FOREIGN KEY (cruise_id) REFERENCES cruise(cruise_id),
    CONSTRAINT fk_CABIN_NO FOREIGN KEY (cabin_no,ship_code) REFERENCES cabin(cabin_no,ship_code),
    CONSTRAINT u_passenger_cruise UNIQUE (passenger_id, cruise_id)
);







