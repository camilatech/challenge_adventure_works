with source_purchase_h as (
	select case 
		when cast(status as integer) = 1 then 'Pending'
		when cast(status as integer) = 2 then 'Approved'
		when cast(status as integer) = 3 then 'Rejected'
		when cast(status as integer) = 4 then 'Complete'
	end as purchase_status
	, round(cast(taxamt as numeric),2) as tax_amount
	, round(cast(subtotal as numeric),2) as subtotal
	, cast(vendorid as integer) as vendor_id
	, cast(employeeid as integer) as employee_id
	, cast(shipmethodid as integer) as ship_method_id
	, cast(orderdate as date) as order_date
	, cast(shipdate as date) as ship_date
	, cast(modifieddate	as date) as modified_date 
	from {{ source('analytics', 'purchaseorderheader')}}
)
select *
from source_purchase_h