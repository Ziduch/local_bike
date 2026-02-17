select
  pp.product_id,
  p.product_name,
  pp.total_units,
  pp.total_revenue,
  dense_rank() over(order by pp.total_revenue desc) as revenue_rank,
  dense_rank() over(order by pp.total_units desc) as units_rank
from {{ ref('int_local_bike__product_performance') }} pp
-- jointure pas très propre j'avais oublié de prendre les noms des champs pour la viz 
left join {{ ref('bronze_products') }} p
  on pp.product_id = p.product_id