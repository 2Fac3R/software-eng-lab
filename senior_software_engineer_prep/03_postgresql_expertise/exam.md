# Module 3 Exam: PostgreSQL Expertise

**Instructions:** Choose the best answer for each question.

---

**Question 1:** You have a table with a `jsonb` column named `attributes`. You want to write a query to find all rows where the `attributes` field contains the key-value pair `"country": "MX"`. Which operator is best suited for this query and can be accelerated with a GIN index?

A) `->>`
B) `->`
C) `@>`
D) `?`

---

**Question 2:** You are designing a very large time-series table to store event logs. Queries will almost always filter by a specific date range (e.g., `WHERE event_date >= '2023-01-01' AND event_date < '2023-02-01')`. Which PostgreSQL feature would provide the most significant performance benefit for these queries?

A) Row-Level Security
B) Table Partitioning by `RANGE` on the `event_date` column.
C) Creating a B-Tree index on the `event_date` column.
D) Using the `jsonb` data type to store the events.

---

**Question 3:** What is the primary purpose of Row-Level Security (RLS) in PostgreSQL?

A) To encrypt data at the row level.
B) To speed up queries by filtering rows on the server.
C) To define access control policies that determine which rows a user is allowed to view or modify.
D) To create a log of all changes made to a row.

---

**Question 4:** You need to index a `jsonb` column to efficiently query for the existence of top-level keys. Which type of index is generally recommended for `jsonb` columns?

A) B-Tree
B) Hash
C) GiST
D) GIN

---

**Question 5:** What is a key benefit of using a stored procedure (e.g., in `PL/PgSQL`) to perform a series of complex updates, instead of running multiple individual queries from the application?

A) It makes the code easier to test and version control.
B) It reduces network latency by bundling multiple operations into a single round-trip to the database.
C) It makes the application logic more portable to other databases.
D) It is the only way to ensure transactional integrity.
