##Identify High-Usage Columns
Users Table:
- UserID: Primary key, frequently used in JOIN clauses with the Bookings table.
Bookings Table:
- BookingID: Primary key.
- UserID: Foreign key, used in JOIN clauses with the Users table and in WHERE clauses to filter bookings by user.
- PropertyID: Foreign key, used in JOIN clauses with the Properties table and in WHERE clauses to filter bookings by property.
- BookingDate: Used in WHERE clauses to filter bookings by date and potentially in ORDER BY clauses.
Properties Table:
- PropertyID: Primary key, used in JOIN clauses with the Bookings and Reviews tables.


EXPLAIN
SELECT
    u.UserID,
    u.Username,
    COUNT(b.BookingID) AS TotalBookings
FROM
    Users u
JOIN
    Bookings b ON u.UserID = b.UserID
GROUP BY
    u.UserID,
    u.Username
ORDER BY
    TotalBookings DESC;