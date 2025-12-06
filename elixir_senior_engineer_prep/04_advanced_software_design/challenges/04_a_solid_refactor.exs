# Challenge: Refactoring to SOLID Principles

# Instructions:
# The `ReportGenerator` module below violates several SOLID principles.
# It fetches data, parses it, and formats it all in one place.
#
# Your task is to refactor this code into a more maintainable design.
#
# 1. Identify the different responsibilities in the `ReportGenerator` module.
# 2. Create new, smaller modules for each responsibility (e.g., a `Fetcher`, a `Parser`, a `Formatter`).
# 3. Define a `ReportGenerator` behaviour that specifies the contract for formatting.
# 4. Implement two different formatters (`TextFormatter` and `JsonFormatter`) that both adhere to the behaviour.
# 5. The final `ReportGenerator.generate/2` function should take the data source and the desired formatter module as arguments, demonstrating the Dependency Inversion Principle.

# --- Original Code (Violates SOLID) ---
defmodule Unsolid.ReportGenerator do
  def generate(source) do
    # Responsibility 1: Fetching data
    data = case source do
      :local -> "user_id=1,value=100;user_id=2,value=250"
      _ -> ""
    end

    # Responsibility 2: Parsing data
    parsed_data = 
      data
      |> String.split(";")
      |> Enum.map(fn entry -> 
        [key_val_1, key_val_2] = String.split(entry, ",")
        {String.replace(key_val_1, "user_id=", ""), String.replace(key_val_2, "value=", "")}
      end)

    # Responsibility 3: Formatting data
    "--- REPORT ---
" <> 
    (parsed_data 
    |> Enum.map(fn {id, val} -> "User #{id} has value #{val}." end)
    |> Enum.join("\n"))
  end
end

# --- Your Refactored Code Below ---

# TODO: Define a `Formatter` behaviour with a `format/1` function.

# TODO: Create a `TextFormatter` module that implements the behaviour.

# TODO: Create a `JsonFormatter` module that implements the behaviour.

# TODO: Create a `DataParser` module.

# TODO: Create a `DataSource` module.

# TODO: Create the final `ReportGenerator` module.
# It should have a `generate/2` function that takes a data source and a formatter module.


# --- Tests ---
defmodule SolidRefactorTest do
  def run do
    IO.puts("Running SOLID Refactor tests...")

    # Test with TextFormatter
    text_report = ReportGenerator.generate(:local, TextFormatter)
    expected_text = "--- REPORT ---
User 1 has value 100.\nUser 2 has value 250."
    assert(text_report == expected_text, "Text Formatter Test")

    # Test with JsonFormatter
    json_report = ReportGenerator.generate(:local, JsonFormatter)
    # Note: Elixir doesn't guarantee key order in JSON encoding
    assert(String.contains?(json_report, ~s("user_id":"1")), "JSON Formatter Test - Part 1")
    assert(String.contains?(json_report, ~s("value":"100")), "JSON Formatter Test - Part 2")

    IO.puts("All tests passed!")
  end

  defp assert(true, test_name), do: IO.puts("  [PASS] #{test_name}")
  defp assert(_, test_name), do: IO.puts("  [FAIL] #{test_name}") && System.halt(1)
end

# To run tests, you would need to have the solution implemented.
# For now, this file serves as the challenge definition.
# SolidRefactorTest.run()
