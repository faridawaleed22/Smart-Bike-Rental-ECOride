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