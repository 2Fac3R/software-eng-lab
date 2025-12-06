# Module 5 Exam Solutions: Relational Databases and Ecto (Extended)

---

**Question 1:** You are building a search feature with several optional filters (e.g., by category, by status). Which Ecto feature is best suited for building a query piece by piece based on which filters are active?

**Answer:** B
**Explanation:** `Ecto.Query` is designed to be composable. This allows you to start with a base query and then conditionally pipe it through additional `where` clauses, creating a dynamic query that adapts to the provided filters. This is a very common and powerful pattern in Ecto.

---

**Question 2:** In an Ecto query, you want to fetch all users and their associated posts. You want to do this in two separate, efficient queries to avoid the N+1 problem. Which function should you use?

**Answer:** B
**Explanation:** `preload` is specifically designed to load associated data efficiently. It first loads the main records (e.g., users) and then runs a second query to fetch all the associated records (e.g., posts) for those users, linking them in Elixir. `join` is used to filter or select data from multiple tables in a single query.

---

**Question 3:** What is the main benefit of using `Ecto.Multi`?

**Answer:** B
**Explanation:** `Ecto.Multi` is Ecto's abstraction for database transactions. It allows you to compose a series of operations, and when executed via `Repo.transaction/1`, it guarantees atomicity: all operations complete successfully, or the database is rolled back to its original state if any single operation fails.

---

**Question 4:** In an Ecto schema, which association type requires a `join_through` table?

**Answer:** D
**Explanation:** A `many_to_many` relationship requires a third, intermediate table (the "join table") to link the records from the two primary tables. This join table is specified in the schema using the `join_through` option.

---

**Question 5:** What is the purpose of `fragment()` in an Ecto query?

**Answer:** B
**Explanation:** `fragment()` is an "escape hatch" that allows you to inject a raw SQL string directly into an Ecto query. This is necessary when you need to use a database-specific function or syntax that Ecto's query DSL does not natively support.
