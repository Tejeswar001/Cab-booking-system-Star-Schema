USE cab_booking;

-- Insert Sample Data into DimensionCustomer
INSERT INTO DimensionCustomer (CustomerName, CustomerEmail, CustomerPhone, CustomerAddress)
VALUES 
('John Doe', 'john@example.com', '555-1234', '123 Elm St, Springfield'),
('Jane Roe', 'jane@example.com', '555-5678', '456 Oak St, Springfield');

-- Insert Sample Data into DimensionDriver
INSERT INTO DimensionDriver (DriverName, DriverPhone, DriverLicenseNumber, DriverRating)
VALUES 
('Alice Smith', '555-1111', 'D1234567', 4.9),
('Bob Johnson', '555-2222', 'D7654321', 4.7);

-- Insert Sample Data into DimensionCab
INSERT INTO DimensionCab (CabModel, CabNumber, CabType, CabCapacity)
VALUES 
('Toyota Camry', 'ABC123', 'Sedan', 4),
('Honda CR-V', 'XYZ789', 'SUV', 6);

-- Insert Sample Data into DimensionDate
INSERT INTO DimensionDate (DateID, Day, Month, Year, Quarter)
VALUES 
('2024-09-20', 20, 9, 2024, 3),
('2024-09-21', 21, 9, 2024, 3);

-- Insert Sample Data into DimensionTime
INSERT INTO DimensionTime (TimeID, Hour, Minute, Second)
VALUES 
('10:30:00', 10, 30, 0),
('12:00:00', 12, 0, 0);

-- Insert Sample Data into DimensionLocation
INSERT INTO DimensionLocation (LocationName, LocationAddress, City, State, Country)
VALUES 
('Springfield Library', '123 Library St', 'Springfield', 'IL', 'USA'),
('Downtown Station', '789 Main St', 'Springfield', 'IL', 'USA');

-- Insert Sample Data into FactReservation
INSERT INTO FactReservation (CustomerID, DriverID, CabID, DateID, TimeID, PickupLocationID, DropoffLocationID, FareAmount, DistanceTraveled, Duration)
VALUES 
(1, 1, 1, '2024-09-20', '10:30:00', 1, 2, 20.00, 10.5, '00:30:00'),
(2, 2, 2, '2024-09-21', '12:00:00', 2, 1, 25.00, 12.0, '00:40:00');
