##INNER JOIN - to retrieve all bookings and the repective users
SELECT b.BookingID, b.BokkingDate, u.UserID, u.FirstName, u.Email
FROM Bookings b
    INNER JOIN Users u ON b.UserID = u.UserID

#LEFT JOIN - to retieve all properties and their reviews, ncluding properties that have no reviews.
SELECT 
    p.PropertyID,
    p.PropertyName,
    p.Location,
    r.ReviewID,
    r.ReviewText,
    r.Rating

FROM
    Properties p
LEFT JOIN r ON p.PropertyID = r.PropertyID;

## FUll OUTER JOIN - retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT
    u.UserID AS UserID,
    u.Username,
    u.Email,
    b.BookingID,
    b.PropertyID,
    b.BookingDate
FROM
    Users u
FULL OUTER JOIN
    Bookings b ON u.UserID = b.UserID;