-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2022-08-31 19:20:53 AEST
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c
--student id: 30864941
--student name: Andrew Lee
set echo on
SPOOL custorders_schema_output.txt


DROP TABLE customer CASCADE CONSTRAINTS;

DROP TABLE orderline CASCADE CONSTRAINTS;

DROP TABLE orders CASCADE CONSTRAINTS;

DROP TABLE prod_category CASCADE CONSTRAINTS;

DROP TABLE product CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customer (
    cust_no      NUMBER(7) NOT NULL,
    cust_name    VARCHAR2(50) NOT NULL,
    cust_address VARCHAR2(50) NOT NULL,
    cust_phone   CHAR(10),
    cust_level   CHAR(1) NOT NULL
);

ALTER TABLE customer
    ADD CONSTRAINT chk_custlevel CHECK ( cust_level IN ( 'B', 'G', 'S' ) );

COMMENT ON COLUMN customer.cust_no IS
    'Customer Number';

COMMENT ON COLUMN customer.cust_name IS
    'Customer Name';

COMMENT ON COLUMN customer.cust_address IS
    'Customer Address';

COMMENT ON COLUMN customer.cust_phone IS
    'Customer Phone';

COMMENT ON COLUMN customer.cust_level IS
    'customer level ';

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_no );

CREATE TABLE orderline (
    ol_qtyordered NUMBER(7) NOT NULL,
    ol_lineprice  NUMBER(7, 2) NOT NULL,
    order_no      NUMBER(7) NOT NULL,
    prod_no       NUMBER(7) NOT NULL
);

COMMENT ON COLUMN orderline.ol_qtyordered IS
    'order';

COMMENT ON COLUMN orderline.ol_lineprice IS
    'price';

COMMENT ON COLUMN orderline.order_no IS
    'Order Number';

ALTER TABLE orderline ADD CONSTRAINT orderline_pk PRIMARY KEY ( order_no,
                                                                prod_no );

CREATE TABLE orders (
    order_date DATE NOT NULL,
    order_no   NUMBER(7) NOT NULL,
    cust_no    NUMBER(7) NOT NULL
);

COMMENT ON COLUMN orders.order_no IS
    'Order Number';

COMMENT ON COLUMN orders.cust_no IS
    'Customer Number';

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( order_no );

CREATE TABLE prod_category (
    pcat_name VARCHAR2(50) NOT NULL,
    pcat_id   NUMBER(7) NOT NULL
);

COMMENT ON COLUMN prod_category.pcat_name IS
    'Product category Name';

COMMENT ON COLUMN prod_category.pcat_id IS
    'Product category ID';

ALTER TABLE prod_category ADD CONSTRAINT prod_category_pk PRIMARY KEY ( pcat_id );

CREATE TABLE product (
    prod_no          NUMBER(7) NOT NULL,
    prod_desc        VARCHAR2(50) NOT NULL,
    produc_unitprice NUMBER(7) NOT NULL,
    pcat_id          NUMBER(7) NOT NULL
);

COMMENT ON COLUMN product.prod_desc IS
    'Product Description';

COMMENT ON COLUMN product.produc_unitprice IS
    'Product unit price';

COMMENT ON COLUMN product.pcat_id IS
    'Product category ID';

ALTER TABLE product ADD CONSTRAINT orderline_pkv1 PRIMARY KEY ( prod_no );

ALTER TABLE orders
    ADD CONSTRAINT customer_orders FOREIGN KEY ( cust_no )
        REFERENCES customer ( cust_no );

ALTER TABLE orderline
    ADD CONSTRAINT relation2 FOREIGN KEY ( order_no )
        REFERENCES orders ( order_no );

ALTER TABLE orderline
    ADD CONSTRAINT relation3 FOREIGN KEY ( prod_no )
        REFERENCES product ( prod_no );

ALTER TABLE product
    ADD CONSTRAINT relation4 FOREIGN KEY ( pcat_id )
        REFERENCES prod_category ( pcat_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
SPOOL off
set echo off