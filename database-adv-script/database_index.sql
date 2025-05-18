#Index for Users table
CREATE INDEX idx_users_userid ON Users (UserID);

#Index for Bookings table
CREATE INDEX idx_bookings_bookingid ON Bookings (BookingID);

CREATE INDEX idx_bookings_userid ON Bookings (UserID);

CREATE INDEX idx_bookings_propertyid ON Bookings (PropertyID);

CREATE INDEX idx_bookings_bookingdate ON Bookings (BookingDate);

#Index for Properties table
CREATE INDEX idx_properties_propertyid ON Properties (PropertyID);