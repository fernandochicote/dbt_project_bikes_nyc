{{ config(materialized='view') }}

select
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    coalesce(start_station_name, 'Unknown') as start_station_name,
    coalesce(start_station_id, 'Unknown') as start_station_id,
    coalesce(end_station_name, 'Unknown') as end_station_name,
    coalesce(end_station_id, 'Unknown') as end_station_id,
    coalesce(start_lat, 0.0) as start_lat,
    coalesce(start_lng, 0.0) as start_lng,
    coalesce(end_lat, 0.0) as end_lat,
    coalesce(end_lng, 0.0) as end_lng,
    coalesce(member_casual, 'Unknown') as member_casual
from {{ ref('stg_bike_trips') }}

