SELECT b.BookingID, b.BokkingDate, u.UserID, u.FirstName, u.Email
FROM Bookings b
    INNER JOIN Users u ON b.UserID = u.UserID

##
LEFT JOIN