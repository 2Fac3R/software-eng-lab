# Module 5 Exam: Relational Databases and Ecto (Extended)

**Instructions:** Choose the best answer for each question.

---

**Question 1:** You are building a search feature with several optional filters (e.g., by category, by status). Which Ecto feature is best suited for building a query piece by piece based on which filters are active?

A) `Ecto.Multi`
B) The composability of `Ecto.Query` to create dynamic queries.
C) `Ecto.Changeset`
D) Using `fragment()` for all filters.

---

**Question 2:** In an Ecto query, you want to fetch all users and their associated posts. You want to do this in two separate, efficient queries to avoid the N+1 problem. Which function should you use?

A) `join`
B) `preload`
C) `select`
D) `group_by`

---

**Question 3:** What is the main benefit of using `Ecto.Multi`?

A) It allows you to run multiple queries in parallel to make them faster.
B) It provides a way to execute a series of database operations within a single transaction, ensuring atomicity.
C) It helps in writing more complex `WHERE` clauses.
D) It is a tool for managing database migrations.

---

**Question 4:** In an Ecto schema, which association type requires a `join_through` table?

A) `has_one`
B) `belongs_to`
C) `has_many`
D) `many_to_many`

---

**Question 5:** What is the purpose of `fragment()` in an Ecto query?

A) To define a reusable part of a schema.
B) To provide an "escape hatch" to write raw, database-specific SQL inside an Ecto query.
C) To create a new, temporary table for a query.
D) To validate a piece of data before it is used in a query.
