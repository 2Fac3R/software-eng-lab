# Module 1: Elixir & Functional Programming - Cheatsheet (Extended)

---

### Pattern Matching Examples

```elixir
# On tuples
{:ok, data} = {:ok, "content"}

# On lists (head/tail)
[h | t] = [1, 2, 3]

# On maps
%{"name" => name} = %{"name" => "Alice"}

# In function clauses with guards
def process(data) when is_binary(data), do: :ok
```

---

### Code Organization Directives

| Directive | Purpose |
| :--- | :--- |
| **`alias`** | Creates a shorter name for a module. `alias MyApp.Users.Schema` -> `Schema`. |
| **`import`** | Allows calling functions from another module without the module prefix. Use sparingly. |
| **`require`** | Ensures a module is compiled and loaded. Necessary for using another module's macros. |
| **`use`** | Injects code from the specified module into the current module. (e.g., `use GenServer`). |

---

### `for` Comprehensions

Provides concise syntax for iterating and transforming enumerables.

```elixir
# Map and filter at the same time
for n <- 1..10, rem(n, 2) == 0, do: n * n
#=> [4, 16, 36, 64, 100]

# Build a map from a list
for user <- users, into: %{}, do: {user.id, user.name}
```

---

### Binaries and Bitstrings

Pattern match on the raw bytes of data.

```elixir
# Get the first byte of a binary string
<<first_byte, rest::binary>> = "hello"
# first_byte is 97

# Parse a binary protocol packet
<<version::4, type::4, payload_size::16>> = packet_data
```

---

### `Enum` vs. `Stream`

| Feature | `Enum` (Eager) | `Stream` (Lazy) |
| :--- | :--- | :--- |
| **Execution** | Immediately computes and returns a new collection. | Builds a "recipe" of computations; executes only when needed. |
| **Memory** | Creates intermediate collections; can be memory-intensive. | Memory-efficient; processes items one by one. |
| **Use Case** | Small to medium-sized, finite collections. | Large or infinite collections; complex data pipelines. |