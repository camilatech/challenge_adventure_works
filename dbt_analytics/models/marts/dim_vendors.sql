with d_vendor as(
		select 
			vendor_company
			, credit_rating
			, preffered_vendor
			, vendor_active_used
			, modified_date
			, sk_vendor
		from {{ ref('stg_vendors') }}
)
select *
from d_vendor
