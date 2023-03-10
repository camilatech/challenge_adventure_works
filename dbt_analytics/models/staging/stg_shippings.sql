with shipping as (
    select
        md5 ( concat (name, shipbase) ) as sk_ship
        , name as ship_company
        , shipbase as ship_min_charge
        , shiprate as ship_charge
        , shipmethodid as ship_method_id
        , cast(modifieddate as timestamp) as modifieddate
       from {{ source('dw_purchasing', 'shipmethod')}}
)
select *
from shipping