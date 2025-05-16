# Database Normalization 3NF

## Original Schema

The initial database schema consists of five main entities:

1. **User**
2. **Property**
3. **Booking**
4. **Review**
5. **Payment**

## Normalization Process

### First Normal Form (1NF)

First Normal Form requires that:

- Each table has a primary key
- Each column contains atomic values
- No repeating groups

**Analysis:**

- All tables already have primary keys (UserID, PropertyID, BookingID, ReviewID, PaymentID)
- All columns appear to store atomic values
- No repeating groups identified

**Entities and Attributes:**

- **User**
  - UserID (PK)
  - FirstName
  - LastName
  - Email
  - UserType
  - Password
  - PhoneNumber
  - DateJoined
  - ProfilePicture
- **Property**
  - PropertyID (PK)
  - HostID (FK)
  - Title
  - Description
  - Address
  - City
  - State/Province
  - Country
  - PostalCode
  - PricePerNight
  - NumberOfBedrooms
  - NumberOfBathrooms
  - PropertyType
  - MaxGuests
  - Status
- **Booking**
  - BookingID (PK)
  - PropertyID (FK)
  - GuestID (FK)
  - CheckInDate
  - CheckOutDate
  - TotalPrice
  - NumberOfGuests
  - BookingStatus
  - BookingDate
- **Review**
  - ReviewID (PK)
  - BookingID (FK)
  - GuestID (FK)
  - PropertyID (FK)
  - Rating
  - Comment
  - ReviewDate
- **Payment**
  - PaymentID (PK)
  - BookingID (FK)
  - Amount
  - PaymentDate
  - PaymentStatus
  - PaymentMethod

**Relationships:**

1. **User - Property (Hosts)**
    - Relationship: One-to-Many
    - Description: One User (as a Host) can own many Properties.
    - Cardinality: 1:N (One User to Many Properties)
    - How to represent: Draw a line from User to Property. At the User end, show "1" (or nothing, implying one), and at the Property end, show "N" (or a crow's foot symbol). HostID in Property acts as the foreign key.

2. **User - Booking (Books)**
    - Relationship: One-to-Many
    - Description: One User (as a Guest) can make many Bookings.
    - Cardinality: 1:N (One User to Many Bookings)
    - How to represent: Draw a line from User to Booking. At the User end, show "1", and at the Booking end, show "N". GuestID in Booking acts as the foreign key.

3. **Property - Booking (Reserved For)**
    - Relationship: One-to-Many
    - Description: One Property can have many Bookings.
    - Cardinality: 1:N (One Property to Many Bookings)
    - How to represent: Draw a line from Property to Booking. At the Property end, show "1", and at the Booking end, show "N". PropertyID in Booking acts as the foreign key.

4. **Booking - Review (Generates)**
    - Relationship: One-to-One
    - Description: One Booking can have one Review.
    - Cardinality: 1:1 (One Booking to One Review)
    - How to represent: Draw a line from Booking to Review. At both ends, show "1". BookingID in Review acts as the foreign key.

5. **Booking - Payment (Paid Through)**
    - Relationship: One-to-One
    - Description: One Booking has one Payment.
    - Cardinality: 1:1 (One Booking to One Payment)
    - How to represent: Draw a line from Booking to Payment. At both ends, show "1". BookingID in Payment acts as the foreign key.
