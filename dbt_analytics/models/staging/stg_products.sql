with source_product as(
	select 
		cast(productid as integer) as productid
		, md5 ( concat (purchaseorderdetail.productid, purchaseorderdetail.unitprice) ) as sk_product
        , round(cast(unitprice as numeric),2) as unitprice
        , cast(modifieddate as date) as modifieddate
	from {{ source('purchasing', 'purchaseorderdetail')}}
	)
select *
from source_product
