with source_employee as(
    select
        jobtitle
        , case
            when cast(currentflag as integer) = 0 then 'Inactive'
            when cast(currentflag as integer) = 1 then 'Active'
           end as current_status
       , businessentityid as employee_id
       , cast(modifieddate as timestamp)
    from {{ source('humanresources', 'employee')}}
    ),
   source_person as(
    select
        lastname
       , firstname
       , businessentityid as id_person
    from {{ source('person', 'person')}}
    ),
   source_purchase_employee as(
   select
       employeeid
       , purchaseorderid
   from {{ source('purchasing', 'purchaseorderheader')}}
   ),
   employee_person as (
   select * from source_employee
   left join source_person
   on source_person.id_person = source_employee.employee_id
   )
   select
       md5 ( concat (firstname, lastname) ) as sk_employee
       , firstname
       , lastname
       , jobtitle
       , current_status
       , employee_id
       , modifieddate
   from employee_person