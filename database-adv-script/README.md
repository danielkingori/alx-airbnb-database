## INNER JOIN
to retireve all bookings and their respective users
#### Explanation
- it's supposed to combine the Bookings tbale (b) with rows from the Users table (u)
- The ON clasue specifies the join condition where the rows in the UserID columns have same values in both tables
- specific columns are selected from the bookings and users tables
- it's mandatory to get a user on the Users table, failure to will be excluded


## LEFT JOIN
to retieve all properties and their reviews, ncluding properties that have no reviews.
#### explanation
- to combine rows from the properties table p with rows from the reviews table r
- the ON clause specifies the join condition- matches where the propertyID column has same value in both tables
- ensures all rows are included in the result


## FULL OUTER JOIN
to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user:
#### explanantion 
- query selects columns from both tables to avoid ambiguity
- if a user has one or more bookings, their information will be combined with their booking details
- if none, their information will be included with a null values
- if a boooking is found without a user, the booking details will be included with null values for the user column

