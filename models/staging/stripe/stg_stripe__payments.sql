select 
    id as payment_id,
    orderid as order_id,
    amount / 100 as payment_amount,
    status as payment_status,
    paymentmethod as payment_method,
    created as payment_created_at,
    _batched_at

    from {{source('stripe','payment')}}