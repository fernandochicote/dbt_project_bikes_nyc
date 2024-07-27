{{ config(materialized='view') }}

select
    cast(ride_id as VARCHAR) as ride_id,
    cast(rideable_type as VARCHAR) as rideable_type,
    cast(started_at as TIMESTAMP) as started_at,
    cast(ended_at as TIMESTAMP) as ended_at,
    cast(start_station_name as VARCHAR) as start_station_name,
    cast(start_station_id as VARCHAR) as start_station_id,
    cast(end_station_name as VARCHAR) as end_station_name,
    cast(end_station_id as VARCHAR) as end_station_id,
    cast(start_lat as DOUBLE) as start_lat,
    cast(start_lng as DOUBLE) as start_lng,
    cast(end_lat as DOUBLE) as end_lat,
    cast(end_lng as DOUBLE) as end_lng,
    cast(member_casual as VARCHAR) as member_casual
from {{ ref('load_bike_trips') }}
