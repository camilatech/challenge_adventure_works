with d_vendor as(
	select 
		company_name
		, credit_rating
		, preffered_vendor
		, vendor_active_used
		, sk_vendor
	from {{ ref('stg_vendors') }}
)
select *
from d_vendor
