--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-wc-alter.sql

--Student ID: 30864941
--Student Name: ANDREW LEE
--Unit Code: 2094
--Applied Class No: 07

/* Comments for your marker:



*/

--4(a)

ALTER TABLE cruise ADD (
    passenger_count NUMERIC DEFAULT(0)
);

UPDATE cruise c
SET passenger_count = (SELECT count(m.passenger_id) FROM manifest m WHERE c.cruise_id = m.cruise_id GROUP BY m.cruise_id);

--4(b)

DROP TABLE maintenance PURGE;

CREATE TABLE maintenance (
    maintenance_id NUMBER(5) NOT NULL PRIMARY KEY,
    ship_code NUMBER(4) NOT NULL,
    maintenance_start_date DATE NOT NULL,
    maintenance_expected_end_date DATE NOT NULL,
    maintenance_type CHAR (1) NOT NULL
);

COMMENT ON COLUMN maintenance.maintenance_id IS 'unique' ;
COMMENT ON COLUMN maintenance.ship_code IS 'ship code';
COMMENT ON COLUMN maintenance.maintenance_start_date IS 'Start Date';
COMMENT ON COLUMN maintenance.maintenance_expected_end_date IS 'Expected End';
COMMENT ON COLUMN maintenance.maintenance_type IS 'Conditions';




ALTER TABLE maintenance ADD(
CONSTRAINT fk_ship_code FOREIGN KEY (ship_code) REFERENCES ship(ship_code),
CONSTRAINT constraint_maintenance_type CHECK (maintenance_type IN ('S','B','C')),
CONSTRAINT constraint_maintenance_date CHECK (maintenance_start_date < maintenance_expected_end_date)
); 

        
--4(c)
ALTER TABLE manifest ADD (
    guardian_id NUMBER (6)
);

COMMENT ON COLUMN manifest.guardian_id IS
'passenger guardian id';

UPDATE manifest m
SET guardian_id = (SELECT guardian_id FROM passenger p WHERE m.passenger_id = p.passenger_id);

ALTER TABLE passenger DROP COLUMN guardian_id;

--END 