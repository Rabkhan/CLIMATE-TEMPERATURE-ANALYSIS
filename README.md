# Climate Temperature Analysis

This project involves analyzing global temperature data to study climate change patterns using SQL. The dataset is sourced from [Kaggle: Climate Change: Earth Surface Temperature Data](https://www.kaggle.com/datasets/berkeleyearth/climate-change-earth-surface-temperature-data).

## Table of Contents

- [Overview](#overview)
- [Dataset](#dataset)
- [Setup and Installation](#setup-and-installation)
- [Database Creation](#database-creation)
- [Data Insertion](#data-insertion)
- [SQL Queries and Analysis](#sql-queries-and-analysis)
- [Conclusion](#conclusion)
- [License](#license)

## Overview

The goal of this project is to analyze the historical temperature data to identify trends, such as temperature changes over time, variations by region, and the hottest/coldest years. The dataset contains temperature data at various levels, including global, country, state, city, and major city temperatures.

## Dataset

The dataset contains the following CSV files:

1. **GlobalTemperatures.csv** - Global temperature data with average land and ocean temperature.
2. **GlobalLandTemperaturesByState.csv** - Average land temperature by state.
3. **GlobalLandTemperaturesByMajorCity.csv** - Average land temperature by major city.
4. **GlobalLandTemperaturesByCountry.csv** - Average land temperature by country.
5. **GlobalLandTemperaturesByCity.csv** - Average land temperature by city.

## Setup and Installation

### Prerequisites
1. PostgreSQL (or any SQL-compatible database system).
2. The Kaggle dataset downloaded and stored locally on your system.

### Steps to Set Up

### Database Creation

```
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
```

### Data Insertion

```\copy GlobalTemperatures FROM '/path/to/GlobalTemperatures.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY GlobalLandTemperaturesByState FROM '/path/to/GlobalLandTemperaturesByState.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY GlobalLandTemperaturesByMajorCity FROM '/path/to/GlobalLandTemperaturesByMajorCity.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY GlobalLandTemperaturesByCountry FROM '/path/to/GlobalLandTemperaturesByCountry.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY GlobalLandTemperaturesByCity FROM '/path/to/GlobalLandTemperaturesByCity.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
```

#### 1. Top 10 States with the Greatest Temperature Change Since 1970

```
SELECT State, 
       AVG(CASE WHEN dt >= '1970-01-01' THEN AverageTemperature ELSE NULL END) AS recent_avg_temp,
       AVG(CASE WHEN dt < '1970-01-01' THEN AverageTemperature ELSE NULL END) AS past_avg_temp,
       AVG(CASE WHEN dt >= '1970-01-01' THEN AverageTemperature ELSE NULL END) - 
       AVG(CASE WHEN dt < '1970-01-01' THEN AverageTemperature ELSE NULL END) AS temp_change
FROM GlobalLandTemperaturesByState
GROUP BY State
ORDER BY temp_change DESC
LIMIT 10;

```

#### 2. Average Temperature by Year for India

```
SELECT EXTRACT(YEAR FROM dt) AS year, AVG(AverageTemperature) AS avg_temp
FROM GlobalLandTemperaturesByCountry
WHERE Country = 'India'
GROUP BY year
ORDER BY year;
```

#### 3. Hottest and Coldest Years Globally

```
SELECT EXTRACT(YEAR FROM dt) AS year, AVG(LandAverageTemperature) AS avg_temp
FROM GlobalTemperatures
GROUP BY year
ORDER BY avg_temp DESC
LIMIT 10;
```

#### 4. Average Temperature by Country (Top 5)

```
SELECT Country, AVG(AverageTemperature) AS avg_temp
FROM GlobalLandTemperaturesByCountry
GROUP BY Country
ORDER BY avg_temp DESC
LIMIT 5;
```

#### 5. Urban vs Rural Temperature Comparison
sql
Copy code

```
SELECT 'Global Average' AS location, AVG(LandAverageTemperature) AS avg_temp

FROM GlobalTemperatures
UNION

SELECT 'Major Cities' AS location, 
AVG(AverageTemperature) AS avg_temp

FROM GlobalLandTemperaturesByMajorCity;

```

### Conclusion
This project provides valuable insights into the patterns of global temperature changes over time. From the analysis, we can observe the difference in temperatures across different regions and highlight any significant temperature shifts, particularly since 1970. Further studies can build on these insights to understand the broader implications of climate change


This `README.md` file provides a comprehensive guide for anyone who wishes to understand the setup, usage, and analysis performed in the Climate Temperature Analysis project. You can copy and paste this into your repository's `README.md` file.




