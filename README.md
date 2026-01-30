# Agri Analytics (BigQuery + dbt)

## Objective
Build a reproducible analytics pipeline (raw → staging → gold → mart) to analyze:
- Agricultural production (FAO)
- Agricultural employment share (World Bank)
- Agricultural R&D expenditure (IFPRI/ASTI)

## Tech Stack
- BigQuery (EU)
- dbt-core + dbt-bigquery
- Seeds for small reference dimensions

## Data Model (Star Schema)
**Dimensions**
- `dim_country` (seed)
- `dim_year`

**Facts / Metrics**
- `fact_agri_production` (FAO production)
- `metric_agri_employment` (World Bank employment %)
- `metric_asti_rd_exp` (ASTI R&D expenditure)

**Mart**
- `mart_agri_country_year` (country-year grain, enriched metrics)

## Key Grain
All Gold tables are at `(country_code, year)`.

## Run Locally
```bash
dbt debug
dbt seed
dbt run
dbt test
dbt docs generate
dbt docs serve
```
