SELECT EXTRACT(YEAR FROM dt) AS year, AVG(LandAverageTemperature) AS avg_temp
FROM GlobalTemperatures
GROUP BY year
ORDER BY avg_temp DESC
LIMIT 10;
