select *
from {{ ref('metric_agri_employment') }}
where agri_employment_pct < 0 or agri_employment_pct > 100
