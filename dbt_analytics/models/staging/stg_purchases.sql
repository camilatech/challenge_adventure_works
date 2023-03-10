
with source_purchase_h as (
    select 
      case
         when cast(status as integer) = 1 then 'Pending'
         when cast(status as integer) = 2 then 'Approved'
         when cast(status as integer) = 3 then 'Rejected'
         when cast(status as integer) = 4 then 'Complete'
      end as purchase_status
      , round(cast(taxamt as numeric),2) as tax_amount
      , round(cast(subtotal as numeric),2) as subtotal
      , cast(vendorid as integer) as vendor_id_p
      , cast(employeeid as integer) as employee_id
      , cast(shipmethodid as integer) as ship_method_id
      , cast(orderdate as timestamp) as order_date_full
      , cast(cast(orderdate as timestamp)as date) as order_date
      , cast(shipdate as timestamp) as ship_date_full
      , cast(cast(shipdate as timestamp) as date) as ship_date
      , cast(modifieddate as timestamp) as modified_date
      , cast(purchaseorderid as integer) as purchase_o_id
      , {{ dbt_utils.surrogate_key([
         'orderdate'
         ]) }} as sk_order_date
      , {{ dbt_utils.surrogate_key([
         'shipdate'
         ]) }} as sk_ship_date
   from {{ source('dw_purchasing', 'purchaseorderheader')}}
) , 
   source_purchase_o as (
      select 
         round(cast(unitprice as numeric),2) as unit_price
         , cast(orderqty as integer) as order_qty
         , cast(receivedqty as integer) as received_qty
         , cast(rejectedqty as integer) as rejected_qty
         , cast(purchaseorderid as integer) as purchase_id
         , cast(purchaseorderid as integer) as purchase_detail_id
         , cast(productid as integer) as product_id
         , round(cast((unitprice*orderqty) as numeric),2) as total_item
      from {{ source('dw_purchasing', 'purchaseorderdetail')}}
   ) , 
   source_purchase_joined as (
      select *
      from source_purchase_o
      left join source_purchase_h
      on source_purchase_h.purchase_o_id = source_purchase_o.purchase_detail_id
      )
select *
from source_purchase_joined
