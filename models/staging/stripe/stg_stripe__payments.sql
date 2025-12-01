select 
    id as payment_id,
    orderid as order_id,
    amount as payment_amount,
    status as payment_status,
    paymentmethod as payment_method,
    created as payment_created

    from raw.stripe.payment