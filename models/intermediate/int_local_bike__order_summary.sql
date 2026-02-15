with items as (
  select
    order_id,
    sum(line_amount) as total_order_amount,
    sum(quantity) as total_items,
    count(distinct product_id) as total_distinct_products,
    avg(discount) as avg_discount
  from {{ ref('int_local_bike__order_items_enriched') }}
  group by order_id
)

select
  o.order_id,
  o.customer_id,
  o.store_id,
  o.staff_id,
  o.order_status,
  o.order_date,
  o.required_date,
  o.shipped_date,
  coalesce(i.total_order_amount, 0) as total_order_amount,
  coalesce(i.total_items, 0) as total_items,
  coalesce(i.total_distinct_products, 0) as total_distinct_products,
  coalesce(i.avg_discount, 0) as avg_discount
from {{ ref('bronze_orders') }} o
left join items i
  on o.order_id = i.order_id