{{ config(materialized='table') }}

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
    member_casual
from read_csv_auto(
    ['./data/202401-citibike-tripdata_1.csv',
    './data/202401-citibike-tripdata_2.csv',
    './data/202402-citibike-tripdata_1.csv',
    './data/202402-citibike-tripdata_2.csv',
    './data/202402-citibike-tripdata_3.csv',
    './data/202403-citibike-tripdata_1.csv',
    './data/202403-citibike-tripdata_2.csv',
    './data/202403-citibike-tripdata_3.csv'],
    
    types={
        'ride_id': 'VARCHAR',
        'rideable_type': 'VARCHAR',
        'started_at': 'TIMESTAMP',
        'ended_at': 'TIMESTAMP',
        'start_station_name': 'VARCHAR',
        'start_station_id': 'VARCHAR',
        'end_station_name': 'VARCHAR',
        'end_station_id': 'VARCHAR',
        'start_lat': 'DOUBLE',
        'start_lng': 'DOUBLE',
        'end_lat': 'DOUBLE',
        'end_lng': 'DOUBLE',
        'member_casual': 'VARCHAR'
    }
)


