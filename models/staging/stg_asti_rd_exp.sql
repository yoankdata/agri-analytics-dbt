select
  upper(REF_AREA) as country_code,
  cast(TIME_PERIOD as int64) as year,
  cast(OBS_VALUE as float64) as agri_rd_exp_total
from {{ source('agri_raw', 'asti_rd_exp') }}
where
  FREQ = 'A'
  and SEX = '_T'
  and OBS_VALUE is not null
