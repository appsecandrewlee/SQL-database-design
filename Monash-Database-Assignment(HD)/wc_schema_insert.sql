/*
  Databases 2022 S2 Assignment 2
  --World Cruise Schema File and Initial Data--
  
  Description: 
  This file creates the World Cruise tables 
  and populates several of the tables (those shown in purple on the supplied model). 
  You should read this schema file carefully 
  and be sure you understand the various data requirements.

Author: FIT Database Teaching Team
License: Copyright Monash University, unless otherwise stated. All Rights Reserved.
COPYRIGHT WARNING
Warning
This material is protected by copyright. For use within Monash University only. NOT FOR RESALE.
Do not remove this notice. 
  
*/

DROP TABLE cabin CASCADE CONSTRAINTS PURGE;

DROP TABLE country CASCADE CONSTRAINTS PURGE;

DROP TABLE cruise CASCADE CONSTRAINTS PURGE;

DROP TABLE manifest CASCADE CONSTRAINTS PURGE;

DROP TABLE operator CASCADE CONSTRAINTS PURGE;

DROP TABLE passenger CASCADE CONSTRAINTS PURGE;

DROP TABLE ship CASCADE CONSTRAINTS PURGE;

-- CREATING table CABIN
CREATE TABLE cabin (
    ship_code      NUMBER(4) NOT NULL,
    cabin_no       NUMBER(5) NOT NULL,
    cabin_capacity NUMBER(1) NOT NULL,
    cabin_class    CHAR(1) NOT NULL
);

ALTER TABLE cabin
    ADD CONSTRAINT cabin_class_chk CHECK ( cabin_class IN ( 'B', 'I', 'O', 'S' ) );

COMMENT ON COLUMN cabin.ship_code IS
    'Identifier for ship';

COMMENT ON COLUMN cabin.cabin_no IS
    'Cabin number on given ship';

COMMENT ON COLUMN cabin.cabin_capacity IS
    'Sleeping capacity for cabin';

COMMENT ON COLUMN cabin.cabin_class IS
    'WC class of the cabin ( B Balcony, I Interior, O Ocean View, S Suite)';

ALTER TABLE cabin ADD CONSTRAINT cabin_pk PRIMARY KEY ( cabin_no,
                                                        ship_code );

-- CREATING table COUNTRY
CREATE TABLE country (
    country_code CHAR(2) NOT NULL,
    country_name VARCHAR2(80) NOT NULL
);

COMMENT ON COLUMN country.country_code IS
    'ISO 3166-1 Alpha-2 Country code';

COMMENT ON COLUMN country.country_name IS
    'Country name';

ALTER TABLE country ADD CONSTRAINT country_pk PRIMARY KEY ( country_code );

-- CREATING table CRUISE
CREATE TABLE cruise (
    cruise_id                 NUMBER(6) NOT NULL,
    cruise_name               VARCHAR2(80) NOT NULL,
    cruise_description        VARCHAR2(200) NOT NULL,
    ship_code                 NUMBER(4) NOT NULL,
    cruise_departure_datetime DATE NOT NULL,
    cruise_duration           NUMBER(2) NOT NULL
);

COMMENT ON COLUMN cruise.cruise_id IS
    'Cruise identifier - used only for a single cruise';

COMMENT ON COLUMN cruise.cruise_name IS
    'Name of cruise';

COMMENT ON COLUMN cruise.cruise_description IS
    'Description of cruise';

COMMENT ON COLUMN cruise.ship_code IS
    'Identifier for ship';

COMMENT ON COLUMN cruise.cruise_departure_datetime IS
    'Cruise scheduled departure datetime';

COMMENT ON COLUMN cruise.cruise_duration IS
    'Cruise duration in days';

ALTER TABLE cruise ADD CONSTRAINT cruise_pk PRIMARY KEY ( cruise_id );

-- CREATING table OPERATOR
CREATE TABLE operator (
    oper_id        NUMBER(4) NOT NULL,
    oper_comp_name VARCHAR2(50) NOT NULL,
    oper_ceo       VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN operator.oper_id IS
    'Identifier for ship operator';

COMMENT ON COLUMN operator.oper_comp_name IS
    'Name of ship operator';

COMMENT ON COLUMN operator.oper_ceo IS
    'Name of CEO';

ALTER TABLE operator ADD CONSTRAINT operator_pk PRIMARY KEY ( oper_id );

-- CREATING table SHIP
CREATE TABLE ship (
    ship_code           NUMBER(4) NOT NULL,
    ship_name           VARCHAR2(50) NOT NULL,
    ship_date_commiss   DATE NOT NULL,
    ship_tonnage        NUMBER(6) NOT NULL,
    ship_guest_capacity NUMBER(4) NOT NULL,
    oper_id             NUMBER(4) NOT NULL,
    country_code        CHAR(2) NOT NULL
);

COMMENT ON COLUMN ship.ship_code IS
    'Identifier for ship';

COMMENT ON COLUMN ship.ship_name IS
    'Name of ship';

COMMENT ON COLUMN ship.ship_date_commiss IS
    'Date began operation';

COMMENT ON COLUMN ship.ship_tonnage IS
    'Gross tonnage of ship';

COMMENT ON COLUMN ship.ship_guest_capacity IS
    'Ships passenger capacity';

COMMENT ON COLUMN ship.oper_id IS
    'Identifier for ship operator';

COMMENT ON COLUMN ship.country_code IS
    'ISO 3166-1 Alpha-2 Country code';

ALTER TABLE ship ADD CONSTRAINT ship_pk PRIMARY KEY ( ship_code );

-- ADDING FK Constraints
ALTER TABLE ship
    ADD CONSTRAINT country_ship FOREIGN KEY ( country_code )
        REFERENCES country ( country_code );

ALTER TABLE ship
    ADD CONSTRAINT operator_ship FOREIGN KEY ( oper_id )
        REFERENCES operator ( oper_id );

ALTER TABLE cabin
    ADD CONSTRAINT ship_cabin FOREIGN KEY ( ship_code )
        REFERENCES ship ( ship_code );

ALTER TABLE cruise
    ADD CONSTRAINT ship_cruise FOREIGN KEY ( ship_code )
        REFERENCES ship ( ship_code );
        
-- *****************************************************************
-- NO FURTHER DATA MAY BE ADDED TO THESE TABLES NOR THE SUPPPLIED
-- DATA MODIFIED IN ANY WAY
-- *****************************************************************

-- INSERTING into COUNTRY
INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AF',
    'Afghanistan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AX',
    'Åland'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AL',
    'Albania'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'DZ',
    'Algeria'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AS',
    'American Samoa'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AD',
    'Andorra'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AO',
    'Angola'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AI',
    'Anguilla'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AQ',
    'Antarctica'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AG',
    'Antigua and Barbuda'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AR',
    'Argentina'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AM',
    'Armenia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AW',
    'Aruba'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AU',
    'Australia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AT',
    'Austria'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AZ',
    'Azerbaijan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BS',
    'Bahamas'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BH',
    'Bahrain'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BD',
    'Bangladesh'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BB',
    'Barbados'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BY',
    'Belarus'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BE',
    'Belgium'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BZ',
    'Belize'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BJ',
    'Benin'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BM',
    'Bermuda'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BT',
    'Bhutan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BO',
    'Bolivia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BQ',
    'Bonaire'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BA',
    'Bosnia and Herzegovina'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BW',
    'Botswana'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BV',
    'Bouvet Island'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BR',
    'Brazil'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'IO',
    'British Indian Ocean Territory'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'VG',
    'British Virgin Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BN',
    'Brunei'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BG',
    'Bulgaria'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BF',
    'Burkina Faso'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BI',
    'Burundi'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KH',
    'Cambodia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CM',
    'Cameroon'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CA',
    'Canada'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CV',
    'Cape Verde'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KY',
    'Cayman Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CF',
    'Central African Republic'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TD',
    'Chad'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CL',
    'Chile'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CN',
    'China'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CX',
    'Christmas Island'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CC',
    'Cocos [Keeling] Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CO',
    'Colombia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KM',
    'Comoros'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CK',
    'Cook Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CR',
    'Costa Rica'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'HR',
    'Croatia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CU',
    'Cuba'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CW',
    'Curacao'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CY',
    'Cyprus'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CZ',
    'Czech Republic'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CD',
    'Democratic Republic of the Congo'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'DK',
    'Denmark'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'DJ',
    'Djibouti'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'DM',
    'Dominica'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'DO',
    'Dominican Republic'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TL',
    'East Timor'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'EC',
    'Ecuador'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'EG',
    'Egypt'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SV',
    'El Salvador'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GQ',
    'Equatorial Guinea'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'ER',
    'Eritrea'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'EE',
    'Estonia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'ET',
    'Ethiopia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'FK',
    'Falkland Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'FO',
    'Faroe Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'FJ',
    'Fiji'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'FI',
    'Finland'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'FR',
    'France'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GF',
    'French Guiana'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PF',
    'French Polynesia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TF',
    'French Southern Territories'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GA',
    'Gabon'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GM',
    'Gambia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GE',
    'Georgia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'DE',
    'Germany'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GH',
    'Ghana'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GI',
    'Gibraltar'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GR',
    'Greece'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GL',
    'Greenland'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GD',
    'Grenada'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GP',
    'Guadeloupe'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GU',
    'Guam'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GT',
    'Guatemala'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GG',
    'Guernsey'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GN',
    'Guinea'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GW',
    'Guinea-Bissau'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GY',
    'Guyana'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'HT',
    'Haiti'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'HM',
    'Heard Island and McDonald Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'HN',
    'Honduras'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'HK',
    'Hong Kong'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'HU',
    'Hungary'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'IS',
    'Iceland'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'IN',
    'India'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'ID',
    'Indonesia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'IR',
    'Iran'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'IQ',
    'Iraq'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'IE',
    'Ireland'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'IM',
    'Isle of Man'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'IL',
    'Israel'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'IT',
    'Italy'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CI',
    'Ivory Coast'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'JM',
    'Jamaica'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'JP',
    'Japan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'JE',
    'Jersey'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'JO',
    'Jordan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KZ',
    'Kazakhstan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KE',
    'Kenya'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KI',
    'Kiribati'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'XK',
    'Kosovo'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KW',
    'Kuwait'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KG',
    'Kyrgyzstan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LA',
    'Laos'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LV',
    'Latvia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LB',
    'Lebanon'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LS',
    'Lesotho'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LR',
    'Liberia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LY',
    'Libya'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LI',
    'Liechtenstein'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LT',
    'Lithuania'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LU',
    'Luxembourg'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MO',
    'Macao'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MK',
    'Macedonia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MG',
    'Madagascar'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MW',
    'Malawi'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MY',
    'Malaysia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MV',
    'Maldives'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'ML',
    'Mali'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MT',
    'Malta'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MH',
    'Marshall Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MQ',
    'Martinique'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MR',
    'Mauritania'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MU',
    'Mauritius'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'YT',
    'Mayotte'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MX',
    'Mexico'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'FM',
    'Micronesia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MD',
    'Moldova'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MC',
    'Monaco'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MN',
    'Mongolia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'ME',
    'Montenegro'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MS',
    'Montserrat'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MA',
    'Morocco'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MZ',
    'Mozambique'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MM',
    'Myanmar [Burma]'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NA',
    'Namibia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NR',
    'Nauru'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NP',
    'Nepal'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NL',
    'Netherlands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NC',
    'New Caledonia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NZ',
    'New Zealand'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NI',
    'Nicaragua'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NE',
    'Niger'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NG',
    'Nigeria'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NU',
    'Niue'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NF',
    'Norfolk Island'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KP',
    'North Korea'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MP',
    'Northern Mariana Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'NO',
    'Norway'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'OM',
    'Oman'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PK',
    'Pakistan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PW',
    'Palau'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PS',
    'Palestine'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PA',
    'Panama'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PG',
    'Papua New Guinea'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PY',
    'Paraguay'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PE',
    'Peru'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PH',
    'Philippines'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PN',
    'Pitcairn Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PL',
    'Poland'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PT',
    'Portugal'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PR',
    'Puerto Rico'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'QA',
    'Qatar'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CG',
    'Republic of the Congo'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'RE',
    'Réunion'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'RO',
    'Romania'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'RU',
    'Russia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'RW',
    'Rwanda'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'BL',
    'Saint Barthélemy'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SH',
    'Saint Helena'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KN',
    'Saint Kitts and Nevis'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LC',
    'Saint Lucia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'MF',
    'Saint Martin'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'PM',
    'Saint Pierre and Miquelon'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'VC',
    'Saint Vincent and the Grenadines'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'WS',
    'Samoa'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SM',
    'San Marino'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'ST',
    'São Tomé and Príncipe'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SA',
    'Saudi Arabia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SN',
    'Senegal'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'RS',
    'Serbia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SC',
    'Seychelles'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SL',
    'Sierra Leone'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SG',
    'Singapore'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SX',
    'Sint Maarten'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SK',
    'Slovakia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SI',
    'Slovenia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SB',
    'Solomon Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SO',
    'Somalia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'ZA',
    'South Africa'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GS',
    'South Georgia and the South Sandwich Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'KR',
    'South Korea'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SS',
    'South Sudan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'ES',
    'Spain'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'LK',
    'Sri Lanka'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SD',
    'Sudan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SR',
    'Suriname'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SJ',
    'Svalbard and Jan Mayen'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SZ',
    'Swaziland'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SE',
    'Sweden'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'CH',
    'Switzerland'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'SY',
    'Syria'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TW',
    'Taiwan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TJ',
    'Tajikistan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TZ',
    'Tanzania'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TH',
    'Thailand'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TG',
    'Togo'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TK',
    'Tokelau'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TO',
    'Tonga'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TT',
    'Trinidad and Tobago'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TN',
    'Tunisia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TR',
    'Turkey'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TM',
    'Turkmenistan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TC',
    'Turks and Caicos Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'TV',
    'Tuvalu'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'UM',
    'U.S. Minor Outlying Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'VI',
    'U.S. Virgin Islands'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'UG',
    'Uganda'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'UA',
    'Ukraine'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'AE',
    'United Arab Emirates'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'GB',
    'United Kingdom'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'US',
    'United States'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'UY',
    'Uruguay'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'UZ',
    'Uzbekistan'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'VU',
    'Vanuatu'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'VA',
    'Vatican City'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'VE',
    'Venezuela'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'VN',
    'Vietnam'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'WF',
    'Wallis and Futuna'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'EH',
    'Western Sahara'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'YE',
    'Yemen'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'ZM',
    'Zambia'
);

INSERT INTO country (
    country_code,
    country_name
) VALUES (
    'ZW',
    'Zimbabwe'
);

-- INSERTING into OPERATOR
INSERT INTO operator (
    oper_id,
    oper_comp_name,
    oper_ceo
) VALUES (
    1,
    'Princess',
    'Haydn Millar'
);

INSERT INTO operator (
    oper_id,
    oper_comp_name,
    oper_ceo
) VALUES (
    2,
    'Carnival',
    'Jayden-Lee Garrison'
);

INSERT INTO operator (
    oper_id,
    oper_comp_name,
    oper_ceo
) VALUES (
    3,
    'Cunard',
    'Dua Frost'
);
 
-- INSERTING into SHIP
INSERT INTO ship (
    ship_code,
    ship_name,
    ship_date_commiss,
    ship_tonnage,
    ship_guest_capacity,
    oper_id,
    country_code
) VALUES (
    101,
    'Coral Princess',
    TO_DATE('23-May-2010', 'dd-Mon-yyyy'),
    153012,
    1860,
    1,
    'AU'
);

INSERT INTO ship (
    ship_code,
    ship_name,
    ship_date_commiss,
    ship_tonnage,
    ship_guest_capacity,
    oper_id,
    country_code
) VALUES (
    102,
    'Majestic Princess',
    TO_DATE('22-Sep-2015', 'dd-Mon-yyyy'),
    172191,
    2240,
    1,
    'AU'
);

INSERT INTO ship (
    ship_code,
    ship_name,
    ship_date_commiss,
    ship_tonnage,
    ship_guest_capacity,
    oper_id,
    country_code
) VALUES (
    103,
    'Carnival Luminosa',
    TO_DATE('17-Jun-2012', 'dd-Mon-yyyy'),
    121713,
    1240,
    2,
    'NZ'
);

INSERT INTO ship (
    ship_code,
    ship_name,
    ship_date_commiss,
    ship_tonnage,
    ship_guest_capacity,
    oper_id,
    country_code
) VALUES (
    104,
    'Carnival Splendor',
    TO_DATE('09-Jun-2011', 'dd-Mon-yyyy'),
    135762,
    1864,
    2,
    'NZ'
);

INSERT INTO ship (
    ship_code,
    ship_name,
    ship_date_commiss,
    ship_tonnage,
    ship_guest_capacity,
    oper_id,
    country_code
) VALUES (
    105,
    'Queen Mary 2',
    TO_DATE('19-Aug-2016', 'dd-Mon-yyyy'),
    201425,
    4328,
    3,
    'PA'
);

-- INSERTING into CRUISE
INSERT INTO cruise (
    cruise_id,
    cruise_name,
    cruise_description,
    ship_code,
    cruise_departure_datetime,
    cruise_duration
) VALUES (
    1,
    'Australian Circumnavigation',
    '28 Night Australian Circumnavigation Cruise. Starts from Sydney. Stops at Brisbane, Cairns, Darwin, Booome, Fremantle, Albany, Adelaide, Melbourne, Hobart. Ends at Sydney.'
    ,
    101,
    TO_DATE('02-Apr-2022 10:00', 'dd-Mon-yyyy hh24:mi'),
    28
);

INSERT INTO cruise (
    cruise_id,
    cruise_name,
    cruise_description,
    ship_code,
    cruise_departure_datetime,
    cruise_duration
) VALUES (
    2,
    'Melbourne to Sydney',
    '2 nights at sea from Melbourne to Sydney.',
    102,
    TO_DATE('16-Apr-2022 9:00', 'dd-Mon-yyyy hh24:mi'),
    2
);

INSERT INTO cruise (
    cruise_id,
    cruise_name,
    cruise_description,
    ship_code,
    cruise_departure_datetime,
    cruise_duration
) VALUES (
    3,
    'New Zealand Delight',
    'Starts from Melbourne. Cruising in Fiordland National Park. Stops at Dunedin, Lyttelton (Christchurch), Wellington, Tauranga (Rotorua), Auckland. Ends at Melbourne.'
    ,
    103,
    TO_DATE('16-Apr-2022 9:00', 'dd-Mon-yyyy hh24:mi'),
    13
);

INSERT INTO cruise (
    cruise_id,
    cruise_name,
    cruise_description,
    ship_code,
    cruise_departure_datetime,
    cruise_duration
) VALUES (
    4,
    'Queensland Islands',
    '7 Night Queensland Islands Cruise. Start from Brisbane. Stops at Airlie Beach, Port Douglas, Cairns, Willis Island. Ends at Brisbane.'
    ,
    101,
    TO_DATE('07-May-2022 14:00', 'dd-Mon-yyyy hh24:mi'),
    7
);

INSERT INTO cruise (
    cruise_id,
    cruise_name,
    cruise_description,
    ship_code,
    cruise_departure_datetime,
    cruise_duration
) VALUES (
    5,
    'Brisbane to Hobart',
    '7 nights at sea from Brisbane to Hobart.',
    102,
    TO_DATE('08-May-2022 10:30', 'dd-Mon-yyyy hh24:mi'),
    7
);

INSERT INTO cruise (
    cruise_id,
    cruise_name,
    cruise_description,
    ship_code,
    cruise_departure_datetime,
    cruise_duration
) VALUES (
    6,
    'Australian Circumnavigation',
    '28 Night Australian Circumnavigation Cruise. Starts from Sydney. Stops at Brisbane, Cairns, Darwin, Booome, Fremantle, Albany, Adelaide, Melbourne, Hobart. Ends at Sydney.'
    ,
    101,
    TO_DATE('18-Sep-2022 10:00', 'dd-Mon-yyyy hh24:mi'),
    28
);

INSERT INTO cruise (
    cruise_id,
    cruise_name,
    cruise_description,
    ship_code,
    cruise_departure_datetime,
    cruise_duration
) VALUES (
    7,
    'Melbourne to Auckland',
    'Starts from Melbourne. Cruising in Fiordland National Park. Stops at Dunedin, Lyttelton (Christchurch), and Wellington. Ends at Auckland.'
    ,
    103,
    TO_DATE('23-Oct-2022 10:00', 'dd-Mon-yyyy hh24:mi'),
    8
);

INSERT INTO cruise (
    cruise_id,
    cruise_name,
    cruise_description,
    ship_code,
    cruise_departure_datetime,
    cruise_duration
) VALUES (
    8,
    'Melbourne to Singapore',
    'Starts from Melbourne. Stops at Adelaide, Albany, Fremantle, Bali and Jakarta. Ends at Singapore.',
    105,
    TO_DATE('30-Oct-2022 9:30', 'dd-Mon-yyyy hh24:mi'),
    24
);

-- INSERTING into CABIN
INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    1001,
    4,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    1002,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    1003,
    4,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    1004,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    1011,
    2,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    1012,
    2,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    1013,
    2,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    2001,
    3,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    2002,
    3,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    2003,
    3,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    2022,
    2,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    2023,
    2,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    3001,
    4,
    'S'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    101,
    3002,
    4,
    'S'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    2001,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    2002,
    3,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    2003,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    2004,
    3,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    2011,
    4,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    2012,
    3,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    2013,
    4,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    2014,
    3,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    4002,
    2,
    'S'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    4004,
    2,
    'S'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    4006,
    2,
    'S'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    4031,
    2,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    4033,
    3,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    102,
    4034,
    3,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    103,
    110,
    2,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    103,
    111,
    2,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    103,
    112,
    2,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    103,
    113,
    2,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    103,
    114,
    2,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    103,
    210,
    4,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    103,
    211,
    4,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    103,
    213,
    4,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    104,
    141,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    104,
    142,
    4,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    104,
    143,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    104,
    144,
    4,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    104,
    145,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    104,
    146,
    4,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    104,
    211,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    104,
    212,
    4,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    104,
    213,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    104,
    214,
    4,
    'I'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    8031,
    3,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    8032,
    3,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    8033,
    3,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    8034,
    3,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    8035,
    3,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    8036,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    8037,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    8038,
    4,
    'O'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    9012,
    2,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    9013,
    2,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    9014,
    2,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    9015,
    2,
    'B'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    10101,
    6,
    'S'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    10102,
    4,
    'S'
);

INSERT INTO cabin (
    ship_code,
    cabin_no,
    cabin_capacity,
    cabin_class
) VALUES (
    105,
    10103,
    4,
    'S'
);

COMMIT;