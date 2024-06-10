CREATE DATABASE IF NOT EXISTS Practice;


USE Practice;

CREATE TABLE `Client` (
    ClientId CHAR(36) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE NULL,
    Address VARCHAR(256) NULL,
    City VARCHAR(100) NULL,
    StateAbbr CHAR(2) NULL,
    PostalCode VARCHAR(10) NULL,
    FOREIGN KEY fk_Client_StateAbbr (StateAbbr)
        REFERENCES State(StateAbbr)
);