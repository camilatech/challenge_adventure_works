with source_product as(
	select 
		cast(productid as integer) as productid
        , round(cast(unitprice as numeric),2) as unitprice
        , cast(modifieddate as date) as modifieddate
	from {{ source('analytics', 'purchaseorderdetail')}}
	)
select *
from source_product
