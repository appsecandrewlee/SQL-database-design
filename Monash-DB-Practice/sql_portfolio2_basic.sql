--Comment out SET ECHO and SPOOL commands before submitting your portfolio
SET ECHO ON
SPOOL sql_portfolio2_basic_output.txt

--****PLEASE ENTER YOUR DETAILS BELOW****
--sql_portfolio2_basic.sql

--Student ID: 30864941
--Student Name: Andrew Lee
--Unit Code: 2094
--Applied Class No: 07


/*1*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

        --property.no         --rent
SELECT rent.property.prop_no,rent.rent_lease_start,rent.tenant_no,rent.rent_lease_period FROM
rent.property
join rent.rent ON rent.property.prop_no = rent.rent.prop_no

WHERE
rent.rent_lease_start >= to_date('dd/mon/yy','01/JAN/20') AND rent.rent_lease_start < to_date('dd/mon/yy','01/JUN/20')

ORDER BY 
rent.prop_no,
rent.rent_lease_start;

/*2*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT rent.damage.dam_datetime,rent.property.prop_no,rent.property.prop_address,rent.tenant.tenant_givname,rent.tenant.tenant_famname,rent.damage.dam_type,rent.damage.dam_cost,rent.damage.pay_no

FROM rent.damage 
join rent.rent ON rent.damage.rent_agreement_no = rent.rent_agreement_no
join rent.property ON rent.rent.prop_no = rent.property.prop_no
join rent.tenant ON rent.rent.tenant_no = rent.tenant.tenant_no

ORDER BY
rent.damage.dam_datetime DESC,
rent.prop_no;

SELECT rent.damage.pay_no,
CASE WHEN rent.damage.pay_no is NULL THEN 'No Payment Made' END AS damagelabel FROM rent.damage
join rent.rent ON rent.damage.rent_agreement_no = rent.rent_agreement_no
join rent.payment ON rent.rent.rent_agreement_no = rent.payment.rent_agreement_no;












--Comment out SET ECHO and SPOOL commands before submitting your portfolio
SPOOL OFF
SET ECHO OFF






