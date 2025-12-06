# Module 5: Relational Databases and Ecto (Extended)

This module provides a deep dive into the advanced features of PostgreSQL and how to leverage them idiomatically with Ecto. Strong database skills are critical for building high-performance, reliable systems.

### Official Documentation
*   [Ecto Official Guides](https://hexdocs.pm/ecto/Ecto.html)
*   [PostgreSQL Documentation on Transaction Isolation](https://www.postgresql.org/docs/current/transaction-iso.html)

---

## 1. Advanced SQL Concepts

A senior engineer must understand the underlying SQL for optimization and complex queries.

-   **Window Functions:** Perform calculations across a set of rows related to the current row. Essential for analytics. `RANK()`, `LEAD()`, `LAG()`.
-   **Common Table Expressions (CTEs):** Use the `WITH` clause to create temporary, named result sets, which dramatically improves the readability of complex, multi-step queries.
-   **Transaction Isolation Levels:** PostgreSQL provides different isolation levels (`READ COMMITTED`, `REPEATABLE READ`, `SERIALIZABLE`) that control how transactions interact with each other. Understanding these is crucial for preventing race conditions and ensuring data integrity in high-concurrency environments.

---

## 2. Ecto Schemas & Associations

`Ecto.Schema` maps Elixir structs to database tables. Associations define the relationships between them.

-   **`belongs_to`**: Defines a one-to-one or one-to-many relationship by holding the foreign key.
-   **`has_many`**: Defines a one-to-many relationship.
-   **`many_to_many`**: Defines a many-to-many relationship, which requires a join table.

```elixir
defmodule MyApp.Post do
  use Ecto.Schema
  schema "posts" do
    # ...
    belongs_to :user, MyApp.User
    many_to_many :tags, MyApp.Tag, join_through: "posts_tags"
  end
end
```

---

## 3. Advanced Ecto Queries

### Dynamic Queries
`Ecto.Query` is composable, which makes it easy to build queries dynamically based on conditional logic. This is a powerful pattern for handling optional filters.

```elixir
def list_posts(filters \ %{}) do
  base_query = from(p in Post, order_by: [desc: p.inserted_at])

  # Start with the base query and pipe it through filter functions
  filters
  |> Enum.reduce(base_query, fn {key, value}, query ->
    apply_filter(query, key, value)
  end)
  |> Repo.all()
end

# Use pattern matching and function heads to apply filters
defp apply_filter(query, :published, true), do: from(p in query, where: p.published_at <= NaiveDateTime.utc_now())
defp apply_filter(query, :user_id, id), do: from(p in query, where: p.user_id == ^id)
defp apply_filter(query, _, _), do: query # Ignore unknown filters
```

### Subqueries and `fragment()`
-   **Subqueries:** You can use `from` to create subqueries that can be joined against.
-   **`fragment()`:** This is an escape hatch to inject raw SQL into an Ecto query. It's essential for using database-specific functions or advanced features that Ecto doesn't support directly.

```elixir
# Use a PostgreSQL function that Ecto doesn't know about
from p in Post, where: fragment("lower(?) = ?", p.title, "hello")
```

---

## 4. Ecto Changesets in Depth

Changesets are pipelines for your data, ensuring integrity before it hits the database.

-   **Data vs. Params:** A changeset clearly distinguishes between the original data state and the changes to be applied.
-   **Constraints:** Use `unique_constraint/3` and `check_constraint/3` to turn database-level constraint violations into clean changeset errors.
-   **Associations:** Use `cast_assoc/3` and `put_assoc/3` to manage changes across related records within a single changeset.

---

## 5. Transactions with `Ecto.Multi`

`Ecto.Multi` is the idiomatic way to perform multiple database operations within a single, atomic transaction. If any step fails, the entire transaction is rolled back.

```elixir
Ecto.Multi.new()
|> Ecto.Multi.insert(:user, User.changeset(%User{}, user_params))
|> Ecto.Multi.run(:notify, fn _repo, %{user: user} ->
  # You can run non-database code in a transaction too!
  # If this function returns {:error, ...}, the transaction will roll back.
  MyApp.Notifier.send_welcome_email(user)
end)
|> Repo.transaction()
```
