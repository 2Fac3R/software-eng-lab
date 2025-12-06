# Challenge: Refactor with the Pipe Operator and `with`

# Instructions:
# The code below works, but it's deeply nested and hard to read.
# Your task is to refactor the `process_data/1` function.
#
# 1. Refactor `process_data_pipe/1`:
#    - Use the pipe operator `|>` to create a clean, readable pipeline.
#
# 2. Refactor `process_data_with/1`:
#    - Use the `with` special form to handle the chain of operations that can fail.
#    - The function should return `{:ok, processed_string}` on success or `{:error, reason}` on failure.

defmodule Operations do
  def fetch_data(id) do
    # In a real app, this might fail.
    {:ok, "  raw data for id #{id}  "}
  end

  def validate(data) do
    if String.contains?(data, "raw") do
      {:ok, data}
    else
      {:error, :invalid_format}
    end
  end

  def normalize(data) do
    # In a real app, this might fail.
    {:ok, String.trim(data)}
  end

  def uppercase(data) do
    # In a real app, this might fail.
    {:ok, String.upcase(data)}
  end
end

defmodule RefactorChallenge do
  # This is the original, hard-to-read version.
  def process_data_nested(id) do
    case Operations.fetch_data(id) do
      {:ok, data} ->
        result = String.trim(data)
        String.upcase(result)
      {:error, reason} ->
        "Error: #{reason}"
    end
  end

  # TODO: Refactor this function using the pipe operator `|>`
  def process_data_pipe(id) do
    # Your implementation here
    # Hint: You can't pipe into a `case` statement directly.
    # Think about how to handle the success/error tuple.
    id
    |> Operations.fetch_data()
    # ... continue the pipe
  end

  # TODO: Refactor this function using the `with` statement
  def process_data_with(id) do
    # Your implementation here
  end
end

# --- Tests ---
defmodule RefactorTest do
  def run do
    IO.puts("Running RefactorChallenge tests...")

    # Test Pipe Version
    assert RefactorChallenge.process_data_pipe(123) == "RAW DATA FOR ID 123", "Pipe Test 1"

    # Test With Version
    assert RefactorChallenge.process_data_with(123) == {:ok, "RAW DATA FOR ID 123"}, "With Test 1"

    # Test With Version (Failure)
    # We'll mock a function to simulate failure
    defmodule Operations do
      def fetch_data(_), do: {:error, :network_timeout}
      def normalize(data), do: {:ok, String.trim(data)}
      def uppercase(data), do: {:ok, String.upcase(data)}
    end
    assert RefactorChallenge.process_data_with(404) == {:error, :network_timeout}, "With Test 2 (Failure)"

    IO.puts("All tests passed!")
  end

  defp assert(result, expected, test_name) do
    if result == expected do
      IO.puts("  [PASS] #{test_name}")
    else
      IO.puts("  [FAIL] #{test_name}")
      IO.puts("    Expected: #{inspect(expected)}")
      IO.puts("    Got:      #{inspect(result)}")
      System.halt(1)
    end
  end
end

RefactorTest.run()