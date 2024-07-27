{{ config(materialized='view') }}

with calculations as (
    select
        ride_id,
        rideable_type,
        started_at,
        ended_at,
        start_station_name,
        start_station_id,
        end_station_name,
        end_station_id,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual,
        -- Calcular tiempo en minutos y redondear a dos dígitos
        round(extract(epoch from (ended_at - started_at)) / 60.0, 2) as ride_duration_minutes,
        -- Calcular distancia usando la fórmula Haversine y redondear a dos dígitos
        round(111.045 * DEGREES(ACOS(LEAST(1.0, GREATEST(-1.0, COS(RADIANS(start_lat))
              * COS(RADIANS(end_lat))
              * COS(RADIANS(end_lng) - RADIANS(start_lng))
              + SIN(RADIANS(start_lat))
              * SIN(RADIANS(end_lat)))))), 2) as ride_distance_km
    from {{ ref('cleaned_bike_trips') }}
)

select * from calculations


