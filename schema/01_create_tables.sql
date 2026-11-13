CREATE TABLE riders (
    riderID             SERIAL PRIMARY KEY,
    FullName            VARCHAR(50)  NOT NULL,
    email               VARCHAR(100) NOT NULL UNIQUE,
    password            VARCHAR(255) NOT NULL,
    phonenumber         VARCHAR(11)  NOT NULL UNIQUE
                        CHECK (phonenumber ~ '^[0-9]{11}$'),
    VerificationStatus  BOOLEAN      NOT NULL DEFAULT FALSE
);






























CREATE TABLE notifications (
    notificationID  SERIAL PRIMARY KEY,

    riderID          INT NOT NULL
                      REFERENCES riders(riderID) ON DELETE CASCADE,
					  
    rentalID         INT NULL
                      REFERENCES rentals(rentalID) ON DELETE SET NULL,
    message           TEXT        NOT NULL,
    notificationTYPE VARCHAR(30) NOT NULL
                      CHECK (notificationTYPE IN
                             ('rental', 'payment', 'penalty', 'issue', 'general'))
);

CREATE TABLE admins (
    adminID SERIAL PRIMARY KEY,
    fullName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

