with source_purchase_o as (
	select round(cast(unitprice as numeric),2) as unit_price
	, cast(orderqty as integer) as order_qty
	, cast(receivedqty as integer) as received_qty
	, cast(rejectedqty as integer) as rejected_qty
	, cast(purchaseorderid as integer) as purchase_id
	, cast(purchaseorderdetailid as integer) as purchase_detail_id
	, cast(duedate	as date) as due_date 
	, cast(modifieddate	as date) as modified_date 
	from {{ source('analytics', 'purchaseorderdetail')}}
)
select *
from source_purchase_o
