select
  date_trunc(order_date, month) as report_month,
  o.store_id,
  s.store_name,
  count(distinct order_id) as total_orders,
  sum(total_order_amount) as total_revenue,
  avg(total_order_amount) as avg_order_value
from {{ ref('int_local_bike__order_summary') }} o
left join {{ ref('bronze_stores') }} s
  on o.store_id = s.store_id
group by 1,2,3