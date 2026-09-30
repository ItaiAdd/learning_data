# Data Engineering Foundations

[← Maths & statistics](09-maths-statistics.md) · [Back to README](../README.md) · [Next: Project ideas →](11-project-ideas.md)

## What is data engineering?

Data engineering is the practice of building systems that collect, store, transform, validate, and deliver data reliably. Data scientists and analysts often focus on using data; data engineers spend more time making trustworthy data available in the first place.

A small pipeline might be:

```text
API → raw JSON → cleaned Parquet → SQL transformations → analytics table
```

A large organisation may perform the same conceptual steps across distributed storage, cloud warehouses, streaming systems, schedulers, catalogues, and hundreds of datasets.

## ETL and ELT

- **ETL:** Extract → Transform → Load. Transform before loading into the main analytical destination.
- **ELT:** Extract → Load → Transform. Load raw/near-raw data first, then transform inside a warehouse/lakehouse.

Modern cloud analytics often uses ELT because scalable warehouses can perform transformations efficiently, but both patterns remain useful.

## Batch versus streaming

**Batch processing** handles bounded groups of data: every hour, every day, or on demand.

**Streaming** processes events continuously or in very small windows. Streaming introduces concepts such as event time, late data, ordering, checkpoints, offsets, and delivery guarantees.

Do not choose streaming because it sounds more advanced. If a daily batch meets the requirement, it is usually simpler to build and operate.

## Data formats

### CSV

Human-readable and universal, but weak on types/schema, quoting edge cases, nested data, and efficient analytical scanning.

### JSON

Excellent for nested API/event payloads, but verbose for large analytical datasets.

### Parquet

[Apache Parquet](https://parquet.apache.org/docs/overview/) is a column-oriented format designed for efficient storage and retrieval. Analytical queries often read only selected columns, so columnar storage can reduce I/O substantially. Parquet also supports compression and richer types than CSV.

## Databases, warehouses, lakes, and lakehouses

These labels overlap and vendors use them differently, but a useful first approximation is:

- **Operational database:** optimised for application reads/writes and transactions.
- **Data warehouse:** optimised for analytical SQL over large structured datasets.
- **Data lake:** object/file storage holding large amounts of raw/processed data in formats such as Parquet.
- **Lakehouse:** architecture/tooling intended to combine flexible file-based storage with warehouse-like management and transactions.

Focus on workload and guarantees rather than memorising marketing categories.

## Local analytical engine: DuckDB

[DuckDB](https://duckdb.org/docs/stable/clients/python/overview) is extremely useful for students because it can run analytical SQL locally and directly query CSV, JSON, pandas/Polars dataframes, and Parquet files.

```python
import duckdb

duckdb.sql("SELECT * FROM 'data/*.parquet' LIMIT 10").show()
```

It is a good bridge between [Python](01-python.md), [SQL](05-sql.md), and file-based data engineering.

## Transformation and data modelling: dbt

[dbt](https://docs.getdbt.com/docs/introduction) lets teams express transformations as modular SQL models and adds dependency graphs, tests, documentation, and lineage. This style is often called **analytics engineering**.

Even if you never use dbt professionally, learning to make transformations modular, tested, documented, and reviewable is valuable.

## Orchestration

An **orchestrator** schedules tasks and manages dependencies, retries, state, and observability. Apache Airflow represents workflows as DAGs (directed acyclic graphs): tasks connected by dependencies without cycles. See [Airflow core concepts](https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/).

Orchestration is not the same as transformation. “Run task B after A succeeds” is different from “convert these raw rows into this clean table.”

## Distributed processing: Spark

Apache Spark distributes computation across multiple machines and is widely used for large-scale batch processing, SQL, and streaming. PySpark exposes Spark through Python. The [PySpark DataFrame quickstart](https://spark.apache.org/docs/latest/api/python/getting_started/quickstart_connect.html) shows the familiar table/dataframe interface.

Do not begin with Spark if your data fits comfortably on one machine. Learning on smaller local tools makes the distributed concepts easier to appreciate later.

## Reliability concepts

### Idempotency

An operation is **idempotent** if running it repeatedly has the same intended end state as running it once. Pipelines that can safely retry are much easier to operate.

### Data quality tests

Examples:

- primary keys are unique;
- important columns are not null;
- values stay inside expected ranges;
- foreign keys match known records;
- row counts do not unexpectedly collapse/explode;
- freshness remains within a service expectation.

### Observability

You need to know whether a pipeline ran, how long it took, what failed, and whether the data itself is healthy. Logs, metrics, lineage, alerts, and data-quality checks are all part of this.

### Backfills

A **backfill** reruns logic for historical periods, often after a bug fix or new transformation is introduced. Pipelines designed only for “today” become painful when you need to recompute six months.

## A sensible learning stack

You do not need a cloud account to learn the ideas. A local path can be:

1. call an API with Python;
2. write raw JSON/CSV;
3. convert to Parquet with pandas/Polars;
4. query it with DuckDB SQL;
5. put everything under Git;
6. containerise the pipeline with Docker;
7. only then explore orchestration, warehouses, Spark, dbt, or streaming.

## Resources by level

**Beginner / end-to-end**

- [Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp) — free project-based course covering containers, warehousing, transformation, batch processing, streaming, and a final project. The repository links the current video lectures.
- [DataTalks.Club course docs](https://datatalksclub.github.io/docs/courses/data-engineering-zoomcamp/) — structured course navigation and prerequisites.

**Focused tools**

- [Apache Parquet overview](https://parquet.apache.org/docs/overview/) — why columnar files matter.
- [DuckDB Python API](https://duckdb.org/docs/stable/clients/python/overview) — local SQL over files/dataframes.
- [dbt quickstarts](https://docs.getdbt.com/docs/get-started-dbt) — modular SQL transformations and analytics engineering.
- [Airflow core concepts](https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/) — DAGs, tasks, runs, scheduling, and orchestration.
- [PySpark documentation](https://spark.apache.org/docs/latest/api/python/) — distributed dataframe processing.

## Practice checkpoint

Build a tiny batch pipeline: fetch public API data, store the raw response, transform it into Parquet, query a summary with DuckDB, and write the result to a separate output file. Make the pipeline safe to run twice without corrupting the result. Then document the data flow in the README.
