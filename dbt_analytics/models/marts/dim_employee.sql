with d_employee as(
    select
       sk_employee
       , full_name
       , jobtitle
       , current_status
       , employee_id
   from {{ ref('stg_employee') }}
   )
select *
from d_employee
