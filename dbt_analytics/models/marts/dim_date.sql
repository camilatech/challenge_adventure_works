with
    extracted_date as (
        select *
        from unnest(generate_date_array('2000-01-01', current_date('-3:00'), interval 1 day)) as d
    )
    , extract_from_date as (
        select
            d as full_date
            , extract(year from d) as `year`
            , extract(week from d) as year_week
            , extract(day from d) as year_day
            , extract(month from d) as `month`
            , format_date('%Q', d) as fiscal_qtr
            , format_date('%B', d) as month_name
            , format_date('%w', d) as week_day
            , format_date('%A', d) as day_name
            , case when format_date('%A', d) in ('Sunday', 'Saturday') then false else true end as is_week_day
        from extracted_date
    )
select 
    {{ dbt_utils.surrogate_key([
        'full_date'
        ]) }} as sk_date
    , full_date
    , `year`
    , year_week
    , year_day
    , `month`
    , fiscal_qtr
    , month_name
    , week_day
    , day_name
    , is_week_day
from extract_from_date
order by full_date
