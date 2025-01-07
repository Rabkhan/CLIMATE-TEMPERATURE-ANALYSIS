\COPY GlobalLandTemperaturesByState FROM '/Users/rabkhan/Desktop/SQL_Project_DA/Climate-temprature-analysis/climate_data/GlobalLandTemperaturesByState.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY GlobalLandTemperaturesByMajorCity FROM '/Users/rabkhan/Desktop/SQL_Project_DA/Climate-temprature-analysis/climate_data/GlobalLandTemperaturesByMajorCity.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY GlobalLandTemperaturesByCountry FROM '/Users/rabkhan/Desktop/SQL_Project_DA/Climate-temprature-analysis/climate_data/GlobalLandTemperaturesByCountry.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\COPY GlobalLandTemperaturesByCity FROM '/Users/rabkhan/Desktop/SQL_Project_DA/Climate-temprature-analysis/climate_data/GlobalLandTemperaturesByCity.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');