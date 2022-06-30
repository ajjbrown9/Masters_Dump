/*
The Goal of CTA_2 is the creation of the customer_DIM table within a newly created Northwind_DW database.
*/
--========================================================
-- PostgreSQL database dump
--========================================================
-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SET check_function_bodies = false;
-- SET client_min_messages = warning;

-- SET default_tablespace = '';

-- SET default_with_oids = false;

--========================================================
-- PostgreSQL Database Creation
--========================================================
-- CREATE DATABASE "Northwind_DW"
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     CONNECTION LIMIT = -1;

--========================================================
-- DIM Schema Creation
--========================================================
-- CREATE SCHEMA "DIM"
--     AUTHORIZATION postgres;

--======================================================
--STAGE_ALL_DIMENSIONS TEMPLATE
--======================================================
/*
CREATE TABLE [].[] (
    --IDs
    customer_id bpchar NOT NULL,
    order_id smallint NOT NULL,
    category_id smallint NOT NULL,
    employee_id smallint NOT NULL,
    territory_id character varying(20) NOT NULL,
    product_id smallint NOT NULL,
    supplier_id smallint,
    region_id smallint NOT NULL,
    shipper_id smallint NOT NULL,
    territory_id character varying(20) NOT NULL,
    state_id smallint NOT NULL,
    --categories
    cat_category_name character varying(15) NOT NULL,
    cat_description text,
    cat_picture bytea,
    --customers
    cust_company_name character varying(40) NOT NULL,
    cust_contact_name character varying(30),
    cust_contact_title character varying(30),
    cust_address character varying(60),
    cust_city character varying(15),
    cust_region character varying(15),
    cust_postal_code character varying(10),
    cust_country character varying(15),
    cust_phone character varying(24),
    cust_fax character varying(24),
    --employees
    emp_last_name character varying(20) NOT NULL,
    emp_first_name character varying(10) NOT NULL,
    emp_title character varying(30),
    emp_title_of_courtesy character varying(25),
    emp_birth_date date,
    emp_hire_date date,
    emp_address character varying(60),
    emp_city character varying(15),
    emp_region character varying(15),
    emp_postal_code character varying(10),
    emp_country character varying(15),
    emp_home_phone character varying(24),
    emp_extension character varying(4),
    emp_photo bytea,
    emp_notes text,
    emp_reports_to smallint,
    emp_photo_path character varying(255),
    --emp_territory
    --order details
    detail_unit_price real NOT NULL,
    detail_quantity smallint NOT NULL,
    detail_discount real NOT NULL,
    --orders
    order_order_date date,
    order_required_date date,
    order_shipped_date date,
    order_ship_via smallint,
    order_freight real,
    order_ship_name character varying(40),
    order_ship_address character varying(60),
    order_ship_city character varying(15),
    order_ship_region character varying(15),
    order_ship_postal_code character varying(10),
    order_ship_country character varying(15),
    --product
    prod_product_name character varying(40) NOT NULL,
    prod_quantity_per_unit character varying(20),
    prod_unit_price real,
    prod_units_in_stock smallint,
    prod_units_on_order smallint,
    prod_reorder_level smallint,
    prod_discontinued integer NOT NULL,
    --region
    region_description bpchar NOT NULL
    --shippers
    ship_company_name character varying(40) NOT NULL,
    ship_phone character varying(24),
    --suppliers
    supp_company_name character varying(40) NOT NULL,
    supp_contact_name character varying(30),
    supp_contact_title character varying(30),
    supp_address character varying(60),
    supp_city character varying(15),
    supp_region character varying(15),
    supp_postal_code character varying(10),
    supp_country character varying(15),
    supp_phone character varying(24),
    supp_fax character varying(24),
    supp_homepage text,
    --territories
    terr_territory_description bpchar NOT NULL,
    --us_states
    state_state_name character varying(100),
    state_state_abbr character varying(2),
    state_state_region character varying(50)
);
ALTER TABLE ONLY [].[]
    ADD CONSTRAINT pk_orders PRIMARY KEY ();
*/

--======================================================
--DROP TABLES
--======================================================

DROP TABLE IF EXISTS "DIM".NW_Customer_DIM1;
DROP TABLE IF EXISTS "DIM".NW_Customer_DIM2;

--======================================================
--CREATE TABLE: NW_Customer_DIM2
--SCHEMA: DIM
--DESCRIPTION: Dimension Table Created With Customer, Order, Order Detail, Employee, and Product Table Information
--======================================================

CREATE TABLE "DIM".NW_Customer_DIM2 (
    order_dist_id int NOT NULL,
    customer_id bpchar NOT NULL,
    order_id smallint NOT NULL,
    employee_id smallint NOT NULL,
    product_id smallint NOT NULL,
    cust_company_name character varying(40) NOT NULL,
    cust_contact_name character varying(30),
    cust_contact_title character varying(30),
    cust_address character varying(60),
    cust_city character varying(15),
    cust_region character varying(15),
    cust_postal_code character varying(10),
    cust_country character varying(15),
    cust_phone character varying(24),
    cust_fax character varying(24),
    order_order_date date,
    order_required_date date,
    order_shipped_date date,
    order_ship_via smallint,
    order_freight real,
    order_ship_name character varying(40),
    order_ship_address character varying(60),
    order_ship_city character varying(15),
    order_ship_region character varying(15),
    order_ship_postal_code character varying(10),
    order_ship_country character varying(15),
    detail_unit_price real NOT NULL,
    detail_quantity smallint NOT NULL,
    detail_discount real NOT NULL,
    prod_product_name character varying(40) NOT NULL,
    prod_quantity_per_unit character varying(20),
    prod_unit_price real,
    prod_units_in_stock smallint,
    prod_units_on_order smallint,
    prod_reorder_level smallint,
    prod_discontinued integer NOT NULL,
    emp_last_name character varying(20) NOT NULL,
    emp_first_name character varying(10) NOT NULL,
    emp_title character varying(30),
    emp_title_of_courtesy character varying(25),
    emp_birth_date date,
    emp_hire_date date,
    emp_address character varying(60),
    emp_city character varying(15),
    emp_region character varying(15),
    emp_postal_code character varying(10),
    emp_country character varying(15),
    emp_home_phone character varying(24),
    emp_extension character varying(4),
    emp_photo bytea,
    emp_notes text,
    emp_reports_to smallint,
    emp_photo_path character varying(255)
)
;

ALTER TABLE ONLY "DIM".NW_Customer_DIM2
    ADD CONSTRAINT pk_dist_ids PRIMARY KEY (order_dist_id)
;

ALTER TABLE ONLY "DIM".NW_Customer_DIM2
    ADD CONSTRAINT fk_customer_ids FOREIGN KEY (customer_id) REFERENCES "RAW".customers
;

ALTER TABLE ONLY "DIM".NW_Customer_DIM2
    ADD CONSTRAINT fk_order_ids FOREIGN KEY (order_id) REFERENCES "RAW".orders
;

ALTER TABLE ONLY "DIM".NW_Customer_DIM2
    ADD CONSTRAINT fk_product_ids FOREIGN KEY (product_id) REFERENCES "RAW".products
;

ALTER TABLE ONLY "DIM".NW_Customer_DIM2
    ADD CONSTRAINT fk_employee_ids FOREIGN KEY (employee_id) REFERENCES "RAW".employees
;


--======================================================
--CREATE TABLE: NW_Customer_DIM1
--SCHEMA: DIM
--DESCRIPTION: Dimension Table Created With Customer Data
--======================================================

CREATE TABLE "DIM".NW_Customer_DIM1 (
    customer_id bpchar NOT NULL,
    cust_company_name character varying(40) NOT NULL,
    cust_contact_name character varying(30),
    cust_contact_title character varying(30),
    cust_address character varying(60),
    cust_city character varying(15),
    cust_region character varying(15),
    cust_postal_code character varying(10),
    cust_country character varying(15),
    cust_phone character varying(24),
    cust_fax character varying(24)
)
;


ALTER TABLE ONLY "DIM".NW_Customer_DIM1
    ADD CONSTRAINT pk_customer_ids PRIMARY KEY (customer_id)
;