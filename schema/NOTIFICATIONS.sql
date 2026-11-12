
CREATE TABLE riders (
    riderID SERIAL PRIMARY KEY,
    fullName VARCHAR(50)
);

CREATE TABLE rentals (
    rentalID SERIAL PRIMARY KEY
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
















