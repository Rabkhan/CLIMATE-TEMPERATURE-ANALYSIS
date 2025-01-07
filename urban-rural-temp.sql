SELECT 'Global Average' AS location, AVG(LandAverageTemperature) AS avg_temp
FROM GlobalTemperatures
UNION
SELECT 'Major Cities' AS location, AVG(AverageTemperature) AS avg_temp
FROM GlobalLandTemperaturesByMajorCity;
