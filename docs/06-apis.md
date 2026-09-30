# API Basics

[← SQL](05-sql.md) · [Back to README](../README.md) · [Next: Docker →](07-docker.md)

## What is an API?

An **API (Application Programming Interface)** is a defined way for one piece of software to interact with another. The term is broad: a Python library has an API, an operating system has APIs, and a website may expose a network API.

In data work, “API” often means an HTTP service from which a program can request or send structured data.

## A useful mental model

Imagine a weather service. Your program might request:

```text
GET /locations/123/forecast
```

The service processes the request and sends a response containing a status code, headers, and usually a body. The body may be JSON.

The URL path is commonly called an **endpoint**.

## JSON

**JSON (JavaScript Object Notation)** is a text format for structured data. Despite the name, it is used by nearly every mainstream programming language.

```json
{
  "station": "North Campus",
  "temperature_c": 14.2,
  "raining": false,
  "tags": ["university", "weather"]
}
```

JSON has objects (`{}`), arrays (`[]`), strings, numbers, booleans, and `null`. MDN's [Working with JSON](https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Scripting/JSON) is a clear introduction.

Python's standard [`json`](https://docs.python.org/3/library/json.html) module converts between JSON text and Python objects.

## HTTP methods used by REST-style APIs

HTTP defines methods that describe the purpose of a request. Common API conventions are:

| Method | Typical API meaning |
|---|---|
| `GET` | Retrieve a resource or collection. |
| `POST` | Submit data, often creating a resource or starting an operation. |
| `PUT` | Replace a resource representation. |
| `PATCH` | Partially modify a resource. |
| `DELETE` | Delete a resource. |

See MDN's [HTTP request methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods) for the precise semantics. HTTP and CRUD (“create, read, update, delete”) overlap conceptually but are not the same thing.

## What does REST mean?

**REST (Representational State Transfer)** is an architectural style for networked systems. In everyday developer conversation, “REST API” often loosely means an HTTP API organised around resources and standard HTTP methods. MDN's [REST glossary](https://developer.mozilla.org/en-US/docs/Glossary/REST) explains both the formal idea and the looser common usage.

## Status codes

The first digit gives a useful category:

- `2xx` — success (`200 OK`, `201 Created`, `204 No Content`);
- `3xx` — redirection;
- `4xx` — client-side problem (`400 Bad Request`, `401 Unauthorized`, `404 Not Found`, `429 Too Many Requests`);
- `5xx` — server-side failure.

Do not assume “I received JSON” means the request succeeded. Check the status code.

## Example: call a public practice API with Python

[JSONPlaceholder](https://jsonplaceholder.typicode.com/) is a free fake REST API intended for tutorials and prototypes.

Install Requests:

```bash
uv add requests
```

Then:

```python
import requests

response = requests.get(
    "https://jsonplaceholder.typicode.com/posts/1",
    timeout=10,
)
response.raise_for_status()
post = response.json()

print(post["title"])
```

A runnable version is in [`examples/api/fetch_post.py`](../examples/api/fetch_post.py).

The Requests [Quickstart](https://requests.readthedocs.io/en/latest/user/quickstart/) covers query parameters, POST requests, headers, JSON responses, timeouts, and errors.

## Query parameters and request bodies

A `GET` request may include query parameters:

```text
GET /measurements?station=123&limit=20
```

A `POST`, `PUT`, or `PATCH` may send a JSON body:

```json
{
  "name": "new experiment",
  "owner": "student-42"
}
```

Libraries such as Requests handle URL encoding and JSON serialisation for you. Prefer their structured parameters rather than building URLs/body strings manually.

## Authentication

Real APIs often require authentication using API keys, OAuth tokens, signed requests, or other mechanisms. Credentials are secrets: keep them out of source code and Git history. Environment variables or a dedicated secret manager are common approaches.

## Rate limits and pagination

Two production concerns appear quickly:

- **Rate limiting:** an API limits how many requests you may make in a time period. A `429` response commonly indicates you should slow down.
- **Pagination:** large collections are returned in pages. Your code must request the next page until no more data remains.

A script that works for one response may need significant extra logic to ingest an entire API reliably.

## Non-REST API paradigms

### GraphQL

[GraphQL](https://graphql.org/learn/) lets a client describe the fields it wants using a typed schema. It can reduce over-fetching and give clients flexible queries, but shifts complexity into schema design, resolvers, authorisation, caching, and query control.

### gRPC

[gRPC](https://grpc.io/docs/what-is-grpc/) is a remote procedure call framework commonly paired with Protocol Buffers. Clients call defined service methods rather than constructing resource-style HTTP URLs. It is common in internal distributed systems where strong contracts and efficient binary communication matter.

### Webhooks

A webhook reverses the direction of polling: instead of your program repeatedly asking “has something happened?”, another service sends your endpoint an HTTP request when an event occurs. Examples include payment events, Git pushes, or job completion notifications.

### Event/message systems

Kafka, RabbitMQ, cloud queues, and similar systems are not request/response APIs in the same sense. They let producers publish messages/events that consumers process asynchronously. You will meet this model again in [Data engineering foundations](10-data-engineering.md).

## Resources by level

**Beginner**

- [JSONPlaceholder](https://jsonplaceholder.typicode.com/) — safe fake API for practice, no key required.
- [Requests Quickstart](https://requests.readthedocs.io/en/latest/user/quickstart/) — Python examples.
- [MDN: HTTP request methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods) — clear definitions of HTTP verbs.

**Intermediate**

- [MDN HTTP reference](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference) — status codes, headers, caching, methods, and protocol concepts.
- [GraphQL Learn](https://graphql.org/learn/) — official interactive learning path.
- [gRPC Introduction](https://grpc.io/docs/what-is-grpc/introduction/) — services, clients, and protocol buffers.

## Practice checkpoint

Use JSONPlaceholder to fetch several posts, convert the response into a pandas or Polars dataframe, keep only three columns, and write them to CSV. Add timeout/error handling, then commit it with [Git](03-git.md).
