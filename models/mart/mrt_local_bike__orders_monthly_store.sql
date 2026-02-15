select
  date_trunc(order_date, month) as report_month,
  store_id,
  count(distinct order_id) as total_orders,
  sum(total_order_amount) as total_revenue,
  avg(total_order_amount) as avg_order_value
from {{ ref('int_local_bike__order_summary') }}
group by 1,2