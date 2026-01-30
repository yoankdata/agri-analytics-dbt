select
  country_code,
  year,
  agri_rd_exp_total
from {{ ref('stg_asti_rd_exp') }}
