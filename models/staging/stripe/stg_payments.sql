with stg_payments  as (
    select
    id as payment_id, 
    orderid as order_id,
    status,
    {{cent_to_dollar('amount')}} as amount 
from  {{ source ('stripe', 'payment') }}
)

select * from stg_payments