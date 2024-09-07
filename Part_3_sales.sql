with order_details as (
    select
        order_id,
        quantity,
        price
    from {{ source('raw', 'raw_order_details') }}
),
order_totals as (
    select
        order_id,
        sum(quantity * price) as total_amount
    from order_details
    group by order_id
),
customer_orders as (
    select
        o.customer_id,
        ot.total_amount
    from {{ source('raw', 'raw_orders') }} o
    join order_totals ot
    on o.order_id = ot.order_id
)

select
    c.customer_id,
    name,
    sum(co.total_amount) as total_sales
from customer_orders co
join {{ ref('Part_3_raw_costumer') }} c
on co.customer_id = c.customer_id
group by c.customer_id, name

