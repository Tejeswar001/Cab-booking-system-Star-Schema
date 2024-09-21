-- Database
CREATE DATABASE cab_booking;
USE cab_booking;

-- DimensionCustomer
CREATE TABLE DimensionCustomer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerEmail VARCHAR(255),
    CustomerPhone VARCHAR(50),
    CustomerAddress TEXT
);

-- DimensionDriver
CREATE TABLE DimensionDriver (
    DriverID INT AUTO_INCREMENT PRIMARY KEY,
    DriverName VARCHAR(255),
    DriverPhone VARCHAR(50),
    DriverLicenseNumber VARCHAR(50),
    DriverRating FLOAT
);

-- DimensionCab
CREATE TABLE DimensionCab (
    CabID INT AUTO_INCREMENT PRIMARY KEY,
    CabModel VARCHAR(255),
    CabNumber VARCHAR(50),
    CabType VARCHAR(50),
    CabCapacity INT
);

-- DimensionDate
CREATE TABLE DimensionDate (
    DateID DATE PRIMARY KEY,
    Day INT,
    Month INT,
    Year INT,
    Quarter INT
);

-- DimensionTime
CREATE TABLE DimensionTime (
    TimeID TIME PRIMARY KEY,
    Hour INT,
    Minute INT,
    Second INT
);

-- DimensionLocation
CREATE TABLE DimensionLocation (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    LocationName VARCHAR(255),
    LocationAddress TEXT,
    City VARCHAR(255),
    State VARCHAR(255),
    Country VARCHAR(255)
);

-- FactReservation
CREATE TABLE FactReservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    DriverID INT,
    CabID INT,
    DateID DATE,
    TimeID TIME,
    PickupLocationID INT,
    DropoffLocationID INT,
    FareAmount DECIMAL(10, 2),
    DistanceTraveled DECIMAL(10, 2),
    Duration TIME,
    FOREIGN KEY (CustomerID) REFERENCES DimensionCustomer(CustomerID),
    FOREIGN KEY (DriverID) REFERENCES DimensionDriver(DriverID),
    FOREIGN KEY (CabID) REFERENCES DimensionCab(CabID),
    FOREIGN KEY (DateID) REFERENCES DimensionDate(DateID),
    FOREIGN KEY (TimeID) REFERENCES DimensionTime(TimeID),
    FOREIGN KEY (PickupLocationID) REFERENCES DimensionLocation(LocationID),
    FOREIGN KEY (DropoffLocationID) REFERENCES DimensionLocation(LocationID)
);
