
INSERT INTO riders (FullName, email, password, phonenumber, VerificationStatus) VALUES
('Ahmed Hassan', 'ahmed@example.com', 'hashed_pw_1', '01012345678', TRUE),
('Sara Ali',     'sara@example.com',  'hashed_pw_2', '01123456789', TRUE),
('Omar Khaled',  'omar@example.com',  'hashed_pw_3', '01234567890', FALSE);

INSERT INTO notifications (riderID, rentalID, message, notificationType) VALUES
(1, NULL, 'Your rental has started. Enjoy your ride!', 'rental'),
(2, NULL, 'Your payment was processed successfully.', 'payment'),
(3, NULL, 'Your rental is overdue. Please return the bike.', 'penalty');