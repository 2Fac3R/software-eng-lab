# Module 1: Elixir and Functional Programming (Extended)

This module covers the foundational concepts of Elixir and the functional programming paradigm. A deep and practical understanding of these topics is essential for writing clean, maintainable, and concurrent code in Elixir.

### Official Documentation
*   [Getting Started Guide](https://elixir-lang.org/getting-started/introduction.html)
*   [Kernel Special Forms (alias, import, etc.)](https://hexdocs.pm/elixir/Kernel.SpecialForms.html)

---

## 1. Core Functional Concepts

### Immutability
In Elixir, all data is **immutable**. This means that once a piece of data is created, it can never be changed. When you "change" a variable, you are not modifying the original data; instead, Elixir creates a *new* piece of data and rebinds the variable to it.

**Why it matters for a Senior Engineer:** Immutability is the cornerstone of reliable concurrent programming. It eliminates a whole class of bugs (race conditions) by ensuring that data cannot be changed by multiple processes simultaneously, removing the need for complex locking mechanisms.

### Pattern Matching
Pattern matching is more than assignment; it's a way to **destructure** and **assert** the shape of data. A senior developer uses pattern matching extensively to create declarative, readable code.

```elixir
# In function heads for different clauses
def handle_reply({:ok, data}), do: #... process data
def handle_reply({:error, reason}), do: #... log reason

# Destructuring nested data
%{"user" => %{"name" => name}} = response_body
```
*   [Official Guide on Pattern Matching](https://elixir-lang.org/getting-started/pattern-matching.html)

---

## 2. Data Types in Depth

### Basic Types & Structs
Beyond basic types (atoms, lists, tuples, maps), **Structs** are the idiomatic way to define structured data. They are maps with a defined set of keys and a name, providing compile-time checks.

### Binaries, Bitstrings, and Char-lists
Elixir has a deep connection to binaries, which is critical for performance in I/O, networking, and file handling.
-   **Binaries (Strings):** In Elixir, a string is a UTF-8 encoded binary.
-   **Char-lists:** A list of integer code points. Often seen in older Erlang libraries. `'hello'` is a char-list, `"hello"` is a binary.
-   **Bitstrings:** The lowest-level abstraction, allowing you to pattern match on bits and bytes.

```elixir
# Pattern matching on a binary to extract protocol data
<<version::4, type::4, payload::binary>> = <<0b01000001, "rest of data">>
# version is 4, type is 1
```

### Sigils
Sigils are shortcuts for creating literals, prefixed with `~`.
-   `~s` and `~S`: For creating strings, useful for avoiding quote escaping.
-   `~w` and `~W`: For creating lists of words (strings). `~w(hello world)` -> `["hello", "world"]`
-   `~r` and `~R`: For regular expressions.
-   `~D`, `~T`, `~N`, `~U`: For date/time structures.
*   [Official Guide on Sigils](https://hexdocs.pm/elixir/sigils.html)

---

## 3. Functions and Modules

### Anonymous Functions & The Capture Operator
Anonymous functions are essential for passing logic to higher-order functions like `Enum.map`. The capture operator `&` is a concise way to create them.

```elixir
# Full syntax
Enum.map([1, 2], fn x -> x * 2 end)

# Capture operator syntax
Enum.map([1, 2], &(&1 * 2))
```

### Code Organization: `alias`, `import`, `require`, `use`
-   **`alias`**: Creates a shorter name for a module. `alias MyApp.Users.Schema` lets you refer to it as `Schema`.
-   **`import`**: Brings functions from another module into the current scope, allowing you to call them without the module prefix. Use sparingly to avoid namespace pollution.
-   **`require`**: Ensures a module is compiled and loaded. It's primarily needed before calling macros from another module.
-   **`use`**: A powerful macro that injects code from another module into the current one. It's commonly used by frameworks (e.g., `use GenServer`).

### Module Attributes
Used for documentation, constants, and type specifications.
-   `@moduledoc`: Documentation for the module itself.
-   `@doc`: Documentation for the function that follows.
-   `@spec`: (Typespecs) Defines the types of function arguments and return values for static analysis with Dialyzer.

---

## 4. Enumerables and Comprehensions

### `Enum` vs. `Stream`
-   **`Enum`**: Eager. Processes the entire collection at once.
-   **`Stream`**: Lazy. Builds a "recipe" of computations that are executed only when needed (e.g., by `Enum.to_list/1`). Essential for large or infinite collections.

### `for` Comprehensions
A `for` comprehension is syntactic sugar for working with enumerables, especially when filtering and mapping are needed. It's often more readable than a chain of `Enum` or `Stream` functions.

```elixir
# Find the squares of all even numbers from 1 to 10
for n <- 1..10, rem(n, 2) == 0, do: n * n
#=> [4, 16, 36, 64, 100]

# Building a map
for {key, val} <- [a: 1, b: 2], into: %{}, do: {key, val * 2}
#=> %{a: 2, b: 4}
```
*   [Official Guide on Comprehensions](https://hexdocs.pm/elixir/comprehensions.html)

---

## 5. Polymorphism with Protocols

Protocols are Elixir's mechanism for achieving polymorphism. A protocol defines a common interface that can be implemented for any number of different data types.

**Example:**
```elixir
defprotocol Size do
  @doc "Calculates the size of a data structure"
  def size(data)
end

# Implement the protocol for a List
defimpl Size, for: List do
  def size(list), do: length(list)
end

# Implement it for a Map
defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

Size.size([1, 2, 3]) #=> 3
Size.size(%{a: 1})   #=> 1
```
*   [Official Guide on Protocols](https://hexdocs.pm/elixir/protocols.html)

---

## 6. Error Handling

Elixir favors handling errors explicitly with tuples (`{:ok, ...}` and `{:error, ...}`) and the `with` statement, rather than `try...catch` blocks. The `with` statement is perfect for "railway-oriented programming," where a sequence of operations can fail at any step.
```