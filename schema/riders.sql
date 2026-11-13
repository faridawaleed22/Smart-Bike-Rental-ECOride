DROP TABLE IF EXISTS riders CASCADE;

CREATE TABLE riders (
    riderID            SERIAL PRIMARY KEY,
    FullName           VARCHAR(50)  NOT NULL,
    email               VARCHAR(100) NOT NULL UNIQUE,
    password            VARCHAR(255) NOT NULL,   
    phonenumber        VARCHAR(11)  NOT NULL UNIQUE
                        CHECK (phonenumber ~ '^[0-9]{11}$'),
    VerificationStatus BOOLEAN      NOT NULL DEFAULT FALSE
);
-- ===== SEED DATA =====
INSERT INTO riders (FullName, email, password, phonenumber, VerificationStatus) VALUES
('Ahmed Hassan', 'ahmed@example.com', 'hashed_pw_1', '01012345678', TRUE),
('Sara Ali',     'sara@example.com',  'hashed_pw_2', '01123456789', TRUE),
('Omar Khaled',  'omar@example.com',  'hashed_pw_3', '01234567890', FALSE);