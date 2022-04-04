with d_product as(
	select 
		productid
        , unitprice
        , modifieddate
	from {{ ref('stg_products') }}
	)
select *
from d_product