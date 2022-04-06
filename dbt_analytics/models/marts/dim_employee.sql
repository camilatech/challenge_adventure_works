with d_employee as(
    select
       md5 ( concat (firstname, lastname) ) as sk_employee
       , firstname
       , lastname
       , jobtitle
       , current_status
       , employee_id
       , modifieddate
   from {{ ref('stg_employee') }}
   )

select *
from d_employee
