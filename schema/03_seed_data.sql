-- 1. ADMINS
INSERT INTO admins (fullName, email, password)
VALUES
('Ahmed Hassan', 'ahmed.hassan@example.com', 'admin123'),
('Sara Mohamed', 'sara.mohamed@example.com', 'admin456'),
('Omar Khaled', 'omar.khaled@example.com', 'admin789');

-- 2. RIDERS
INSERT INTO riders (
    FullName, email, password, phonenumber, VerificationStatus
)
VALUES
('Ahmed Hassan', 'ahmed@example.com', 'hashed_pw_1', '01012345678', TRUE),
('Sara Ali', 'sara@example.com', 'hashed_pw_2', '01123456789', TRUE),
('Omar Khaled', 'omar@example.com', 'hashed_pw_3', '01234567890', FALSE);

-- 3. PRICING PLANS
INSERT INTO pricing_plans (planType, price)
VALUES
('Hourly', 20.00),
('Daily', 100.00),
('Monthly', 800.00);

-- 4. COMPANIES
INSERT INTO companies (companyName, companyEmail)
VALUES
('ECOride Mobility', 'contact@ecoride.example'),
('Cairo Cycle Co.', 'info@cairocycle.example');

-- 5. STATIONS
INSERT INTO stations (stationName, location, dockCapacity)
VALUES
('Main Station', 'New Cairo', 20),
('University Station', 'GIU Campus', 15),
('Central Station', 'Downtown Cairo', 30);

-- 6. BIKES
INSERT INTO bikes (companyID, QRCODE, Status)
VALUES
(1, 'ECO-001', 'available'),
(2, 'CC-001', 'available');

-- 7. DOCKS
INSERT INTO docks (stationID, bikeID, status)
VALUES
(1, 1, 'occupied'),
(1, NULL, 'available'),
(1, NULL, 'out_of_service'),
(2, 2, 'occupied'),
(2, NULL, 'available');

-- 8. PENALTIES
INSERT INTO penalties (
    riderID, AdminID, accountAction, reason
)
VALUES
(3, 1, 'Warning',
 'Rental is overdue. Bike was not returned on time.'),

(1, 2, 'Fine - 50.00 EGP',
 'Bike parked outside of a designated docking station zone.'),

(2, 1, 'Fine - 100.00 EGP',
 'Bike left unlocked after ending the rental session.'),

(3, 3, 'Temporary Suspension (7 Days)',
 'Repeated overdue rentals and unverified account status.');

-- 9. RENTALS
INSERT INTO rentals (
    riderID,
    bikeID,
    pricingID,
    startStationID,
    endStationID,
    startTime,
    endTime,
    usageDuration,
    status,
    totalCost
)
VALUES
(1, 1, 2, 1, 2,
 '2026-11-01 09:00', '2026-11-01 11:30',
 150, 'completed', 500.00),

(2, 2, 1, 2, 3,
 '2026-11-02 14:00', '2026-11-02 15:00',
 60, 'completed', 350.00),

(3, 1, 1, 3, 1,
 '2026-11-03 10:00', '2026-11-03 12:00',
 120, 'completed', 250.00);

-- 10. PAYMENTS
INSERT INTO payments (rentalID, amount, paymentstatus)
VALUES
(1, 500.00, 'Completed'),
(2, 350.00, 'Pending'),
(3, 250.00, 'Failed');

-- 11. NOTIFICATIONS
INSERT INTO notifications (
    riderID, rentalID, message, notificationType
)
VALUES
(1, NULL, 'Your rental has started. Enjoy your ride!', 'rental'),
(2, NULL, 'Your payment was processed successfully.', 'payment'),
(3, NULL, 'Your rental is overdue. Please return the bike.', 'penalty');

-- 12. ISSUES — YOUR CONTRIBUTION
INSERT INTO issues (
    riderID,
    bikeID,
    rentalID,
    HandledByAdminID,
    issueTYPE,
    description,
    status
)
VALUES
(1, 1, 1, NULL,
 'brakes',
 'The brakes felt weak during the ride.',
 'open'),

(2, 2, 2, 1,
 'seat',
 'The seat adjustment mechanism was loose.',
 'in_progress'),

(3, 1, 3, 2,
 'chain',
 'The chain slipped and has been repaired.',
 'resolved');