with orders as (
  select *
  from {{ ref('int_local_bike__order_summary') }}
)

select
  c.customer_id,
  c.city as customer_city,
  c.state as customer_state,
  count(distinct o.order_id) as total_orders,
  sum(o.total_order_amount) as total_amount_spent,
  sum(o.total_items) as total_items,
  sum(o.total_distinct_products) as total_distinct_products,
  min(o.order_date) as first_order_date,
  max(o.order_date) as last_order_date
from {{ ref('bronze_customers') }} c
left join orders o
  on o.customer_id = c.customer_id
group by 1,2,3
