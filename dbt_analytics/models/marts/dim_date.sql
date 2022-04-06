with
    extracted_date as (
        select generate_series(
           (date '2000-01-01')::timestamp,
           (date '2023-01-01')::timestamp,
           interval '1 day')
    )
    , extract_from_date as(
        select 
        {{ dbt_utils.surrogate_key([
            'generate_series'
            ]) }} as sk_date
        , cast(generate_series as date) as date_series
        from extracted_date
        order by date_series
    )
select *
from extract_from_date

