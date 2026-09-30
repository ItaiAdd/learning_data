# Docker & Containerisation

[← APIs](06-apis.md) · [Back to README](../README.md) · [Next: ML models →](08-ml-model-families.md)

## What is containerisation?

A **container** runs a process in an isolated environment with its filesystem and dependencies packaged in a predictable way. A **container image** is the packaged template; a **container** is a running instance of that image.

Docker's explanation of [what a container is](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-container/) emphasises isolation and self-contained dependencies.

Containers are not the same as virtual machines. A VM usually includes a full guest operating system. Containers share the host kernel while isolating processes and filesystems, which generally makes them lighter weight.

## Why is Docker useful in data work?

“Works on my machine” often means two machines had different Python versions, system libraries, environment variables, or installed tools. Docker lets a project describe more of its runtime environment as code.

Common uses include:

- packaging an API that serves a model;
- running a database locally for development;
- reproducing a data pipeline environment;
- giving CI/CD systems a predictable build/runtime image;
- running the same application on a laptop and a server.

Docker does **not** automatically make code reproducible. You still need pinned dependencies, sensible data/version handling, and configuration management.

## Core vocabulary

- **Dockerfile:** recipe for building an image.
- **Image:** read-only packaged filesystem plus metadata/configuration.
- **Container:** running instance of an image.
- **Registry:** service that stores images (for example Docker Hub or a cloud registry).
- **Volume:** persistent/shared storage mounted into a container.
- **Port mapping:** expose a container's network port to the host.

## Basic Python example

The runnable files live in [`examples/docker/`](../examples/docker/).

`app.py`:

```python
from statistics import mean

values = [3.2, 5.1, 4.7, 6.0]
print(f"Mean: {mean(values):.2f}")
```

`Dockerfile`:

```dockerfile
FROM python:3.14-slim

WORKDIR /app
COPY app.py .

CMD ["python", "app.py"]
```

Build an image:

```bash
docker build -t student-mean .
```

Run it:

```bash
docker run --rm student-mean
```

The container should print the same result regardless of whether your host computer has Python 3.14 installed, because the image supplies Python.

## Adding dependencies

A simple educational Dockerfile can copy a dependency file and install packages. For example with `requirements.txt`:

```dockerfile
FROM python:3.14-slim
WORKDIR /app
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "app.py"]
```

For real projects, consider reproducible lock files, non-root users, smaller build contexts, multi-stage builds when appropriate, security scanning, and explicit image-version policies.

## Important Docker habits

### Use `.dockerignore`

Do not send virtual environments, Git history, huge datasets, caches, or secrets into the build context unless they are genuinely required.

### Keep secrets out of images

A secret copied into an image may remain recoverable from image layers even if a later Dockerfile step deletes it.

### Containers should be replaceable

Do not assume data written inside a container's writable layer is durable. Use a volume, object store, or database for persistent data.

## Docker Compose

A data project often needs more than one service: for example Python + PostgreSQL. Docker Compose lets you describe multiple containers and their networking/configuration in one YAML file. Learn plain `docker build`/`docker run` first, then Compose will make more sense.

## Resources by level

**Beginner**

- [Docker Get Started](https://docs.docker.com/get-started/) — official tutorials.
- [What is a container?](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-container/) — conceptual introduction.

**Python-specific**

- [Docker's Python guide](https://docs.docker.com/guides/python/) — containerising and developing a Python application.

**Broader practical course**

- [The Missing Semester](https://missing.csail.mit.edu/) — includes packaging/shipping and other tooling context.
- [Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp) — uses containers as part of a larger hands-on data-engineering workflow and links its video lectures.

## Practice checkpoint

Containerise the API example from [API basics](06-apis.md). The program should make the request and print the result when you run `docker run`. Then ask yourself: what needs to change if the program writes an output file you want to keep after the container exits?
