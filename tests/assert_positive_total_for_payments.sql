select
    order_id,
    sum(case when payment_status = 'success' then payment_amount end) as total_amount
from {{ ref('stg_stripe__payments') }}
group by 1
having sum(case when payment_status = 'success' then payment_amount end) < 0