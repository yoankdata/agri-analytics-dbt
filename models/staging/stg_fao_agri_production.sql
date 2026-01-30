with src as (
  select
    Area as area_name,
    cast(Year as int64) as year,
    cast(Value as float64) as agri_production_value,
    Item as item,
    Element as element,
    Unit as unit
  from {{ source('agri_raw', 'fao_agri_production') }}
  where Value is not null
    and Item is not null
    and Element is not null
),

mapped as (
  select
    c.country_code,
    s.year,
    s.agri_production_value
  from src s
  left join {{ ref('dim_country') }} c
    on lower(c.country_name) = lower(s.area_name)
  where s.item = 'Maize (corn)'        -- Ajusté selon les données réelles
    and s.element = 'Production'
)

select
  country_code,
  year,
  agri_production_value
from mapped
where country_code is not null
