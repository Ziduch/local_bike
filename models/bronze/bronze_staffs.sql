select
    cast(staff_id as int64) as staff_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    lower(trim(email)) as email,
    trim(phone) as phone,
    cast(active as int64) as active,
    cast(store_id as int64) as store_id,
-- on met null si on arrive pas à cast
    safe_cast(manager_id as int64) as manager_id
from {{ source('local_bike', 'staffs') }}