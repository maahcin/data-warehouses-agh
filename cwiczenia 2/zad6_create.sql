-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-06 23:45:39.336

-- tables
-- Table: Inventory
CREATE TABLE Inventory (
    ID int  NOT NULL,
    WarehouseID int  NOT NULL,
    ProductID int  NOT NULL,
    CONSTRAINT Inventory_pk PRIMARY KEY  (ID)
);

-- Table: Product
CREATE TABLE Product (
    ID int  NOT NULL,
    Name varchar(20)  NOT NULL,
    Brand varchar(20)  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (ID)
);

-- Table: ProductHistory
CREATE TABLE ProductHistory (
    ID int  NOT NULL,
    Amount int  NOT NULL,
    ValidFrom datetime  NOT NULL,
    ValidTo datetime  NULL,
    ProductID int  NOT NULL,
    CONSTRAINT ProductHistory_pk PRIMARY KEY  (ID)
);

-- Table: Warehouse
CREATE TABLE Warehouse (
    ID int  NOT NULL,
    Address varchar(50)  NOT NULL,
    Country varchar(20)  NOT NULL,
    CONSTRAINT Warehouse_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: Inventory_Product (table: Inventory)
ALTER TABLE Inventory ADD CONSTRAINT Inventory_Product
    FOREIGN KEY (ProductID)
    REFERENCES Product (ID);

-- Reference: Inventory_Warehouse (table: Inventory)
ALTER TABLE Inventory ADD CONSTRAINT Inventory_Warehouse
    FOREIGN KEY (WarehouseID)
    REFERENCES Warehouse (ID);

-- Reference: ProductHistory_Product (table: ProductHistory)
ALTER TABLE ProductHistory ADD CONSTRAINT ProductHistory_Product
    FOREIGN KEY (ProductID)
    REFERENCES Product (ID);

-- End of file.

