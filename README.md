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

## Résumé (FR)
Ce projet implémente un pipeline de données complet (ELT) avec dbt et BigQuery pour analyser l'agriculture mondiale.
Il croise trois sources majeures (FAO, Banque Mondiale, IFPRI) pour étudier la production, l'emploi et la R&D agricole par pays et par année.
L'architecture suit un modèle en couches (Staging → Gold/Mart) assurant qualité et traçabilité de la donnée.
Le modèle final `mart_agri_country_year` sert de table unique pour la visualisation et l'analyse.
Le projet inclut documentation, tests automatisés et gestion de dépendances via dbt.
