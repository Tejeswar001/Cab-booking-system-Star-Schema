# Online Cab Reservation System

This project models an **Online Cab Reservation System** using a **Star Schema** for Dimensional Modeling. The database design focuses on analyzing reservations, driver performance, customer data, and more. The system is implemented in **MySQL**.

## Table of Contents
- [ER Diagram](#er-diagram)
- [Star Schema](#star-schema)
- [Database Tables](#database-tables)
- [Sample Queries](#sample-queries)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

---

## ER Diagram
The ER Diagram represents the entities involved in the cab reservation system and their relationships.

![Screenshot from 2024-09-21 12-14-42](https://github.com/user-attachments/assets/d4661720-3b13-474b-9631-c29111de97fe)

---

## Star Schema

The **Star Schema** comprises a central fact table surrounded by dimension tables, ideal for reporting and analytics.

- **Fact Table**:
  - `FactReservation`: Contains transactional data related to cab reservations, such as fare, distance, and duration.

- **Dimension Tables**:
  - `DimensionCustomer`: Information about customers.
  - `DimensionDriver`: Driver details.
  - `DimensionCab`: Cab-related data.
  - `DimensionLocation`: Data about pickup and drop-off locations.
  - `DimensionDate`: Date information.
  - `DimensionTime`: Time-related data for reservations.

---

## Database Tables

### Dimension Tables
1. **DimensionCustomer**
   - `CustomerID`: Primary key.
   - `CustomerName`, `CustomerEmail`, `CustomerPhone`, `CustomerAddress`: Information about customers.

2. **DimensionDriver**
   - `DriverID`: Primary key.
   - `DriverName`, `DriverPhone`, `DriverLicenseNumber`, `DriverRating`: Driver information.

3. **DimensionCab**
   - `CabID`: Primary key.
   - `CabModel`, `CabNumber`, `CabType`, `CabCapacity`: Cab data.

4. **DimensionLocation**
   - `LocationID`: Primary key.
   - `LocationName`, `LocationAddress`, `City`, `State`, `Country`: Location details.

5. **DimensionDate**
   - `DateID`: Primary key.
   - `Day`, `Month`, `Year`, `Quarter`: Date-related attributes.

6. **DimensionTime**
   - `TimeID`: Primary key.
   - `Hour`, `Minute`, `Second`: Time of reservation.

### Fact Table
1. **FactReservation**
   - `ReservationID`: Primary key.
   - `CustomerID`, `DriverID`, `CabID`, `DateID`, `TimeID`, `PickupLocationID`, `DropoffLocationID`: Foreign keys.
   - `FareAmount`, `DistanceTraveled`, `Duration`: Transactional data of each reservation.

---

## Sample Queries

Below are some complex SQL queries to extract insights from the system:

### 1. **Total Revenue Generated by Each Driver**
```sql
SELECT 
    d.DriverName, 
    SUM(f.FareAmount) AS TotalRevenue
FROM 
    FactReservation f
JOIN 
    DimensionDriver d ON f.DriverID = d.DriverID
GROUP BY 
    d.DriverName
ORDER BY 
    TotalRevenue DESC;
```

### 2. **Number of Reservations per Month**
```sql
SELECT 
    d.Month, 
    COUNT(f.ReservationID) AS TotalReservations
FROM 
    FactReservation f
JOIN 
    DimensionDate d ON f.DateID = d.DateID
GROUP BY 
    d.Month
ORDER BY 
    d.Month;
```

### 3. **Average Trip Duration and Fare by Cab Type**
```sql
SELECT 
    c.CabType, 
    AVG(f.Duration) AS AverageTripDuration, 
    AVG(f.FareAmount) AS AverageFare
FROM 
    FactReservation f
JOIN 
    DimensionCab c ON f.CabID = c.CabID
GROUP BY 
    c.CabType
ORDER BY 
    AverageTripDuration;
```

### 4. **Most Popular Pickup and Dropoff Locations**
```sql
SELECT 
    l1.LocationName AS PickupLocation, 
    l2.LocationName AS DropoffLocation, 
    COUNT(f.ReservationID) AS NumberOfTrips
FROM 
    FactReservation f
JOIN 
    DimensionLocation l1 ON f.PickupLocationID = l1.LocationID
JOIN 
    DimensionLocation l2 ON f.DropoffLocationID = l2.LocationID
GROUP BY 
    l1.LocationName, l2.LocationName
ORDER BY 
    NumberOfTrips DESC;
```

---

## Installation

### Prerequisites
- **MySQL** or **Oracle** database installed on your system.

### Steps
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/online-cab-reservation-system.git
   ```
2. Import the SQL file provided to create the database schema:
   - Open MySQL Workbench (or any database tool) and import the script to create the tables and insert sample data.

3. Connect your MySQL Workbench or Oracle client to the database.

---

## Usage

1. Run the provided SQL queries in **MySQL Workbench** or **Oracle SQL Developer** to generate insights and reports.
2. Modify the schema or queries based on your specific use cases or data requirements.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
```

### Key Notes:
- Replace `link_to_your_er_diagram_image` with the correct path to the ER diagram image.
- Change `your-username` in the repository URL to your GitHub username.

This `README.md` gives an overview of the project, including schema design, installation, queries, and usage instructions.
