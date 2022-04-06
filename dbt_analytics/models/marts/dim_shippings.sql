with d_shipping as (
    select
        ship_company
        , ship_min_charge
        , ship_charge
        , ship_method_id
        , modifieddate
        , sk_ship
    from {{ ref('stg_shippings') }}
)
select *
from d_shipping
