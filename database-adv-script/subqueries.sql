/* Key differences between Correlated and Non-Correlated Subqueries:

- Non-Correlated: The subquery is independent of the outer query. It executes once and its result is used by the outer query.
- Correlated: The subquery depends on the outer query. It executes once for each row processed by the outer query.
*/

## Non Correlated Query -   Find all properties where the average rating is greater than 4.0
SELECT
    p.PropertyID,
    p.PropertyName,
    p.Location
FROM
    Properties p
WHERE
    p.PropertyID IN (
        SELECT
            r.PropertyID
        FROM
            Reviews r
        GROUP BY
            r.PropertyID
        HAVING
            AVG(r.Rating) > 4.0
    );

/*
Explanation:

Outer Query:

- The outer query selects PropertyID, PropertyName, and Location from the Properties table ( as p).

- It uses a WHERE clause with the IN operator to filter the properties.

Subquery:

- The subquery is enclosed in parentheses ().

- It selects r.PropertyID from the Reviews table (aliased as r).

- It groups the reviews by r.PropertyID using GROUP BY.

- It filters these groups using the HAVING clause to include only those properties where the average rating (AVG(r.Rating)) is greater than 4.0.

Execution Flow:

- The subquery is executed first.  It calculates the average rating for each property in the Reviews table and returns a list of PropertyIDs that meet the condition (average rating > 4.0).

- The outer query then executes.  It retrieves properties from the Properties table whose PropertyID is in the list returned by the subquery.
*/

## Correlated Subquery -  Find users who have made more than 3 bookings

SELECT
    u.UserID,
    u.Username,
    u.Email
FROM
    Users u
WHERE
    3 < (
        SELECT
            COUNT(*)
        FROM
            Bookings b
        WHERE
            b.UserID = u.UserID
    );

/*
Explanation:

Outer Query:

- The outer query selects UserID, Username, and Email from the Users table (aliased as u).

- It filters the users using a WHERE clause.

Subquery:

- The subquery calculates the number of bookings for each user.

- It selects COUNT(*) from the Bookings table (aliased as b).

- Crucially, it has a WHERE b.UserID = u.UserID clause.  This is what makes it a correlated subquery.  For each row in the Users table being considered by the outer query, the subquery is executed, using the UserID from that row.

Execution:

- The outer query starts by examining the first row in the Users table.

- The subquery is then executed, using the UserID from that first user row.  It counts the number of bookings in the Bookings table that have the same UserID.

- The WHERE clause in the outer query (3 < ...) checks if the count returned by the subquery is greater than 3.  If it is, the user's information is included in the result.

Steps 2 and 3 are repeated for every row in the Users table.
*/