-- Create User table
CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    UserType ENUM('Guest', 'Host', 'Admin') NOT NULL DEFAULT 'Guest',
    Password VARCHAR(255) NOT NULL, -- Hashed password
    PhoneNumber VARCHAR(20),
    DateJoined TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ProfilePicture VARCHAR(255)
);

-- Create Property table
CREATE TABLE Property (
    PropertyID INT PRIMARY KEY AUTO_INCREMENT,
    HostID INT NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    StateProvince VARCHAR(100),
    Country VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(20),
    PricePerNight DECIMAL(10, 2) NOT NULL,
    NumberOfBedrooms INT UNSIGNED NOT NULL DEFAULT 1,
    NumberOfBathrooms DECIMAL(3, 1) UNSIGNED NOT NULL DEFAULT 1.0,
    PropertyType ENUM('Apartment', 'House') NOT NULL,
    MaxGuests INT UNSIGNED NOT NULL DEFAULT 1,
    Status ENUM('Available', 'Maintenance', 'Booked') NOT NULL DEFAULT 'Available',
    FOREIGN KEY (HostID) REFERENCES User(UserID)
);

-- Create Booking table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    PropertyID INT NOT NULL,
    GuestID INT NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    NumberOfGuests INT UNSIGNED NOT NULL DEFAULT 1,
    BookingStatus ENUM('Pending', 'Confirmed', 'Cancelled') NOT NULL DEFAULT 'Pending',
    BookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
    FOREIGN KEY (GuestID) REFERENCES User(UserID)
);

-- Create Review table
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT UNIQUE NOT NULL,
    GuestID INT NOT NULL,
    PropertyID INT NOT NULL,
    Rating TINYINT UNSIGNED NOT NULL CHECK (Rating >= 1 AND Rating <= 5),
    Comment TEXT,
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    FOREIGN KEY (GuestID) REFERENCES User(UserID),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);

-- Create Payment table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT UNIQUE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentStatus ENUM('Pending', 'Completed', 'Failed', 'Refunded') NOT NULL DEFAULT 'Pending',
    PaymentMethod VARCHAR(50) NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

-- Add indexes for performance (optional but recommended for frequently queried columns)
CREATE INDEX idx_user_email ON User (Email);
CREATE INDEX idx_property_hostid ON Property (HostID);
CREATE INDEX idx_booking_propertyid ON Booking (PropertyID);
CREATE INDEX idx_booking_guestid ON Booking (GuestID);
CREATE INDEX idx_review_propertyid ON Review (PropertyID);