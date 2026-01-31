from prefect import flow, task, get_run_logger
import subprocess

@task(retries=2, retry_delay_seconds=30)
def run_cmd(cmd: str):
    logger = get_run_logger()
    logger.info(f"Running: {cmd}")
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        logger.error(result.stdout)
        logger.error(result.stderr)
        raise RuntimeError(f"Command failed: {cmd}")
    logger.info(result.stdout)
    return result.stdout

@flow(name="agri-analytics-pipeline")
def agri_pipeline(
    dbt_select: str = "",          # ex: "mart_agri_country_year"
    dbt_exclude: str = "",         # ex: "stg_fao_agri_production"
    seed_select: str = "dim_country map_m49_iso3"
):
    sel = f"--select {dbt_select}" if dbt_select else ""
    exc = f"--exclude {dbt_exclude}" if dbt_exclude else ""

    run_cmd(f"dbt seed --select {seed_select}")
    run_cmd(f"dbt run {sel} {exc}".strip())
    run_cmd(f"dbt test {sel} {exc}".strip())

if __name__ == "__main__":
    agri_pipeline()
