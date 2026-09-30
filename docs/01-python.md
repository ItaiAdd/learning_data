# Python for Data Work

[← Back to the main README](../README.md) · [Next: Bash →](02-bash.md)

## What is Python, and why is it so common in data work?

Python is a general-purpose programming language with a large ecosystem of libraries for data manipulation, visualisation, statistics, machine learning, automation, APIs, and engineering. Its syntax is comparatively readable, which makes it useful for teams containing people with different programming backgrounds.

For data work, Python is especially useful as **glue**: one program can read files, call an API, clean data, train a model, create a plot, and write the result to a database.

The official [Python tutorial](https://docs.python.org/3/tutorial/) is a strong reference, although it assumes some previous programming experience.

## Installing and managing Python without Conda

This repository does not use Conda-based tools. Two good approaches are:

### Option 1: `pyenv` for Python versions + `uv` for projects

[`pyenv`](https://github.com/pyenv/pyenv) lets you install multiple Python versions and choose one globally or per project. It is particularly convenient on macOS and Linux. Follow the project's platform-specific installation instructions first; on macOS, Homebrew users can install it with `brew install pyenv`, while Linux users should also install the build dependencies listed by pyenv before compiling Python versions.

Typical workflow after installation:

```bash
pyenv install 3.14
pyenv local 3.14
python --version
```

`pyenv` does not natively manage Windows Python installations. On Windows, a cross-platform alternative is to let [`uv`](https://docs.astral.sh/uv/guides/install-python/) manage Python versions.

### Option 2: let `uv` manage Python too

`uv` can install Python, create projects, create isolated environments, resolve dependencies, and run commands. Install it using the current platform instructions in the [`uv` installation guide](https://docs.astral.sh/uv/getting-started/installation/), then try:

```bash
uv python install 3.14
uv init my-data-project
cd my-data-project
uv add pandas requests
uv run python main.py
```

For new student projects, this is often the simplest path.

## Environments: keeping projects separate

A **virtual environment** is an isolated Python installation for one project. It prevents project A from accidentally depending on packages installed for project B.

Using the standard library:

```bash
python -m venv .venv
source .venv/bin/activate      # macOS/Linux
# .venv\Scripts\activate      # Windows PowerShell/cmd environments differ slightly
python -m pip install pandas
```

The Python Packaging guide has a fuller explanation of [`venv` + `pip`](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/).

Using `uv`, project environments are handled for you when you use commands such as `uv add`, `uv sync`, and `uv run`.

## Packages and package managers

A **package** is reusable Python code distributed so that other projects can install it. [PyPI](https://pypi.org/) is the main public package index used by Python tooling.

### `pip`

[`pip`](https://pip.pypa.io/en/stable/user_guide/) is Python's reference package installer. A reliable habit is to run it through the interpreter you intend to use:

```bash
python -m pip install requests
```

This reduces confusion when several Python versions are installed.

### `uv`

[`uv`](https://docs.astral.sh/uv/) is a modern Python project and package manager. It can manage dependencies in `pyproject.toml`, create a lock file, run commands inside the project environment, and install Python versions.

Useful commands:

```bash
uv init                   # start a project
uv add pandas matplotlib  # add dependencies
uv remove matplotlib      # remove a dependency
uv sync                   # make the environment match the project files
uv run python main.py      # run inside the project environment
```

For a new project, prefer recording dependencies in project metadata instead of repeatedly installing ad-hoc packages into a global Python installation.

## A first data-flavoured Python program

This program stores a few measurements, calculates their average, and prints a short report:

```python
scores = [68, 74, 81, 79, 90]
average = sum(scores) / len(scores)

print(f"Number of scores: {len(scores)}")
print(f"Average score: {average:.1f}")
print(f"Highest score: {max(scores)}")
```

The same example is included as [`examples/python/hello_data.py`](../examples/python/hello_data.py).

Run it from your terminal:

```bash
python examples/python/hello_data.py
```

Or, from a `uv` project:

```bash
uv run python examples/python/hello_data.py
```

The important idea is that a `.py` file is just a text file containing Python code. The `python` command starts the Python interpreter and asks it to execute that file.

## Libraries you will see often

| Library / module | What it is useful for | Start here |
|---|---|---|
| [NumPy](https://numpy.org/doc/stable/user/absolute_beginners.html) | Fast numerical arrays, vectorised calculations, linear algebra, and the foundation under much of the scientific Python ecosystem. | Absolute beginner guide |
| [pandas](https://pandas.pydata.org/docs/getting_started/) | Tabular data using `DataFrame`s; cleaning, joining, reshaping, CSV/Excel/SQL I/O. | Getting started |
| [Polars](https://docs.pola.rs/user-guide/getting-started/) | Fast dataframe library with an expression-oriented API and strong lazy-query support. | Getting started |
| [scikit-learn](https://scikit-learn.org/stable/) | Classical machine learning: preprocessing, regression, classification, clustering, model evaluation, pipelines. | User guide + examples |
| [Matplotlib](https://matplotlib.org/stable/users/explain/quick_start.html) | Foundational plotting library for static charts and highly customised visualisation. | Quick start |
| [Plotly](https://plotly.com/python/getting-started/) | Interactive, web-friendly charts and dashboards. | Getting started |
| [Requests](https://requests.readthedocs.io/en/latest/user/quickstart/) | Friendly HTTP client for calling web APIs. | Quickstart |
| [Jupyter](https://docs.jupyter.org/en/stable/start/) | Interactive notebooks combining executable code, output, charts, and Markdown. | Try Jupyter / installation |
| [`pathlib`](https://docs.python.org/3/library/pathlib.html) | Cross-platform file and directory paths. | Python standard library |
| [`json`](https://docs.python.org/3/library/json.html) | Read and write JSON data, common in APIs. | Python standard library |
| [`csv`](https://docs.python.org/3/library/csv.html) | Read and write CSV files without an external dependency. | Python standard library |
| [`datetime`](https://docs.python.org/3/library/datetime.html) | Work with dates and times. | Python standard library |
| [`collections`](https://docs.python.org/3/library/collections.html) | Useful specialised containers such as `Counter` and `defaultdict`. | Python standard library |
| [`itertools`](https://docs.python.org/3/library/itertools.html) | Efficient building blocks for iteration and combinations. | Python standard library |
| [`subprocess`](https://docs.python.org/3/library/subprocess.html) | Run external programs from Python when command-line integration is appropriate. | Python standard library |

## pandas or Polars?

Both are useful. pandas has an enormous ecosystem and appears in a great deal of existing code and teaching material. Polars is increasingly common for high-performance dataframe workloads and encourages a query/expression style that transfers well to data engineering. Learn one well enough to think in rows, columns, filters, joins, and aggregations; learning the other later is much easier.

## Notebooks versus scripts

Use notebooks when you are exploring data, teaching, or combining narrative with analysis. Use scripts/modules when work should run repeatedly, be tested, or be called by another system. Real projects often use both.

## Resources by level

**Beginner**

- [Python tutorial](https://docs.python.org/3/tutorial/) — official introduction; best if you have programmed before.
- [Automate the Boring Stuff with Python](https://automatetheboringstuff.com/) — approachable, practical automation-oriented learning.
- [Corey Schafer's Python videos](https://www.youtube.com/@coreyms) — clear walkthroughs of Python fundamentals and tooling.

**Data-focused beginner/intermediate**

- [NumPy Learn](https://numpy.org/learn/) — curated NumPy resources.
- [pandas getting started](https://pandas.pydata.org/docs/getting_started/) — official tutorials and cheat sheet.
- [Polars getting started](https://docs.pola.rs/user-guide/getting-started/) — especially useful after you already understand dataframe basics.

**Reference / deeper**

- [Python standard library](https://docs.python.org/3/library/) — learn to check this before installing a package for every small task.
- [Python Packaging User Guide](https://packaging.python.org/) — environments, packages, project metadata, publishing, and packaging concepts.
- [`uv` documentation](https://docs.astral.sh/uv/) — current workflows for project and dependency management.

## Practice checkpoint

Create a project that reads a CSV file, calculates two summary statistics, and saves a chart. Put the work under [Git](03-git.md) before moving on.
