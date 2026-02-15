select
  store_id,
  product_id,
  stock_quantity,
  units_sold,
  revenue,
  stock_sales_status,
  case
    when stock_quantity = 0 and units_sold > 0 then 1
    else 0
  end as is_stockout_flag
from {{ ref('int_local_bike__stock_vs_sales') }}