select
  country_code,
  year,
  agri_production_value
from {{ ref('stg_fao_agri_production') }}
