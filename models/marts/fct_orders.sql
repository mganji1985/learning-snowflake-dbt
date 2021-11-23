with orders as (
      select * from {{ ref ('stg_orders')}}
), 

 payment as (
     select * from {{ ref ('stg_payments')}}
),

fct_orders as (
    select 
         order_id, 
         customer_id, 
         amount 
    from orders
    join payment using (order_id)
)


select * from fct_orders 