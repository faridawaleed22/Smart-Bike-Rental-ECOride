CREATE TABLE admins (
    adminID SERIAL PRIMARY KEY,
    fullName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);



CREATE TABLE pricing_plans (
    pricingID SERIAL PRIMARY KEY,
    planType VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);




CREATE TABLE docks (
    dockID SERIAL PRIMARY KEY,
    stationID INT NOT NULL,
    bikeID INT UNIQUE,
    status VARCHAR(50) NOT NULL DEFAULT 'available'
        CHECK (status IN ('available', 'occupied', 'out_of_service')),

    CONSTRAINT fk_dock_station
        FOREIGN KEY (stationID) REFERENCES stations(stationID)
        ON DELETE CASCADE,

    CONSTRAINT fk_dock_bike
        FOREIGN KEY (bikeID) REFERENCES bikes(bikeID)
        ON DELETE SET NULL
);