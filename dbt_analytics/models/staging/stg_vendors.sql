with source_vendor as(
	select
		name
        , creditrating
        , preferredvendorstatus 
        , activeflag
        , modifieddate	
	from purchasing.vendor
)
select *
from source_vendor
