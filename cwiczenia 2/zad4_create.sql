-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-06 23:26:24.003

-- tables
-- Table: client
CREATE TABLE client (
    ID int  NOT NULL,
    Name varchar(20)  NOT NULL,
    NIP varchar(10)  NOT NULL,
    Address varchar(50)  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY  (ID)
);

-- Table: date
CREATE TABLE date (
    ID int  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    hour int  NOT NULL,
    CONSTRAINT date_pk PRIMARY KEY  (ID)
);

-- Table: fruit
CREATE TABLE fruit (
    ID int  NOT NULL,
    Name varchar(20)  NOT NULL,
    PricePerKG decimal(10,2)  NOT NULL,
    fruit_category_ID int  NOT NULL,
    CONSTRAINT fruit_pk PRIMARY KEY  (ID)
);

-- Table: fruit_category
CREATE TABLE fruit_category (
    ID int  NOT NULL,
    Name int  NOT NULL,
    CONSTRAINT fruit_category_pk PRIMARY KEY  (ID)
);

-- Table: location
CREATE TABLE location (
    ID int  NOT NULL,
    Address varchar(50)  NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY  (ID)
);

-- Table: sales
CREATE TABLE sales (
    ID int  NOT NULL,
    Quantity int  NOT NULL,
    Price int  NOT NULL,
    client_ID int  NOT NULL,
    fruit_ID int  NOT NULL,
    date_ID int  NOT NULL,
    location_ID int  NOT NULL,
    CONSTRAINT sales_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: fruit_fruit_category (table: fruit)
ALTER TABLE fruit ADD CONSTRAINT fruit_fruit_category
    FOREIGN KEY (fruit_category_ID)
    REFERENCES fruit_category (ID);

-- Reference: sales_client (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_client
    FOREIGN KEY (client_ID)
    REFERENCES client (ID);

-- Reference: sales_date (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_date
    FOREIGN KEY (date_ID)
    REFERENCES date (ID);

-- Reference: sales_fruit (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_fruit
    FOREIGN KEY (fruit_ID)
    REFERENCES fruit (ID);

-- Reference: sales_location (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_location
    FOREIGN KEY (location_ID)
    REFERENCES location (ID);

-- sequences
-- Sequence: client_seq
CREATE SEQUENCE client_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: date_seq
CREATE SEQUENCE date_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: fruit_category_seq
CREATE SEQUENCE fruit_category_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: fruit_seq
CREATE SEQUENCE fruit_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: location_seq
CREATE SEQUENCE location_seq
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

-- End of file.

