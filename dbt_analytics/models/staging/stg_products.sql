with source_product as(
    select
        md5 ( concat (productid, makeflag) ) as sk_product
        , cast(productid as integer) as productid
        , case
            when cast(makeflag as integer) = 0 then 'Purchased'
            when cast(makeflag as integer) = 1 then 'Manufactured'
            end as purchased
       , cast(modifieddate as timestamp) as modifieddate
    from {{ source('dw_purchasing', 'product')}}
    )
select *
from source_product
