with d_product as(
    select
       sk_product
       , productid
       , purchased
       , product_name
   from {{ ref('stg_products') }}
   )
select *
   from d_product

