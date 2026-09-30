# SQL

[← GitHub](04-github.md) · [Back to README](../README.md) · [Next: APIs →](06-apis.md)

## What is SQL?

SQL (Structured Query Language) is used to work with relational databases. It is one of the most durable skills in the data industry because many analytical questions eventually become operations on tables: filter rows, select columns, join datasets, group records, and calculate summaries.

[SQLBolt](https://sqlbolt.com/) is an excellent browser-based introduction with interactive exercises.

## What is a table?

A database **table** is a collection of rows and columns. A row usually represents one entity or event; a column represents an attribute.

Example `students` table:

| student_id | name | course | score |
|---:|---|---|---:|
| 1 | Ava | Biology | 82 |
| 2 | Noah | Physics | 76 |
| 3 | Mina | Biology | 91 |

A table usually has a **schema** describing column names and data types. A **primary key** identifies a row uniquely. A **foreign key** can reference a row in another table.

## How is a SQL query structured?

A readable query often follows this shape:

```sql
SELECT course, AVG(score) AS average_score
FROM students
WHERE score >= 70
GROUP BY course
ORDER BY average_score DESC;
```

Read it as a pipeline of intent:

- `FROM` — which data source?
- `WHERE` — which rows?
- `GROUP BY` — which groups should be summarised?
- `SELECT` — which output columns/calculations?
- `ORDER BY` — how should results be sorted?

The written order is not exactly the database engine's logical execution order, which explains some initially surprising SQL behaviour. SQLBolt has a useful lesson on [query order of execution](https://sqlbolt.com/lesson/select_queries_order_of_execution).

## Basic examples

### Select columns

```sql
SELECT name, score
FROM students;
```

### Filter rows

```sql
SELECT *
FROM students
WHERE course = 'Biology';
```

### Sort

```sql
SELECT name, score
FROM students
ORDER BY score DESC;
```

### Aggregate

```sql
SELECT course,
       COUNT(*) AS student_count,
       AVG(score) AS average_score
FROM students
GROUP BY course;
```

## Joins: combining related tables

Suppose `students` stores a `course_id`, while a separate `courses` table stores names:

```sql
SELECT s.name,
       c.course_name,
       s.score
FROM students AS s
JOIN courses AS c
  ON s.course_id = c.course_id;
```

A **join** combines rows based on a relationship. The most important early join types are:

- `INNER JOIN` — keep matching rows from both sides;
- `LEFT JOIN` — keep every row from the left side, even if no right-side match exists.

Always check row counts and key uniqueness around joins. Accidental many-to-many joins are a common way to silently multiply data.

## `NULL`

`NULL` means “missing/unknown,” not zero and not an empty string. Comparisons use `IS NULL` / `IS NOT NULL`:

```sql
SELECT *
FROM students
WHERE score IS NULL;
```

Understanding `NULL` early prevents many bugs.

## Create and modify data

SQL is not only for reading:

```sql
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    course TEXT,
    score INTEGER
);

INSERT INTO students VALUES (1, 'Ava', 'Biology', 82);

UPDATE students
SET score = 84
WHERE student_id = 1;

DELETE FROM students
WHERE student_id = 1;
```

Be especially careful with `UPDATE` and `DELETE`: forgetting the `WHERE` clause can affect every row.

A fuller example is in [`examples/sql/student_scores.sql`](../examples/sql/student_scores.sql).

## SQL dialects

PostgreSQL, SQLite, DuckDB, MySQL, BigQuery, Snowflake and other systems all support SQL, but each has extensions and differences. Learn the common relational concepts first, then consult the documentation for the system you are using.

For local analytical practice, [DuckDB](https://duckdb.org/docs/stable/) is convenient because it can query CSV and Parquet files directly and integrates well with Python.

## Resources by level

**Beginner**

- [SQLBolt](https://sqlbolt.com/) — short interactive lessons in the browser.
- [freeCodeCamp SQL full course](https://www.youtube.com/watch?v=HXV3zeQKqGY) — long-form beginner video covering databases, tables, joins, CRUD, and more.

**Intermediate**

- [PostgreSQL SQL tutorial](https://www.postgresql.org/docs/current/tutorial-sql.html) — learn SQL in the context of a production-grade relational database.
- [DuckDB SQL introduction](https://duckdb.org/docs/stable/sql/introduction) — particularly relevant to local analytics and data files.

**Practice**

- [SQLZoo](https://sqlzoo.net/wiki/SQL_Tutorial) — interactive exercises across common query patterns.
- [HackerRank SQL](https://www.hackerrank.com/domains/sql) — useful for lots of small query drills; do not confuse puzzle skill with real data modelling.

## Practice checkpoint

Create two small related tables and answer five questions involving `WHERE`, `GROUP BY`, `ORDER BY`, and at least one `JOIN`. Then reproduce one answer in [Python](01-python.md) with pandas or Polars and compare the styles.
