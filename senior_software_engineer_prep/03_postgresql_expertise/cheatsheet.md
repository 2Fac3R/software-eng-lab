# Module 3: PostgreSQL Expertise - Cheatsheet

---

### Which Index to Use?

| Index Type | Use Case |
| :--- | :--- |
| **B-Tree** | The default. Best for standard equality (`=`) and range (`<`, `>`) queries on scalar types (`int`, `text`, `date`, etc.). |
| **GIN** | Best for querying composite types. The top choice for `jsonb` (`@>` operator), arrays, and full-text search. |
| **GiST** | A general-purpose index for many data types, including geometric data. Can also be used for full-text search. |
| **BRIN** | For very large tables where data has a natural physical correlation (e.g., timestamps). Uses very little space. |

---

### Common `jsonb` Operators

Given `data` is a `jsonb` column like `'{"name": "Alice", "tags": ["a", "b"]}'`

| Operator | Example | Result |
| :--- | :--- | :--- |
| `->` | `data -> 'name'` | `"Alice"` (as `jsonb`) |
| `->>` | `data ->> 'name'` | `"Alice"` (as `text`) |
| `@>` | `data @> '{"name": "Alice"}'` | `true` (Checks if left contains right) |
| `?` | `data ? 'tags'` | `true` (Checks if a top-level key exists) |
| `?|` | `data ?| array['name', 'age']` | `true` (Checks if any key in the array exists) |
| `?&` | `data ?& array['name', 'age']` | `false` (Checks if all keys in the array exist) |

---

### Row-Level Security (RLS) Quick Syntax

```sql
-- 1. Enable RLS on the target table
ALTER TABLE my_table ENABLE ROW LEVEL SECURITY;

-- 2. Create a policy for a specific command (SELECT, INSERT, etc.)
CREATE POLICY my_policy_name
ON my_table
FOR SELECT
USING ( -- This expression must evaluate to TRUE for a row to be visible
    tenant_id = current_setting('app.current_tenant_id')
);
```

---

### Basic `PL/PgSQL` Function Skeleton

```sql
CREATE OR REPLACE FUNCTION my_function_name(param1 type, param2 type)
RETURNS return_type AS $$
-- Optional: Declare variables here
DECLARE
    my_variable type;
BEGIN
    -- Your logic here
    -- ...

    RETURN some_value;

-- Optional: Exception handling
EXCEPTION
    WHEN some_exception THEN
        -- Handle error
END;
$$ LANGUAGE plpgsql;
```
