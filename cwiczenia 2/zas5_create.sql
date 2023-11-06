-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-06 23:38:16.374

-- tables
-- Table: Employee
CREATE TABLE Employee (
    ID int  NOT NULL,
    FirstName int  NOT NULL,
    LastName int  NOT NULL,
    PESEL varchar(11)  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY  (ID)
);

-- Table: EmployeeRate
CREATE TABLE EmployeeRate (
    ID int  NOT NULL,
    Rate int  NOT NULL,
    ActiveFrom datetime  NOT NULL,
    ActiveTo datetime  NULL,
    EmployeeID int  NOT NULL,
    CONSTRAINT EmployeeRate_pk PRIMARY KEY  (ID)
);

-- Table: Salary
CREATE TABLE Salary (
    ID int  NOT NULL,
    Date date  NOT NULL,
    Amount decimal(10,2)  NOT NULL,
    EmployeeID int  NOT NULL,
    CONSTRAINT Salary_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: EmployeeRate_Employee (table: EmployeeRate)
ALTER TABLE EmployeeRate ADD CONSTRAINT EmployeeRate_Employee
    FOREIGN KEY (EmployeeID)
    REFERENCES Employee (ID);

-- Reference: Salary_Employee (table: Salary)
ALTER TABLE Salary ADD CONSTRAINT Salary_Employee
    FOREIGN KEY (EmployeeID)
    REFERENCES Employee (ID);

-- End of file.

