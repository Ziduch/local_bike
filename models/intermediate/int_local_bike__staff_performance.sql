select
  staff_id,
  count(distinct order_id) as total_orders,
  sum(total_order_amount) as total_sales
from {{ ref('int_local_bike__order_summary') }}
group by staff_id