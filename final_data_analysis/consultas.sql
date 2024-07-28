-- Media de distancia y tiempo por tipo de bici
select
    rideable_type,
    round(avg(ride_duration_minutes), 2) as avg_ride_duration_minutes,
    round(avg(ride_distance_km), 2) as avg_ride_distance_km
from fact_bike_trips
group by rideable_type
order by rideable_type;

-- Trayecto más largo en tiempo
select
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    end_station_name,
    round(ride_duration_minutes, 2) as ride_duration_minutes,
    round(ride_distance_km, 2) as ride_distance_km
from fact_bike_trips
order by ride_duration_minutes desc
limit 1;

-- Trayecto más largo en distancia
select
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    end_station_name,
    round(ride_duration_minutes, 2) as ride_duration_minutes,
    round(ride_distance_km, 2) as ride_distance_km
from fact_bike_trips
order by ride_distance_km desc
limit 1;