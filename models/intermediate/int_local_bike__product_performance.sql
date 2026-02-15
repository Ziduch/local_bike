select
  product_id,
  sum(quantity) as total_units,
  sum(line_amount) as total_revenue
from {{ ref('int_local_bike__order_items_enriched') }}
group by product_id