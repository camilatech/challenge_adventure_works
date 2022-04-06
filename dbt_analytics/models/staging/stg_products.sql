with source_product as(
    select
        md5 ( concat (productid, makeflag) ) as sk_product
        , cast(productid as integer)
        , case
            when cast(makeflag as integer) = 0 then 'Purchased'
            when cast(makeflag as integer) = 1 then 'Manufactured'
            end as purchased
       , cast(modifieddate as date)
    from {{ source('production', 'product')}}
    )
select *
from source_product
