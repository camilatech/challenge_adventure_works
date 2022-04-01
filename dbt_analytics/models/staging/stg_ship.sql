with shipping as (
    select
        shipmethod.name
        , shipmethod.shipbase
        , shipmethod.shiprate
        , shipmethod.shipmethodid
        from purchasing.shipmethod
)
select *
from shipping