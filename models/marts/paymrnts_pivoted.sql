select
orderid,
{% set payment_method=['credit_card', 'coupon', 'gift_card', 'bank_transfer' ] -%}
{%-   for method in payment_method -%} 
   sum ( case when paymentmethod='{{ method}}' then amount else 0 end ) as {{ method}}_amount 
   {%- if not loop.last -%}
      ,
   {% endif %}
 {% endfor%}
 from  stripe.payment

 group by 1