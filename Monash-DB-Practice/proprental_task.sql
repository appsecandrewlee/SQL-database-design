--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SET ECHO ON
--SPOOL proprental_task_output3.txt

--****PLEASE ENTER YOUR DETAILS BELOW****
--proprental_task.sql

--Student ID: 30864941
--Student Name: Andrew Lee
--Unit Code: 2094 
--Applied Class No: 07


-- Task 1
-- Create table MAINTENANCE
CREATE TABLE MAINTENANCE (

maint_id        NUMBER (7) NOT NULL,
maint_datetime  DATE       NOT NULL,
maint_desc      VARCHAR2(50) NOT NULL,
maint_cost      NUMBER (8, 2) NOT NULL,
maint_assigned  CHAR(1)

); 

COMMENT ON COLUMN MAINTENANCE.maint_id IS
    'The maintenance ID';
COMMENT ON COLUMN MAINTENANCE.maint_datetime IS
    'Maintenance date time';
COMMENT ON COLUMN MAINTENANCE.maint_desc IS
    'Maintenance description';
COMMENT ON COLUMN MAINTENANCE.maint_cost IS
    'Maintenance cost';
COMMENT ON COLUMN MAINTENANCE.maint_assigned IS
    'Maintenance assigned';
    
-- Task 2
-- CREATE two sequences
DROP SEQUENCE ownersequence;

CREATE SEQUENCE ownersequence start with 1
increment by 1;


DROP SEQUENCE propertysequence;

CREATE SEQUENCE propertysequence start with 1
increment by 1;


-- Task 3
-- Insert the data
INSERT INTO OWNER(owner_no,owner_givname,owner_famname,owner_address)
VALUES(1234,'Andrew','Lee','MonashLibrary');

INSERT INTO PROPERTY
VALUES(999,'NorthMelbourne222Street7',10.05,(SELECT owner_no from OWNER where owner_givname = 'Andrew' and owner_famname ='Lee'));

INSERT INTO MAINTENANCE(maint_id,maint_datetime,maint_desc,maint_cost)
VALUES(ownersequence.nextval,to_date('01-Jan-2003','dd-Mon-yyyy')
,'GoodMaintenance',300);

--SPOOL OFF
--SET ECHO OFF