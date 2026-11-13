


CREATE TABLE payments (
    paymentid SERIAL PRIMARY KEY,

    rentalID INT NOT NULL,

    amount DECIMAL(10,2) NOT NULL,

    paymentstatus VARCHAR(50) NOT NULL,

    paymenttime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (rentalID)
        REFERENCES rentals(rentalID)
        ON DELETE RESTRICT,

    CHECK (amount >= 0),

    CHECK (paymentstatus IN ('Pending', 'Completed', 'Failed', 'Refunded'))
);
