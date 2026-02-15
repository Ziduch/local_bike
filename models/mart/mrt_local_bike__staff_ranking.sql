select
  staff_id,
  total_orders,
  total_sales,
  safe_divide(total_sales, nullif(total_orders, 0)) as avg_order_value,
  dense_rank() over(order by total_sales desc) as sales_rank
from {{ ref('int_local_bike__staff_performance') }}