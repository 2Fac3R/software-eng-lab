# Module 5: Relational Databases & Ecto - Cheatsheet (Extended)

---

### Ecto Associations

| Association | Relationship | Foreign Key Location |
| :--- | :--- | :--- |
| `belongs_to` | One-to-One / One-to-Many | In the current schema. |
| `has_one` / `has_many` | One-to-One / One-to-Many | In the *other* schema. |
| `many_to_many` | Many-to-Many | In a dedicated join table (`join_through`). |

---

### Dynamic Queries

A powerful pattern for building queries with optional filters.

```elixir
def list_products(filters) do
  base_query = from(p in Product)

  filters
  |> Enum.reduce(base_query, &apply_filter/2)
  |> Repo.all()
end

# Use multiple function clauses to apply filters
defp apply_filter(query, {:category, cat}), do: from(p in query, where: p.category == ^cat)
defp apply_filter(query, {:in_stock, true}), do: from(p in query, where: p.stock_count > 0)
defp apply_filter(query, _, _), do: query # Ignore unknown filters
```

---

### Ecto Changeset Lifecycle

1.  **`cast/4`**: Filter external params to allow only known fields.
2.  **`validate_*`**: Pipe through validation functions (`validate_required`, `validate_length`, etc.).
3.  **`unique_constraint/3`**: Add a constraint to turn DB unique index errors into clean changeset errors.
4.  **`assoc_constraint/2`**: Ensure associated records exist.
5.  **`Repo.insert/update`**: Apply the changeset to the database.

---

### `Ecto.Multi` Transaction Template

Use `Ecto.Multi` to ensure atomicity for multiple operations.

```elixir
Ecto.Multi.new()
|> Ecto.Multi.insert(:user, user_changeset)
|> Ecto.Multi.insert(:profile, profile_changeset)
|> Repo.transaction()
```
