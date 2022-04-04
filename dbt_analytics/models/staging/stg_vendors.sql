with source_vendor as(
		select 
			name as vendor_company
			, md5 ( concat (vendor.name, vendor.creditrating) ) as sk_vendor
			, case 
				when cast(creditrating as integer) = 1 then 'Superior'
				when cast(creditrating as integer) = 2 then 'Excellent'
				when cast(creditrating as integer) = 3 then 'Above average'
				when cast(creditrating as integer) = 4 then 'Average'
				when cast(creditrating as integer) = 5 then 'Below average'
			end as credit_rating
			, case 
				when cast(preferredvendorstatus as integer) = 0 then 'Preffered' 
				when cast(preferredvendorstatus as integer) = 1 then 'NotPreffered'
			end as preffered_vendor
			, case 
				when cast(activeflag as integer) = 0 then 'NotActive' 
				when cast(activeflag as integer) = 1 then 'Active'
			end as vendor_active_used
			, cast(modifieddate	as date) as modified_date
		from {{ source('analytics', 'vendor')}}
)
select *
from source_vendor
