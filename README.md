# Data Science & Engineering: A Student Learning Guide

A practical map of the tools and ideas that show up repeatedly in data science, analytics, machine learning, and data engineering.

This repository is aimed at university students with a wide range of programming and mathematical backgrounds. It is **not** meant to replace a course or a textbook. Each guide explains what a topic is, why you are likely to care about it in data work, gives you a small amount of hands-on practice, and then points you towards stronger resources at different levels.

> **Tooling choice:** this guide deliberately avoids Conda-based Python tooling. It uses `pyenv`, Python's built-in `venv` + `pip`, and especially [`uv`](https://docs.astral.sh/uv/) instead.
>
> **Last link review:** 30 September 2026.

## How to use this repository

You do not need to read everything in order. If you are new to programming, start with the [learning paths](docs/00-learning-paths.md) and then work through Python, Bash, Git, and SQL. If you already write code comfortably, jump to the topics that are unfamiliar and use the project ideas to connect them.

A useful rule is **learn just enough to build something, then return for depth when the project gives you a reason**.

## Guides

| Guide | What it helps you do |
|---|---|
| [Learning paths](docs/00-learning-paths.md) | Choose a route based on your current experience and goals. |
| [Python](docs/01-python.md) | Write data-focused Python, manage versions/environments, install packages, and run programs. |
| [Bash & the command line](docs/02-bash.md) | Navigate files, combine command-line tools, automate repetitive work, and become comfortable on remote machines. |
| [Git](docs/03-git.md) | Track changes, branch safely, collaborate, and recover earlier versions of your work. |
| [GitHub](docs/04-github.md) | Host Git repositories, use pull requests and issues, and present projects publicly. |
| [SQL](docs/05-sql.md) | Query relational data, join tables, aggregate results, and reason about structured datasets. |
| [API basics](docs/06-apis.md) | Understand HTTP APIs, JSON, REST-style endpoints, and alternatives such as GraphQL and gRPC. |
| [Docker](docs/07-docker.md) | Package code and dependencies into reproducible containers. |
| [Machine-learning model families](docs/08-ml-model-families.md) | Recognise common supervised and unsupervised model families and know when to explore each. |
| [Maths & statistics foundations](docs/09-maths-statistics.md) | Identify the mathematical ideas that make data analysis and ML easier to understand. |
| [Data engineering foundations](docs/10-data-engineering.md) | Understand pipelines, file formats, warehouses, orchestration, batch/stream processing, and transformation tooling. |
| [Project ideas](docs/11-project-ideas.md) | Turn the individual skills into portfolio-sized projects. |
| [Glossary](docs/glossary.md) | Look up common jargon used throughout the guides. |

## Suggested first milestone

Try to reach the point where you can:

1. create a small Python project with `uv`;
2. read a CSV or API response into a dataframe;
3. answer a question with Python or SQL;
4. commit the work with Git on a feature branch;
5. push it to GitHub with a clear README; and
6. optionally run it in Docker.

That combination already resembles a surprisingly large amount of real entry-level data work.

## Included examples

The [`examples/`](examples/) directory contains intentionally small examples referenced by the guides:

- [`examples/python/hello_data.py`](examples/python/hello_data.py)
- [`examples/api/fetch_post.py`](examples/api/fetch_post.py)
- [`examples/docker/`](examples/docker/)
- [`examples/sql/student_scores.sql`](examples/sql/student_scores.sql)
- [`examples/bash/summarise.sh`](examples/bash/summarise.sh)

## Principles behind the guide

- **Concepts before brands.** Tools change; ideas such as version control, tabular data, joins, APIs, reproducibility, and validation last longer.
- **Small examples before frameworks.** The first example should be runnable and understandable without a large setup.
- **Use official documentation as a reference, not always as the first teacher.** Documentation is often excellent once you know the vocabulary.
- **Build things.** Tutorials feel productive, but projects reveal what you actually understand.
- **Be sceptical of results.** Data can be incomplete, biased, stale, incorrectly joined, or interpreted beyond what it supports.

## Contributing

Corrections, new resources, accessibility improvements, and additional examples are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).
