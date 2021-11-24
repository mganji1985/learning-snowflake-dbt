with stg_payments  as (
    select
    id as payment_id, 
    orderid as order_id,
    status,
    amount/100 as amount 
from  {{ source ('stripe', 'payment') }}
)

select * from stg_payments