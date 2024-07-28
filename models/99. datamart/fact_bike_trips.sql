{{ config(materialized='table') }}

with _tmp_data as (
    select *
        -- Campos de auditoria
        , NOW() audit_row_insert
        , 'dbt_demo' audit_process_id
    from {{ ref('enriched_bike_trips') }}
)

select * from _tmp_data