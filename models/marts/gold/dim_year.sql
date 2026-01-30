select distinct
  year,
  cast(floor(year/10) as int64)*10 as decade
from {{ ref('stg_worldbank_agri_employment') }}
where year is not null
