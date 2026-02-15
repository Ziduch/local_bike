select
  product_id,
  total_units,
  total_revenue,
  dense_rank() over(order by total_revenue desc) as revenue_rank,
  dense_rank() over(order by total_units desc) as units_rank
from {{ ref('int_local_bike__product_performance') }}