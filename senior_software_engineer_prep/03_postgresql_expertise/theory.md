# Module 3: PostgreSQL Expertise

This module provides a deep dive into the advanced features of PostgreSQL required by the senior role. A deep understanding of the database is critical for building high-performance, reliable systems, especially in the financial domain. We will go beyond basic SQL to cover features that enable scalability and robust data modeling.

## 1. Table Partitioning

**What is it?**
Partitioning is the process of splitting one large logical table into smaller, more manageable physical pieces called partitions. However, the table can still be queried as a single entity.

**Why use it?**
-   **Performance:** For very large tables (millions or billions of rows), queries can become slow. If a query only needs data from a specific time range or region, the query planner can use "partition pruning" to scan only the relevant partitions, dramatically speeding up the query.
-   **Manageability:** Tasks like backups, restores, or dropping old data can be performed on a per-partition basis, which is much faster than operating on a giant table.

**Partitioning Strategies in PostgreSQL:**
-   **Range Partitioning:** Partitions are defined by a range of values (e.g., by date). This is the most common strategy, perfect for time-series data.
-   **List Partitioning:** Partitions are defined by a list of specific values (e.g., by country code or status).
-   **Hash Partitioning:** Data is distributed evenly across a specified number of partitions based on a hash key.

**Example: Range Partitioning**
```sql
-- 1. Create the parent table
CREATE TABLE measurements (
    city_id      int not null,
    logdate      date not null,
    peak_temp    int
) PARTITION BY RANGE (logdate);

-- 2. Create partitions for specific ranges
CREATE TABLE measurements_y2023m01 PARTITION OF measurements
    FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');

CREATE TABLE measurements_y2023m02 PARTITION OF measurements
    FOR VALUES FROM ('2023-02-01') TO ('2023-03-01');
```

---

## 2. The `JSONB` Data Type

PostgreSQL offers two JSON data types: `json` and `jsonb`.

-   `json`: Stores an exact, textual copy of the input JSON. It's fast to write but slower to query.
-   `jsonb`: Stores the data in a decomposed binary format. It's slightly slower to write but much faster to query and supports indexing.

**Rule of thumb: Always use `jsonb` unless you have a specific reason to preserve the exact whitespace and key order of the original JSON text.**

**Common `jsonb` Operators:**
-   `->`: Get JSON object field by key.
-   `->>`: Get JSON object field as `text`.
-   `@>`: Does the left JSON value contain the right JSON value? (Extremely powerful for querying).

**Example:**
```sql
-- Find all users who have a "zipcode" of "90210" in their address metadata
SELECT id, name FROM users
WHERE metadata @> '{"address": {"zipcode": "90210"}}';
```

---

## 3. Advanced Indexing

-   **B-Tree (Default):** The standard, all-purpose index. Excellent for equality (`=`) and range (`<`, `>`, `BETWEEN`) queries on scalar data types like `int`, `text`, `date`.

-   **GIN (Generalized Inverted Index):** Designed for indexing "composite" types where a single row can contain multiple values (like the keys in a `jsonb` object or the words in a text document). It is the preferred index type for `jsonb` fields.

    ```sql
    -- Create a GIN index on a jsonb column
    CREATE INDEX idx_users_metadata_gin ON users USING GIN (metadata);
    ```

-   **GiST (Generalized Search Tree):** A more general-purpose index that can be used for a wide variety of data types, including geometric data and full-text search. For `jsonb`, GIN is typically faster for lookups, but GiST can be faster to build.

---

## 4. Row-Level Security (RLS)

RLS is a critical feature for multi-tenant applications, such as financial systems where one customer must never see another customer's data.

It allows you to define **policies** on a table that control which rows a user is allowed to access or modify. These policies are applied automatically and transparently for every query.

**Example:** A user should only be able to see their own account information.
```sql
-- 1. Enable RLS on the table
ALTER TABLE accounts ENABLE ROW LEVEL SECURITY;

-- 2. Create a policy
CREATE POLICY user_can_only_see_own_account
ON accounts
FOR SELECT
USING (user_id = current_setting('app.current_user_id')::integer);
```
In this example, before any query runs, the application would set a session variable `app.current_user_id`, and the policy would use this to filter the rows automatically.

---

## 5. Stored Procedures (`PL/PgSQL`)

PL/PgSQL is a procedural language for writing functions and procedures that are executed directly within the PostgreSQL database.

**Pros:**
-   **Performance:** Can reduce network round-trips by executing complex logic in a single call.
-   **Encapsulation:** Encapsulates business logic close to the data.

**Cons:**
-   **Maintainability:** Harder to version control, test, and debug than application code.
-   **Vendor Lock-in:** Ties your logic directly to PostgreSQL.

**Example: A simple function to get an account balance**
```sql
CREATE OR REPLACE FUNCTION get_account_balance(p_account_id integer)
RETURNS decimal AS $$
DECLARE
    v_balance decimal;
BEGIN
    SELECT balance INTO v_balance
    FROM accounts
    WHERE id = p_account_id;

    RETURN v_balance;
END;
$$ LANGUAGE plpgsql;
```
