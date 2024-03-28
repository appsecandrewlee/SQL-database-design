--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-wc-insert.sql

--Student ID: 30864941
--Student Name: ANDREW 
--Unit Code: 2094
--Applied Class No: 07

/* Comments for your marker:


*/

-- Task 2 Load the PASSENGER and MANIFEST tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- PASSENGER           --6             --30         --30            --DATE          --M               --10          --6

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact)
VALUES(223344,'Peter','RU',to_date('01/APR/01','dd/MON/yy'),'M','33334444');

INSERT INTO passenger(passenger_id,passenger_dob,passenger_gender)
VALUES(334455,to_date('02/APR/01','dd/MON/yy'),'X');

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact)
VALUES(445566,'Onil','Terreno',to_date('03/APR/01','dd/MON/yy'),'M','44445555');

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact)
VALUES(556677,'Maria','Kjelsen',to_date('04/APR/01','dd/MON/yy'),'F','55556666');

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact)
VALUES(667788,'Zhiwei','Deng',to_date('05/APR/01','DD/MON/YY'),'M','66667777');

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact)
VALUES(778899,'June','Lesley',to_date('06/APR/01','dd/MON/yy'),'X','77778888');

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact)
VALUES(889900,'Desden','Richmond',to_date('07/APR/01','dd/MON/yy'),'M','99990000');

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact)
VALUES(990011,'Bruce','Ling',to_date('08/APR/01','dd/MON/yy'),'M','12345678');

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact)
VALUES(001122,'Henry','Lin',to_date('09/APR/01','dd/MON/yy'),'M','100008');

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact)
VALUES(001345,'montereo','richard',to_date('10/APR/01','dd/MON/yy'),'M','100009');


--Passenger Under 18 
INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact,guardian_id)
VALUES(003344,'Dennis','Henz',to_date('01/MAY/10','dd/MON/yy'),'M','7772123',223344);

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact,guardian_id)
VALUES(005566,'Frederiksen','klusgaard',to_date('02/MAY/10','dd/MON/yy'),'M','2130990',334455);

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact,guardian_id)
VALUES(006677,'kristine','zheng',to_date('03/MAY/10','dd/MON/yy'),'F','34591292',445566);

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact,guardian_id)
VALUES(007788,'Tensen','wilhelm',to_date('04/MAY/10','dd/MON/yy'),'X','2302139',556677);

INSERT INTO passenger(passenger_id,passenger_fname,passenger_lname,passenger_dob,passenger_gender,passenger_contact,guardian_id)
VALUES(008899,'ted','fred',to_date('05/MAY/10','dd/MON/yy'),'X','21039210',667788);



-- =======================================


-- =======================================



-- MANIFEST
INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(1,223344,1,to_date('02/APR/22 10:00AM','dd/MON/yy hh:miPM'),101,1001);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(2,334455,2,to_date('16/APR/22 10:00AM','dd/MON/yy hh:miPM'),102,2001);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(3,445566,3,to_date('16/APR/22 10:00AM','dd/MON/yy hh:miPM'),103,110);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(4,556677,4,to_date('07/MAY/22 10:00AM','dd/MON/yy hh:miPM'),101,1002);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(5,667788,5,to_date('08/MAY/22 10:00AM','dd/MON/yy hh:miPM'),102,2002);

--two passengers who completed more than 1 cruise
INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(6,778899,1,to_date('02/APR/22 10:00AM','dd/MON/yy hh:miPM'),101,1003);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(7,889900,4,to_date('07/MAY/22 10:00AM','dd/MON/yy hh:miPM'),104,213);

--two passengers who did not show up 
INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(8,990011,4,101,2023);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(9,001122,5,102,2013);


--booked future cruises
INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(10,001345,7,103,112);

--
INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(11,003344,8,105,9014);



--
INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(12,005566,6,to_date('18/SEP/22 10:00AM','dd/MON/yy hh:miPM'),101,3002);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(13,006677,6,to_date('18/SEP/22 10:00AM','dd/MON/yy hh:miPM'),101,3001);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(14,007788,6,to_date('18/SEP/22 10:00AM','dd/MON/yy hh:miPM'),101,2022);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(15,008899,6,to_date('18/SEP/22 10:00AM','dd/MON/yy hh:miPM'),101,2002);

--two passengers who completed more than 1 cruise
INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(16,778899,2,to_date('16/APR/22 10:00AM','dd/MON/yy hh:miPM'),102,2003);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(17,889900,5,to_date('08/MAY/22 10:00AM','dd/MON/yy hh:miPM'),102,4002);
--18 
INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(18,005566,8,105,10103);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(19,006677,8,105,10102);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(20,007788,8,105,10101);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(21,008899,8,105,9015);
--21
INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(22,005566,7,103,211);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(23,006677,7,103,113);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(24,007788,7,103,114);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,ship_code,cabin_no)
VALUES(25,008899,7,103,210);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(26,005566,5,to_date('08/MAY/22 10:00PM','dd/MON/yy hh:miPM'),102,4004);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(27,006677,5,to_date('08/MAY/22 10:10PM','dd/MON/yy hh:miPM'),102,4006);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(28,007788,5,to_date('08/MAY/22 10:20PM','dd/MON/yy hh:miPM'),102,4031);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(29,008899,5,to_date('08/MAY/22 10:30PM','dd/MON/yy hh:miPM'),102,4033);

INSERT INTO manifest(manifest_id,passenger_id,cruise_id,manifest_board_datetime,ship_code,cabin_no)
VALUES(30,001345,5,to_date('08/MAY/22 10:00PM','dd/MON/yy hh:miPM'),102,4034);
