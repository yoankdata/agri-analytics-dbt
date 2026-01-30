with src as (
  select
    upper(REF_AREA) as country_code,
    cast(TIME_PERIOD as int64) as year,
    cast(OBS_VALUE as float64) as agri_employment_pct,

    -- utile pour debug / traçabilité
    INDICATOR as indicator_code,
    INDICATOR_LABEL as indicator_label,
    UNIT_MEASURE as unit_measure
  from {{ source('agri_raw', 'worldbank_agri_employment') }}
)

select
  country_code,
  year,
  agri_employment_pct
from src
where indicator_code is not null
