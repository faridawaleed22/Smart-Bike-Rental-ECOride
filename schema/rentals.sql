CREATE TABLE rentals (
    rentalID         SERIAL PRIMARY KEY,
    riderID          INT NOT NULL,
    bikeID           INT NOT NULL,
    pricingID        INT NOT NULL,
    startStationID   INT NOT NULL,
    endStationID     INT,
    startTime        TIMESTAMP NOT NULL DEFAULT NOW(),
    endTime          TIMESTAMP,
    usageDuration    INT,
    status           VARCHAR(20) NOT NULL DEFAULT 'active',
    totalCost        DECIMAL(10,2),

    -- RESTRICT: a rider with rental history must not be deleted
    CONSTRAINT fk_rentals_rider
        FOREIGN KEY (riderID) REFERENCES riders(riderID) ON DELETE RESTRICT,
    -- RESTRICT: a bike with rental history must not be deleted
    CONSTRAINT fk_rentals_bike
        FOREIGN KEY (bikeID) REFERENCES bikes(bikeID) ON DELETE RESTRICT,
    -- RESTRICT: a pricing plan used by rentals must not be deleted
    CONSTRAINT fk_rentals_pricing
        FOREIGN KEY (pricingID) REFERENCES pricing_plans(pricingID) ON DELETE RESTRICT,
    -- RESTRICT: a station used in past rentals must not be deleted
    CONSTRAINT fk_rentals_start_station
        FOREIGN KEY (startStationID) REFERENCES stations(stationID) ON DELETE RESTRICT,
    CONSTRAINT fk_rentals_end_station
        FOREIGN KEY (endStationID) REFERENCES stations(stationID) ON DELETE RESTRICT,

    CONSTRAINT chk_rentals_status
        CHECK (status IN ('active', 'completed', 'cancelled')),
    CONSTRAINT chk_rentals_time
        CHECK (endTime IS NULL OR endTime > startTime),
    CONSTRAINT chk_rentals_duration
        CHECK (usageDuration IS NULL OR usageDuration >= 0),
    CONSTRAINT chk_rentals_cost
        CHECK (totalCost IS NULL OR totalCost >= 0)
);