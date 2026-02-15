with sales as (
  select *
  from {{ ref('int_local_bike__store_product_sales') }}
),
stock as (
  select
    store_id,
    product_id,
    quantity as stock_quantity
  from {{ ref('bronze_stocks') }}
)

select
  coalesce(s.store_id, st.store_id) as store_id,
  coalesce(s.product_id, st.product_id) as product_id,
  coalesce(st.stock_quantity, 0) as stock_quantity,
  coalesce(s.units_sold, 0) as units_sold,
  coalesce(s.revenue, 0) as revenue,
  case
    when coalesce(st.stock_quantity, 0) = 0 and coalesce(s.units_sold, 0) > 0 then 'OUT_OF_STOCK'
    when coalesce(st.stock_quantity, 0) > 0 and coalesce(s.units_sold, 0) = 0 then 'NO_SALES'
    else 'OK'
  end as stock_sales_status
from sales s
full outer join stock st
  on s.store_id = st.store_id
 and s.product_id = st.product_id
