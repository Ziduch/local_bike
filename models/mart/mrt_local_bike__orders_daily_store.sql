select
  date_trunc(o.order_date, day) as report_date,
  o.store_id,
  s.store_name,
  count(distinct o.order_id) as total_orders,
  sum(o.total_order_amount) as total_revenue,
  avg(o.total_order_amount) as avg_order_value,
  sum(o.total_items) as total_items,
  avg(o.total_distinct_products) as avg_distinct_products,
  avg(o.avg_discount) as avg_discount
from {{ ref('int_local_bike__order_summary') }} o
left join {{ ref('bronze_stores') }} s
  on o.store_id = s.store_id
group by 1,2,3