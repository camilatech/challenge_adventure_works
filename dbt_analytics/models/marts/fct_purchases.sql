
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
       from {{ref('stg_shippings')}}
   ),

   fk_vendor as(
       select
           sk_vendor
           , vendor_id
       from {{ref('stg_vendors')}}
   ),
   fk_employee as (
       select
           sk_employee
           , employee_id
       from {{ref('stg_employee')}}
   ),
   purchasing as (
       select
           unit_price
           , order_qty
           , received_qty
           , rejected_qty
           , sk_due_date
           , due_date
           , purchase_status
           , vendor_id_p
           , employee_id as employee
           , ship_method_id
           , order_date
           , sk_order_date
           , ship_date
           , sk_ship_date
           , product_id
           , purchase_detail_id
           , sk_ship
       from {{ref('stg_purchases')}}
        left join fk_ship
        on fk_ship.ship_id = ship_method_id
   ),

   purchasing_vendor as(
       select * 
       from purchasing
       left join fk_vendor
       on fk_vendor.vendor_id = purchasing.vendor_id_p
   ),

   purchasing_employee as(
       select * 
       from purchasing_vendor
       left join fk_employee
       on fk_employee.employee_id = purchasing_vendor.employee
   ),
   purchasing_purchasing as(
       select
           unit_price
           , order_qty
           , received_qty
           , rejected_qty
           , sk_due_date
           , due_date
           , purchase_status
           , sk_order_date
           , order_date
           , ship_date
           , sk_ship_date
           , product_id
           , purchase_detail_id
           , sk_ship
           , sk_vendor
           , sk_employee
       from purchasing_employee
   ),
   purchasing_final as(
       select * 
       from purchasing_purchasing
       left join fk_products
       on fk_products.productid = purchasing_purchasing.product_id
   ), 
   purchasing_final_select as(
    select
        unit_price
        , order_qty
        , received_qty
        , rejected_qty
        , sk_due_date
        , due_date
        , purchase_status
        , sk_order_date
        , order_date
        , sk_ship_date
        , ship_date
        , (unit_price*order_qty) as total_item
        , purchase_detail_id
        , sk_ship
        , sk_vendor
        , sk_employee
        , sk_product
    from purchasing_final)
select distinct *
from purchasing_final_select

