with shipping as (
    select
        name as ship_company
        , md5 ( concat (name, shipbase) ) as sk_ship
        , shipbase as ship_min_charge
        , shiprate as ship_charge
        , shipmethodid as ship_method_id
        , cast(modifieddate as date) as modifieddate
       from {{ source('analytics', 'shipmethod')}}
)
select *
from shipping