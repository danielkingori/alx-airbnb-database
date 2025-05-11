# Airbnb-like System Database Schema

This repository contains the SQL scripts to define the database schema for an Airbnb-like system. The schema is designed based on the following core entities and their relationships:

-   **User:** Represents users of the system (both guests and hosts).
-   **Property:** Represents the listings available for booking.
-   **Booking:** Represents a reservation made by a guest for a property.
-   **Review:** Represents feedback given by a guest for a booking and property.
-   **Payment:** Represents payment information related to a booking.

The database schema is designed to be in the Third Normal Form (3NF) to minimize data redundancy and ensure data integrity.

## Table Definitions

The following SQL `CREATE TABLE` statements are included in this repository:

1.  **`User.sql`**: Defines the `User` table with the following columns:
    -   `UserID` (INT, PRIMARY KEY, AUTO_INCREMENT)
    -   `FirstName` (VARCHAR(50), NOT NULL)
    -   `LastName` (VARCHAR(50), NOT NULL)
    -   `Email` (VARCHAR(100), UNIQUE, NOT NULL)
    -   `UserType` (ENUM('Guest', 'Host', 'Admin'), NOT NULL, DEFAULT 'Guest')
    -   `Password` (VARCHAR(255), NOT NULL) - Hashed password
    -   `PhoneNumber` (VARCHAR(20))
    -   `DateJoined` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
    -   `ProfilePicture` (VARCHAR(255))

2.  **`Property.sql`**: Defines the `Property` table with the following columns:
    -   `PropertyID` (INT, PRIMARY KEY, AUTO_INCREMENT)
    -   `HostID` (INT, NOT NULL, FOREIGN KEY referencing `User(UserID)`)
    -   `Title` (VARCHAR(255), NOT NULL)
    -   `Description` (TEXT)
    -   `Address` (VARCHAR(255), NOT NULL)
    -   `City` (VARCHAR(100), NOT NULL)
    -   `StateProvince` (VARCHAR(100))
    -   `Country` (VARCHAR(100), NOT NULL)
    -   `PostalCode` (VARCHAR(20))
    -   `PricePerNight` (DECIMAL(10, 2), NOT NULL)
    -   `NumberOfBedrooms` (INT UNSIGNED, NOT NULL, DEFAULT 1)
    -   `NumberOfBathrooms` (DECIMAL(3, 1) UNSIGNED, NOT NULL, DEFAULT 1.0)
    -   `PropertyType` (ENUM('Apartment', 'House'), NOT NULL)
    -   `MaxGuests` (INT UNSIGNED, NOT NULL, DEFAULT 1)
    -   `Status` (ENUM('Available', 'Maintenance', 'Booked'), NOT NULL, DEFAULT 'Available')

3.  **`Booking.sql`**: Defines the `Booking` table with the following columns:
    -   `BookingID` (INT, PRIMARY KEY, AUTO_INCREMENT)
    -   `PropertyID` (INT, NOT NULL, FOREIGN KEY referencing `Property(PropertyID)`)
    -   `GuestID` (INT, NOT NULL, FOREIGN KEY referencing `User(UserID)`)
    -   `CheckInDate` (DATE, NOT NULL)
    -   `CheckOutDate` (DATE, NOT NULL)
    -   `TotalPrice` (DECIMAL(10, 2), NOT NULL)
    -   `NumberOfGuests` (INT UNSIGNED, NOT NULL, DEFAULT 1)
    -   `BookingStatus` (ENUM('Pending', 'Confirmed', 'Cancelled'), NOT NULL, DEFAULT 'Pending')
    -   `BookingDate` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

4.  **`Review.sql`**: Defines the `Review` table with the following columns:
    -   `ReviewID` (INT, PRIMARY KEY, AUTO_INCREMENT)
    -   `BookingID` (INT, UNIQUE, NOT NULL, FOREIGN KEY referencing `Booking(BookingID)`)
    -   `GuestID` (INT, NOT NULL, FOREIGN KEY referencing `User(UserID)`)
    -   `PropertyID` (INT, NOT NULL, FOREIGN KEY referencing `Property(PropertyID)`)
    -   `Rating` (TINYINT UNSIGNED, NOT NULL, CHECK (Rating >= 1 AND Rating <= 5))
    -   `Comment` (TEXT)
    -   `ReviewDate` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

5.  **`Payment.sql`**: Defines the `Payment` table with the following columns:
    -   `PaymentID` (INT, PRIMARY KEY, AUTO_INCREMENT)
    -   `BookingID` (INT, UNIQUE, NOT NULL, FOREIGN KEY referencing `Booking(BookingID)`)
    -   `Amount` (DECIMAL(10, 2), NOT NULL)
    -   `PaymentDate` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
    -   `PaymentStatus` (ENUM('Pending', 'Completed', 'Failed', 'Refunded'), NOT NULL, DEFAULT 'Pending')
    -   `PaymentMethod` (VARCHAR(50), NOT NULL)

6.  **`indexes.sql`**: Contains `CREATE INDEX` statements to improve query performance on frequently accessed columns (e.g., foreign keys, email).

## How to Use

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/danielkingori/alx-airbnb-database/
    cd alx-airbnb-database
    ```

2.  **Database Setup:**
    -   Ensure you have a compatible database system installed (e.g., MySQL, PostgreSQL).
    -   Create a new database for the Airbnb-like system.

3.  **Execute the SQL Scripts:**
    -   You can execute the SQL scripts in the order of table dependencies to avoid errors with foreign key constraints:
        1.  `User.sql`
        2.  `Property.sql`
        3.  `Booking.sql`
        4.  `Review.sql`
        5.  `Payment.sql`
        6.  `indexes.sql` (optional, but recommended)

## Relationships

The database schema defines the following relationships between the entities:

-   **One-to-Many:**
    -   A `User` (as a Host) can have multiple `Property` listings (`Property.HostID` references `User.UserID`).
    -   A `User` (as a Guest) can make multiple `Booking` records (`Booking.GuestID` references `User.UserID`).
    -   A `Property` can have multiple `Booking` records (`Booking.PropertyID` references `Property.PropertyID`).

-   **One-to-One:**
    -   Each `Booking` can have one `Review` (`Review.BookingID` references `Booking.BookingID` and has a `UNIQUE` constraint).
    -   Each `Booking` has one `Payment` record (`Payment.BookingID` references `Booking.BookingID` and has a `UNIQUE` constraint).

## Contributing

If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

ALX Software Engineering Learning