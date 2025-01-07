/** CREATE TABLE GlobalTemperatures (
    dt DATE NOT NULL,
    LandAverageTemperature FLOAT,
    LandAverageTemperatureUncertainty FLOAT,
    LandMaxTemperature FLOAT,
    LandMaxTemperatureUncertainty FLOAT,
    LandMinTemperature FLOAT,
    LandMinTemperatureUncertainty FLOAT,
    LandAndOceanAverageTemperature FLOAT,
    LandAndOceanAverageTemperatureUncertainty FLOAT
);**/

CREATE TABLE GlobalLandTemperaturesByState (
    dt DATE NOT NULL,
    AverageTemperature FLOAT,
    AverageTemperatureUncertainty FLOAT,
    State TEXT,
    Country TEXT
);

CREATE TABLE GlobalLandTemperaturesByMajorCity (
    dt DATE NOT NULL,
    AverageTemperature FLOAT,
    AverageTemperatureUncertainty FLOAT,
    City TEXT,
    Country TEXT,
    Latitude TEXT,
    Longitude TEXT
);

CREATE TABLE GlobalLandTemperaturesByCountry (
    dt DATE NOT NULL,
    AverageTemperature FLOAT,
    AverageTemperatureUncertainty FLOAT,
    Country TEXT
);

CREATE TABLE GlobalLandTemperaturesByCity (
    dt DATE NOT NULL,
    AverageTemperature FLOAT,
    AverageTemperatureUncertainty FLOAT,
    City TEXT,
    Country TEXT,
    Latitude TEXT,
    Longitude TEXT
);
