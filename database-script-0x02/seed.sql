-- Insert sample data into the User table
INSERT INTO User (FirstName, LastName, Email, UserType, Password, PhoneNumber, DateJoined, ProfilePicture) VALUES
('Alice', 'Smith', 'alice.smith@example.com', 'Guest', '$2a$10$abcdefghijklmnopqrstuvwxyza', '123-456-7890', '2024-01-15 10:00:00', 'alice.jpg'),
('Bob', 'Johnson', 'bob.johnson@example.com', 'Host', '$2a$10$bcdefghijklmnopqrstuvwxyzabcde', '987-654-3210', '2023-11-20 14:30:00', 'bob.png'),
('Charlie', 'Brown', 'charlie.brown@example.com', 'Guest', '$2a$10$cdefghijklmnopqrstuvwxyzabcdef', '555-123-4567', '2024-03-01 09:15:00', 'charlie.jpeg'),
('Diana', 'Miller', 'diana.miller@example.com', 'Host', '$2a$10$defghijklmnopqrstuvwxyzabcdefg', '111-222-3333', '2023-09-05 18:00:00', 'diana.gif'),
('Eve', 'Williams', 'eve.williams@example.com', 'Guest', '$2a$10$efghijklmnopqrstuvwxyzabcdefgh', '444-555-6666', '2024-04-22 11:45:00', 'eve.bmp');

-- Insert sample data into the Property table
INSERT INTO Property (HostID, Title, Description, Address, City, StateProvince, Country, PostalCode, PricePerNight, NumberOfBedrooms, NumberOfBathrooms, PropertyType, MaxGuests, Status) VALUES
(2, 'Cozy Apartment with City View', 'Enjoy stunning city views from this modern one-bedroom apartment.', '123 Main St, Apt 4B', 'New York', 'NY', 'USA', '10001', 150.00, 1, 1.0, 'Apartment', 2, 'Available'),
(2, 'Spacious Family House with Garden', 'A beautiful three-bedroom house with a large garden, perfect for families.', '456 Oak Ave', 'Los Angeles', 'CA', 'USA', '90001', 250.00, 3, 2.5, 'House', 6, 'Available'),
(4, 'Luxury Penthouse with Private Terrace', 'Experience luxury in this top-floor penthouse with a private terrace and jacuzzi.', '789 Pine Ln, PH', 'Miami', 'FL', 'USA', '33101', 400.00, 2, 2.0, 'Apartment', 4, 'Available'),
(4, 'Charming Cottage by the Lake', 'A quaint two-bedroom cottage nestled by a serene lake.', '101 Lake Rd', 'Seattle', 'WA', 'USA', '98101', 180.00, 2, 1.5, 'House', 4, 'Available'),
(2, 'Modern Studio in Downtown Area', 'Perfect for solo travelers or couples, this studio is located in the heart of downtown.', '222 Elm St, Unit 1A', 'Chicago', 'IL', 'USA', '60601', 100.00, 0, 1.0, 'Apartment', 2, 'Available');

-- Insert sample data into the Booking table
INSERT INTO Booking (PropertyID, GuestID, CheckInDate, CheckOutDate, TotalPrice, NumberOfGuests, BookingStatus, BookingDate) VALUES
(1, 1, '2024-05-15', '2024-05-20', 700.00, 2, 'Confirmed', '2024-05-01 12:00:00'),
(2, 3, '2024-06-10', '2024-06-15', 1250.00, 4, 'Confirmed', '2024-05-10 16:30:00'),
(3, 5, '2024-07-01', '2024-07-07', 2400.00, 2, 'Confirmed', '2024-05-25 09:00:00'),
(4, 1, '2024-05-25', '2024-05-28', 540.00, 3, 'Confirmed', '2024-05-12 18:45:00'),
(1, 3, '2024-08-01', '2024-08-05', 600.00, 1, 'Pending', '2024-06-15 11:00:00'),
(2, 5, '2024-09-15', '2024-09-22', 1750.00, 5, 'Confirmed', '2024-07-01 14:00:00'),
(5, 1, '2024-10-01', '2024-10-03', 200.00, 2, 'Confirmed', '2024-08-10 10:30:00');

-- Insert sample data into the Review table
INSERT INTO Review (BookingID, GuestID, PropertyID, Rating, Comment, ReviewDate) VALUES
(1, 1, 1, 5, 'Great apartment with amazing views! Highly recommended.', '2024-05-20 14:00:00'),
(2, 3, 2, 4, 'The house was spacious and the garden was lovely. We enjoyed our stay.', '2024-06-15 11:30:00'),
(3, 5, 3, 5, 'Luxury at its finest! The penthouse was incredible.', '2024-07-07 19:00:00'),
(4, 1, 4, 3, 'The cottage was charming, but a bit smaller than expected.', '2024-05-28 16:45:00'),
(6, 5, 2, 5, 'Another fantastic stay at this property. Bob is a great host!', '2024-09-22 12:15:00'),
(7, 1, 5, 4, 'Convenient location and a clean, modern studio.', '2024-10-03 10:00:00');

-- Insert sample data into the Payment table
INSERT INTO Payment (BookingID, Amount, PaymentDate, PaymentStatus, PaymentMethod) VALUES
(1, 700.00, '2024-05-01 12:15:00', 'Completed', 'Credit Card'),
(2, 1250.00, '2024-05-10 16:45:00', 'Completed', 'PayPal'),
(3, 2400.00, '2024-05-25 09:10:00', 'Completed', 'Credit Card'),
(4, 540.00, '2024-05-12 19:00:00', 'Completed', 'Debit Card'),
(6, 1750.00, '2024-07-01 14:10:00', 'Completed', 'Credit Card'),
(7, 200.00, '2024-08-10 10:40:00', 'Completed', 'PayPal');

-- Note: Booking with BookingID 5 is in 'Pending' status, so no payment is added yet.
