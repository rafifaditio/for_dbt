WITH source as (
	SELECT *
	FROM bike_trips
	WHERE start_time > (CURRENT_DATE - INTERVAL '30 days')
	)
	
SELECT stations.district,
	COUNT(trips.trip_id) as visitor
FROM source AS trips
JOIN bike_stations AS stations
	ON trips.start_station_id = stations.station_id
GROUP BY 1
ORDER BY 2 DESC
