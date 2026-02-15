select
  customer_id,
  customer_city,
  customer_state,
  total_orders,
  total_amount_spent,
  total_items,
  total_distinct_products,
  first_order_date,
  last_order_date,
  date_diff(current_date(), last_order_date, day) as days_since_last_order
from {{ ref('int_local_bike__customer_summary') }}