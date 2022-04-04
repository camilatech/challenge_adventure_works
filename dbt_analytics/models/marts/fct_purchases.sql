
{{ config(materialized='table') }}

with
    fk_products as(
        select
            productid
            , sk_product
        from {{ref('stg_products')}}
    ),
    fk_ship as(
        select
            sk_ship
            , ship_method_id as ship_id
        from {{ref('stg_shipping')}}
    ),
    fk_vendor as(
        select
            sk_vendor
            , vendorid
        from {{ref('stg_vendors')}}
    )
    , purchasing as (
        select 
            unit_price
            , order_qty
            , received_qty
            , rejected_qty
            , due_date
            , purchase_status
            , tax_amount
            , subtotal
            , vendor_id
            , employee_id
            , ship_method_id
            , order_date
            , ship_date
            , product_id
            , purchase_detail_id
            , sk_ship
        from {{ref('stg_fct_purchasing')}}
            left join fk_ship
            on fk_ship.ship_id = ship_method_id
    )

select * 
from purchasing

   -- purchase_joined_ship as (

   --     select *

   --     from purchasing

   --         left join fk_ship

   --         on fk_ship.ship_id = purchasing.ship_method_id

   -- ),


   -- purchase_joined_vendor as (

    --    select *

    --    from purchase_joined_ship

    --    left join fk_vendor

    --        on fk_vendor.vendorid = purchase_joined_ship.vendor_id

   -- ),



    --purchase_joined_product as (

    --    select *

   --     from purchase_joined_vendor

   --     left join fk_products

   --         on fk_products.productid = purchase_joined_vendor.product_id

   -- )

    

    --select 

    --    unit_price

    --    , order_qty

    --    , received_qty

    --    , rejected_qty

    --    , due_date

    --    , purchase_status

    --    , purchase_detail_id

    --    , tax_amount

    --    , subtotal

    --    , vendor_id

    --    , employee_id

    --    , ship_method_id

    --    , order_date

    --    , ship_date

    --    , product_id 

    --    , sk_product

    --    , sk_ship

    --    , sk_vendor 

    --    from purchase_joined_product