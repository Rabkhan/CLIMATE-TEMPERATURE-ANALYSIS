SELECT State, 
       AVG(CASE WHEN dt >= '1970-01-01' THEN AverageTemperature ELSE NULL END) AS recent_avg_temp,
       AVG(CASE WHEN dt < '1970-01-01' THEN AverageTemperature ELSE NULL END) AS past_avg_temp,
       AVG(CASE WHEN dt >= '1970-01-01' THEN AverageTemperature ELSE NULL END) - 
       AVG(CASE WHEN dt < '1970-01-01' THEN AverageTemperature ELSE NULL END) AS temp_change
FROM GlobalLandTemperaturesByState
GROUP BY State
ORDER BY temp_change DESC
LIMIT 10;
