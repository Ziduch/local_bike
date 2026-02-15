select
--on sécurise le type 
    cast(brand_id as int64) as brand_id,
--on retire les espaces parasites
    trim(brand_name) as brand_name
from {{ source('local_bike', 'brands') }}
