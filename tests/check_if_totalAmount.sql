-- check if total amount of of customer fact is 1672 

select 
       sum(lifetime_value) as total_amount 
    from {{ ref('dim_customers') }}
    having not (total_amount=1672)
