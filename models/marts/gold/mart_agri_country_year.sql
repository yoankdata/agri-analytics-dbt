select
  f.country_code,
  c.country_name,
  c.region,
  c.income_group,
  f.year,
  y.decade,

  f.agri_production_value,
  e.agri_employment_pct,
  r.agri_rd_exp_total
from {{ ref('fact_agri_production') }} f
left join {{ ref('dim_country') }} c using (country_code)
left join {{ ref('dim_year') }} y using (year)
left join {{ ref('metric_agri_employment') }} e
  using (country_code, year)
left join {{ ref('metric_asti_rd_exp') }} r
  using (country_code, year)
