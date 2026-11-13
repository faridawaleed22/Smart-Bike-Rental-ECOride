-- Seed data for admins

INSERT INTO admins (fullName, email, password) VALUES
('Ahmed Hassan', 'ahmed.hassan@example.com', 'admin123'),
('Sara Mohamed', 'sara.mohamed@example.com', 'admin456'),
('Omar Khaled', 'omar.khaled@example.com', 'admin789');
INSERT INTO riders (FullName, email, password, phonenumber, VerificationStatus) VALUES
('Ahmed Hassan', 'ahmed@example.com', 'hashed_pw_1', '01012345678', TRUE),
('Sara Ali',     'sara@example.com',  'hashed_pw_2', '01123456789', TRUE),
('Omar Khaled',  'omar@example.com',  'hashed_pw_3', '01234567890', FALSE);

INSERT INTO notifications (riderID, rentalID, message, notificationType) VALUES
(1, NULL, 'Your rental has started. Enjoy your ride!', 'rental'),
(2, NULL, 'Your payment was processed successfully.', 'payment'),
(3, NULL, 'Your rental is overdue. Please return the bike.', 'penalty');

INSERT INTO pricing_plans (planType, price) VALUES
  ('Hourly',  20.00),
  ('Daily',   100.00),
  ('Monthly', 800.00);

INSERT INTO docks (stationID, bikeID, status) VALUES
  (1, 1,    'occupied'),
  (1, NULL, 'available'),
  (1, NULL, 'out_of_service'),
  (2, 2,    'occupied'),
  (2, NULL, 'available');

INSERT INTO payments (rentalID, amount, paymentstatus)
VALUES
(1, 500.00, 'Completed'),
(2, 350.00, 'Pending'),
(3, 250.00, 'Failed');
  