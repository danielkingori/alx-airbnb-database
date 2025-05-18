SELECT b.BookingID, b.BookingDate, u.UserID, u.Username, u.Email, p.PropertyID, p.PropertyName, p.Location, pm.PaymentID, pm.PaymentDate, pm.Amount, pm.PaymentMethod
FROM
    Bookings b
    INNER JOIN Users u ON b.UserID = u.UserID
    INNER JOIN Properties p ON b.PropertyID = p.PropertyID
    INNER JOIN Payments pm ON b.BookingID = pm.BookingID;

EXPLAIN
SELECT b.BookingID, b.BookingDate, u.UserID, u.Username, u.Email, p.PropertyID, p.PropertyName, p.Location, pm.PaymentID, pm.PaymentDate, pm.Amount, pm.PaymentMethod
FROM
    Bookings b
    INNER JOIN Users u ON b.UserID = u.UserID
    INNER JOIN Properties p ON b.PropertyID = p.PropertyID
    INNER JOIN Payments pm ON b.BookingID = pm.BookingID;