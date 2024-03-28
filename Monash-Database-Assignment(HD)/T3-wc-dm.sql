--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-wc-dm.sql

--Student ID: 30864941
--Student Name: ANDREW LEE
--Unit Code: 2094
--Applied Class No: 07

/* Comments for your marker:





*/

--3(a)
DROP SEQUENCE PASSENGER_SEQUENCE;
DROP SEQUENCE MANIFEST_SEQUENCE;

CREATE SEQUENCE PASSENGER_SEQUENCE START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE MANIFEST_SEQUENCE START WITH 100 INCREMENT BY 1;

--3(b)
INSERT INTO PASSENGER(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact) values(
PASSENGER_SEQUENCE.NEXTVAL,
'Dominik',
'Davies',
to_date('08/MAY/62','dd/MON/yy'),
'M',
'04052454'
);

INSERT INTO PASSENGER(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,guardian_id) values(
PASSENGER_SEQUENCE.NEXTVAL,
'Henrietta',
'Davies',
to_date('08/MAY/05','dd/MON/yy'),
'F',
(SELECT passenger_id FROM passenger WHERE passenger_contact = '04052454')
);


INSERT INTO PASSENGER(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,guardian_id) values(
PASSENGER_SEQUENCE.NEXTVAL,
'Poppy',
'Davies',
to_date('08/MAY/04','dd/MON/yy'),
'F',
(SELECT passenger_id FROM passenger WHERE passenger_contact = '04052454')
);

INSERT INTO MANIFEST(manifest_id,passenger_id,cruise_id,ship_code,cabin_no) values(
MANIFEST_SEQUENCE.NEXTVAL,
(SELECT passenger_id FROM passenger WHERE passenger_contact = '04052454'),
(SELECT cruise_id FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM')), 
(SELECT ship_code FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM')),
210
);

INSERT INTO MANIFEST(manifest_id,passenger_id,cruise_id,ship_code,cabin_no) values(
MANIFEST_SEQUENCE.NEXTVAL,
(SELECT passenger_id FROM passenger WHERE guardian_id = (SELECT passenger_id FROM passenger WHERE passenger_contact = '04052454' ) AND passenger_fname = 'Poppy'),
(SELECT cruise_id FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM')), 
(SELECT ship_code FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM')),
210
);

INSERT INTO MANIFEST(manifest_id,passenger_id,cruise_id,ship_code,cabin_no) values(
MANIFEST_SEQUENCE.NEXTVAL,
(SELECT passenger_id FROM passenger WHERE guardian_id = (SELECT passenger_id FROM passenger WHERE passenger_contact = '04052454' ) AND passenger_fname = 'Henrietta'),
(SELECT cruise_id FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM')), 
(SELECT ship_code FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM')),
210
);


COMMIT; --single transaction 

--3(c)

DELETE FROM manifest WHERE 
    passenger_id = (SELECT passenger_id FROM passenger WHERE
            guardian_id = (SELECT passenger_id FROM passenger WHERE passenger_contact = '04052454') AND 
            passenger_fname = 'Poppy') AND 
    cruise_id = (SELECT cruise_id FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND 
            cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM'));

UPDATE MANIFEST SET
cabin_no = 113 WHERE
    passenger_id = (SELECT passenger_id FROM passenger WHERE guardian_id = (SELECT passenger_id FROM passenger WHERE passenger_contact = '04052454') AND passenger_fname = 'Henrietta') AND 
    cruise_id = (SELECT cruise_id FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM'));
 
UPDATE MANIFEST SET
cabin_no = 113 WHERE
    passenger_id = (SELECT passenger_id FROM passenger WHERE passenger_contact = '04052454') AND 
    cruise_id = (SELECT cruise_id FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM'));
    
COMMIT;
    
--3(d)
DELETE FROM manifest WHERE 
    passenger_id = (SELECT passenger_id FROM passenger WHERE
            guardian_id = (SELECT passenger_id FROM passenger WHERE passenger_contact = '04052454') AND 
            passenger_fname = 'Henrietta') AND 
    cruise_id = (SELECT cruise_id FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND 
            cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM'));

DELETE FROM manifest WHERE 
    passenger_id = (SELECT passenger_id FROM passenger WHERE passenger_contact = '04052454') AND 
    cruise_id = (SELECT cruise_id FROM cruise WHERE cruise_name = 'Melbourne to Auckland' AND 
            cruise_departure_datetime = to_date('23/10/2022 10:00AM','dd/mm/yyyy hh:miPM'));

COMMIT;


