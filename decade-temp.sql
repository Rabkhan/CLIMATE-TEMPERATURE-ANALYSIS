SELECT EXTRACT(YEAR FROM dt) AS year, AVG(AverageTemperature) AS avg_temp
FROM GlobalLandTemperaturesByCountry
WHERE Country = 'India'
GROUP BY year
ORDER BY year;
