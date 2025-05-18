##Total number of bookings made by each user:
SELECT
    u.UserID,
    u.Username,
    COUNT(b.BookingID) AS TotalBookings
FROM
    Users u
JOIN
    Bookings b ON u.UserID = b.UserID
GROUP BY
    u.UserID, u.Username
ORDER BY
    TotalBookings DESC;

/*
Explanation:
- This query joins the `Users` and `Bookings` tables on `UserID`.
- It uses the `COUNT()` function to count the number of `BookingID`s for each user.
- The `GROUP BY` clause groups the results by `u.UserID` and `u.Username`, so the `COUNT()` function counts bookings for each unique user.
- The result shows each user and the total number of bookings they have made.
- The `ORDER BY` clause sorts the result in descending order of `TotalBookings`.
*/

## Rank properties based on the total number of bookings they have received
SELECT
    p.PropertyID,
    p.PropertyName,
    COUNT(b.BookingID) AS TotalBookings,
    RANK() OVER (ORDER BY COUNT(b.BookingID) DESC) AS BookingRank
    ROW_NUMBER() OVER (ORDER BY COUNT(b.BookingID) DESC) AS RowNumber
FROM
    Properties p
LEFT JOIN
    Bookings b ON p.PropertyID = b.PropertyID
GROUP BY
    p.PropertyID, p.PropertyName
ORDER BY
    BookingRank;

/*
Explanation:
- This query joins the `Properties` and `Bookings` tables on `PropertyID`.
- It uses `COUNT(b.BookingID)` to calculate the total number of bookings for each property.
- The `GROUP BY` clause groups the results by `p.PropertyID` and `p.PropertyName`, so the `COUNT()` function counts bookings for each unique property.
- The `RANK() OVER (ORDER BY COUNT(b.BookingID) DESC)` is a window function that assigns a rank to each property based on its total number of bookings.
- The `ORDER BY COUNT(b.BookingID) DESC` within the `OVER()` clause specifies that the ranking should be based on the total bookings in descending order.  Properties with the most bookings get the rank 1.
- The `BookingRank` column contains the rank of each property.  If multiple properties have the same number of bookings, they will receive the same rank, and the next rank will be skipped.
- The final `ORDER BY BookingRank` clause sorts the result set by the calculated rank.
*/