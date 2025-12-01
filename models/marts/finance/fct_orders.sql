with orders as (
    select * from {{  ref('stg_jaffle_shop__orders')  }}
),

payments as (
    select * from {{  ref('stg_stripe__payments')  }}
),


payments_totals as (
    select 
        order_id,
        sum(payment_amount) as payment_total_amount
    from payments
    where payment_status = 'success'
    group by order_id
    
),


final as ( 
    select 
        orders.order_id,
        orders.customer_id,
        payments_totals.payment_total_amount
    from orders
    left join payments_totals using (order_id)

)

select * from final