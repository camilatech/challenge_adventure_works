with source_product as(
	select 
		cast(productid as integer),
		round(cast(unitprice as numeric),2) as unitprice,
		modifieddate 
	from purchasing.purchaseorderdetail
	)
select *
from source_product
