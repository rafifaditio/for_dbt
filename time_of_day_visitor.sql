WITH source as (
	select start_time, trip_id,
		case when extract(hour from start_time) < 4 then 'Midnight'
			when extract(hour from start_time) < 6 then 'Dawn'
			when extract(hour from start_time) < 10 then 'Morning'
			when extract(hour from start_time) < 16 then 'Afternoon'
			when extract(hour from start_time) < 19 then 'Evening'
			when extract(hour from start_time) < 23 then 'Night'
			else 'Midnight' end as Time_of_day
	from bike_trips)

SELECT Time_of_day, COUNT(trip_id)
FROM source
GROUP BY 1
ORDER BY array_position(ARRAY['Dawn','Morning','Afternoon','Evening','Night','Midnight'], time_of_day)