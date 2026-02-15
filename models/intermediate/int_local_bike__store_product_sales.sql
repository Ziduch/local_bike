select
  o.store_id,
  i.product_id,
  sum(i.quantity) as units_sold,
  sum(i.line_amount) as revenue
from {{ ref('bronze_orders') }} o
join {{ ref('int_local_bike__order_items_enriched') }} i
  on i.order_id = o.order_id
group by 1,2