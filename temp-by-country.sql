SELECT Country, AVG(AverageTemperature) AS avg_temp
FROM GlobalLandTemperaturesByCountry
GROUP BY Country
ORDER BY avg_temp DESC
LIMIT 5;
