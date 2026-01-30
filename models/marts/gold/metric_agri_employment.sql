select
  country_code,
  year,
  agri_employment_pct
from {{ ref('stg_worldbank_agri_employment') }}
