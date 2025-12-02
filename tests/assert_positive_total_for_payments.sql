select
    order_id,
    sum(payment_amount) as order_total
from
    {{ ref('stg_stripe__payments')}}
group by 1
having order_total < 0