# Module 6: Technical Leadership - Cheatsheet (Extended)

---

### The Testing Pyramid

| Level | Purpose | Speed / Quantity |
| :--- | :--- | :--- |
| **Unit Tests** | Test a single function/module in isolation. | Very Fast / Many |
| **Integration Tests** | Test how multiple modules work together. | Medium / Some |
| **End-to-End (E2E) Tests** | Test a full user workflow through the system. | Slow / Few |

---

### Property-Based Testing with `StreamData`

Instead of asserting a specific output, you assert a general "property" of your function, and the library generates hundreds of random inputs to try to break it.

```elixir
use ExUnit.Case
use StreamData

# Property: Reversing a list twice returns the original list.
property "double reversal returns original" do
  check all list <- list_of(any()) do
    assert list |> Enum.reverse() |> Enum.reverse() == list
  end
end
```

---

### Code Review Checklist

-   **[ ] Goal:** Does the PR solve the intended problem?
-   **[ ] Correctness:** Is the logic sound? Are edge cases handled?
-   **[ ] Testing:** Is there adequate test coverage?
-   **[ ] Design:** Does it follow established patterns (SOLID, etc.)?
-   **[ ] Readability:** Is the code clear and easy to understand?
-   **[ ] Documentation:** Are public APIs documented with `@doc`?

---

### Essential `mix` Commands for Quality

| Command | Description |
| :--- | :--- |
| `mix test` | Runs all tests (`test/**/*.exs`). |
| `mix test --cover` | Runs tests and calculates code coverage. |
| `mix format` | Formats the entire codebase. |
| `mix credo` | Runs static analysis for code style and consistency. |
| `mix dialyzer` | Runs static analysis for type inconsistencies and other bugs. |
| `mix docs` | Generates HTML documentation. |