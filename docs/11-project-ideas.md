# Project Ideas

[← Data engineering](10-data-engineering.md) · [Back to README](../README.md)

Projects turn disconnected tutorials into working knowledge. Keep the first project small enough to finish.

## 1. Public API → dataframe → chart

**Skills:** [Python](01-python.md), [APIs](06-apis.md), [Git](03-git.md), visualisation.

Fetch data from a public API, normalise the JSON into a dataframe, answer one question, and save a chart. Include retries/timeouts and document where the data came from.

**Stretch:** schedule it to collect a daily snapshot and discuss how you would avoid duplicate records.

## 2. SQL analysis notebook + reproducible script

**Skills:** [SQL](05-sql.md), [Python](01-python.md), [GitHub](04-github.md).

Load a public CSV into DuckDB. Write 8–10 SQL questions using filters, joins, window functions, and aggregations. Present the exploration in a notebook, then put the repeatable extraction/transformation into a script.

**Stretch:** write the cleaned data to Parquet and compare query speed/size with CSV.

## 3. Small prediction project

**Skills:** [Maths & statistics](09-maths-statistics.md), [ML model families](08-ml-model-families.md), Python, Git.

Pick a modest tabular classification or regression dataset. Build a simple baseline, then compare two or three model families using a proper held-out set or cross-validation.

Your README should explain the target, metric, leakage risks, limitations, and what errors matter.

**Stretch:** package an inference script in [Docker](07-docker.md).

## 4. Mini data pipeline

**Skills:** [APIs](06-apis.md), [data engineering](10-data-engineering.md), [SQL](05-sql.md), [Docker](07-docker.md).

Pipeline:

```text
API → raw JSON → cleaned Parquet → DuckDB → summary table
```

Make each stage rerunnable. Store timestamps and source metadata. Add basic checks for schema, nulls, and row counts.

**Stretch:** use an orchestrator only after the plain script is reliable.

## 5. Data quality investigation

**Skills:** statistics, SQL, Python.

Take a dataset with messy values. Create a quality report covering missingness, duplicate keys, invalid categories, numeric ranges, date gaps, and potential join-key problems. Do not immediately “clean” everything — distinguish between an error, an unknown value, and a legitimate unusual value.

## 6. Reproduce a published chart

**Skills:** data sourcing, Python/SQL, visualisation, communication.

Choose a chart from a reputable public report and reproduce it from the underlying data if available. Document every transformation and note any ambiguity.

This teaches a professional skill: tracing a visual result back to data and assumptions.

## What makes a useful portfolio project?

A strong project usually contains:

- a clear question;
- a small, understandable scope;
- reproducible setup instructions;
- source data attribution;
- code split into logical steps;
- sensible Git history;
- one or more tests/checks;
- a concise explanation of findings and limitations;
- no committed secrets or huge unnecessary data files.

A finished small project is more valuable for learning than five ambitious half-built platforms.
