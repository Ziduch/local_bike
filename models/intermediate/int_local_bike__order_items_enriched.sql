with oi as (
  select
    order_item_id,
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    coalesce(discount, 0) as discount
  from {{ ref('bronze_order_items') }}
),

p as (
  select
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price as product_list_price
  from {{ ref('bronze_products') }}
)

select
  oi.order_item_id,
  oi.order_id,
  oi.item_id,
  oi.product_id,
  p.product_name,
  p.brand_id,
  p.category_id,
  p.model_year,
  oi.quantity,
  oi.list_price,
  oi.discount,
  -- CA ligne
  (oi.quantity * oi.list_price * (1 - oi.discount)) as line_amount
from oi
left join p
  on oi.product_id = p.product_id
