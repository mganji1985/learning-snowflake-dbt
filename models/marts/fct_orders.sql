with orders as (
      select * from {{ ref ('stg_orders')}}
), 

 payment as (
     select * from {{ ref ('stg_payments')}}
),

payment_order as (
    select 
         order_id, 
         sum (case when payment.status='success' then amount end ) as amount
    from payment 
    group by 1
), 

final as (
    select 
        orders.customer_id, 
        orders.order_id, 
        coalesce(payment_order.amount, 0) as amount 
    from orders
    left join payment_order using (order_id)
)
select * from final 