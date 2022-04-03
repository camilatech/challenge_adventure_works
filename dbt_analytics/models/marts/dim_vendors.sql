with d_vendor as(
		select 
        vendor_company
		, credit_rating
		, preffered_vendor
		, vendor_active_used
		, modifieddate
	from {{ ref('stg_vendors') }}
)
select *
from d_vendor