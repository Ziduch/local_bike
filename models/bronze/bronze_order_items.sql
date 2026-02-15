select
--creation d'une clef 
    concat(cast(order_id as string), '_', cast(item_id as string)) as order_item_id,
    cast(order_id as int64) as order_id,
    cast(item_id as int64) as item_id,
    cast(product_id as int64) as product_id,
    cast(quantity as int64) as quantity,
--on cast les prix et réduction en numériques 
    cast(list_price as numeric) as list_price,
    cast(discount as numeric) as discount
from {{ source('local_bike', 'order_items') }}