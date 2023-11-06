-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-06 23:23:03.617

-- tables
-- Table: client
CREATE TABLE client (
    ID int  NOT NULL,
    FirstName varchar(20)  NOT NULL,
    LastName varchar(20)  NOT NULL,
    Address varchar(50)  NOT NULL,
    Phone varchar(15)  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY  (ID)
);

-- Table: product
CREATE TABLE product (
    ID int  NOT NULL,
    ISBN varchar(10)  NOT NULL,
    Title varchar(50)  NOT NULL,
    Author varchar(20)  NOT NULL,
    PagesNo int  NOT NULL,
    Publisher varchar(20)  NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY  (ID)
);

-- Table: sales
CREATE TABLE sales (
    ID int  NOT NULL,
    datetime datetime  NOT NULL,
    product_ID int  NOT NULL,
    client_ID int  NOT NULL,
    supplier_ID int  NOT NULL,
    CONSTRAINT sales_pk PRIMARY KEY  (ID)
);

-- Table: supplier
CREATE TABLE supplier (
    ID int  NOT NULL,
    NIP varchar(10)  NOT NULL,
    Address varchar(50)  NOT NULL,
    Name varchar(20)  NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: sales_client (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_client
    FOREIGN KEY (client_ID)
    REFERENCES client (ID);

-- Reference: sales_product (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_product
    FOREIGN KEY (product_ID)
    REFERENCES product (ID);

-- Reference: sales_supplier (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_supplier
    FOREIGN KEY (supplier_ID)
    REFERENCES supplier (ID);

-- sequences
-- Sequence: client_seq
CREATE SEQUENCE client_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: product_seq
CREATE SEQUENCE product_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: sales_seq
CREATE SEQUENCE sales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: supplier_seq
CREATE SEQUENCE supplier_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

