CREATE TABLE pricing_plans (
    pricing_id  SERIAL PRIMARY KEY,
    plan_type   VARCHAR(50)    NOT NULL UNIQUE,
    price       DECIMAL(10,2)  NOT NULL CHECK (price >= 0)
);

CREATE TABLE docks (
    dock_id     SERIAL PRIMARY KEY,
    station_id  INT NOT NULL,
    bike_id     INT NULL UNIQUE,
    status      VARCHAR(50) NOT NULL DEFAULT 'available'
                CHECK (status IN ('available', 'occupied', 'out_of_service')),

    CONSTRAINT fk_dock_station
        FOREIGN KEY (station_id) REFERENCES stations(station_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_dock_bike
        FOREIGN KEY (bike_id) REFERENCES bikes(bike_id)
        ON DELETE SET NULL
);   