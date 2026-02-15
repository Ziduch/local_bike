select
  date_trunc(order_date, day) as report_date,
  store_id,
  count(distinct order_id) as total_orders,
  sum(total_order_amount) as total_revenue,
  avg(total_order_amount) as avg_order_value,
  sum(total_items) as total_items,
  avg(total_distinct_products) as avg_distinct_products,
  avg(avg_discount) as avg_discount
from {{ ref('int_local_bike__order_summary') }}
group by 1,2