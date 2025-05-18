## Initial Query
SELECT b.BookingID, b.BookingDate, u.UserID, u.Username, u.Email, p.PropertyID, p.PropertyName, p.Location, pm.PaymentID, pm.PaymentDate, pm.Amount, pm.PaymentMethod
FROM
    Bookings b
    INNER JOIN Users u ON b.UserID = u.UserID
    INNER JOIN Properties p ON b.PropertyID = p.PropertyID
    INNER JOIN Payments pm ON b.BookingID = pm.BookingID;

WHERE b.BookingDate >= '2025-01-01' AND p.Location = 'Nairobi';

EXPLAIN
SELECT b.BookingID, b.BookingDate, u.UserID, u.Username, u.Email, p.PropertyID, p.PropertyName, p.Location, pm.PaymentID, pm.PaymentDate, pm.Amount, pm.PaymentMethod
FROM
    Bookings b
    INNER JOIN Users u ON b.UserID = u.UserID
    INNER JOIN Properties p ON b.PropertyID = p.PropertyID
    INNER JOIN Payments pm ON b.BookingID = pm.BookingID;

## Refactored Query
SELECT
    b.BookingID,
    b.BookingDate,
    u.UserID,
    u.Username,
    p.PropertyID,
    p.PropertyName,
    pm.PaymentID,
    pm.Amount
FROM
    Bookings b
INNER JOIN
    Users u ON b.UserID = u.UserID
INNER JOIN
    Properties p ON b.PropertyID = p.PropertyID
INNER JOIN
    Payments pm ON b.BookingID = pm.BookingID;