# Module 3 Exam Solutions: PostgreSQL Expertise

---

**Question 1:** You have a table with a `jsonb` column named `attributes`. You want to write a query to find all rows where the `attributes` field contains the key-value pair `"country": "MX"`. Which operator is best suited for this query and can be accelerated with a GIN index?

**Answer:** C
**Explanation:** The `@>` ("contains") operator is designed for this exact purpose. A query like `WHERE attributes @> '{"country": "MX"}'` will efficiently find all matching records, and this operation is the primary use case for a GIN index on a `jsonb` column.

---

**Question 2:** You are designing a very large time-series table to store event logs. Queries will almost always filter by a specific date range (e.g., `WHERE event_date >= '2023-01-01' AND event_date < '2023-02-01')`. Which PostgreSQL feature would provide the most significant performance benefit for these queries?

**Answer:** B
**Explanation:** While a B-Tree index is helpful, for very large tables, partitioning is superior. By partitioning the table by `RANGE` on the date, the query planner can perform "partition pruning," completely ignoring the physical partitions that do not fall within the query's date range, leading to a massive reduction in the amount of data that needs to be scanned.

---

**Question 3:** What is the primary purpose of Row-Level Security (RLS) in PostgreSQL?

**Answer:** C
**Explanation:** RLS is an authorization feature. It allows database administrators to define policies that control access to rows in a table based on the characteristics of the user executing the query. It is a powerful tool for building multi-tenant applications.

---

**Question 4:** You need to index a `jsonb` column to efficiently query for the existence of top-level keys. Which type of index is generally recommended for `jsonb` columns?

**Answer:** D
**Explanation:** GIN (Generalized Inverted Index) is the recommended index type for `jsonb` because it is designed to handle composite types where multiple keys/values exist within a single datum. It creates an index of the keys and values within the `jsonb` document, making containment queries (`@>`) very fast.

---

**Question 5:** What is a key benefit of using a stored procedure (e.g., in `PL/PgSQL`) to perform a series of complex updates, instead of running multiple individual queries from the application?

**Answer:** B
**Explanation:** By executing the logic directly within the database, you avoid the overhead of multiple network round-trips between your application server and the database server. For complex, multi-step operations, this can result in a significant performance improvement.
