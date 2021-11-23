with stg_payments  as (
    select
    id as order_id, 
    amount
from  stripe.payment where status='success'
)

select * from stg_payments