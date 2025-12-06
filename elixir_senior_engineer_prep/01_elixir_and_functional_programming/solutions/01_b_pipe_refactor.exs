# Solution for: Refactor with the Pipe Operator and `with`

defmodule Operations do
  # This is the original module. We don't need to change it.
  # The test file will dynamically redefine it to test the failure case.
  def fetch_data(id) do
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
    {:ok, String.trim(data)}
  end

  def uppercase(data) do
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

  # Solved: Refactored with the pipe operator `|>`
  def process_data_pipe(id) do
    id
    |> Operations.fetch_data()
    |> handle_result()
  end

  # Helper function to handle the tuple from the pipe
  defp handle_result({:ok, data}) do
    data
    |> String.trim()
    |> String.upcase()
  end

  defp handle_result({:error, reason}) do
    "Error: #{reason}"
  end

  # Solved: Refactored with the `with` statement
  def process_data_with(id) do
    with {:ok, data} <- Operations.fetch_data(id),
         {:ok, validated_data} <- Operations.validate(data),
         {:ok, normalized_data} <- Operations.normalize(validated_data),
         {:ok, uppercased_data} <- Operations.uppercase(normalized_data) do
      # This is the "happy path"
      {:ok, uppercased_data}
    else
      # This block catches the first non-matching result
      {:error, reason} -> {:error, reason}
      # A catch-all is good practice
      _ -> {:error, :unknown_error}
    end
  end
end

# --- Tests ---
defmodule RefactorTest do
  def run do
    IO.puts("Running RefactorChallenge tests...")

    # Test Pipe Version
    assert(
      RefactorChallenge.process_data_pipe(123) == "RAW DATA FOR ID 123",
      "Pipe Test 1"
    )

    # Test With Version
    assert(
      RefactorChallenge.process_data_with(123) == {:ok, "RAW DATA FOR ID 123"},
      "With Test 1"
    )

    # Test With Version (Failure)
    # We'll mock a function to simulate failure by redefining the module locally.
    defmodule Operations do
      def fetch_data(_), do: {:error, :network_timeout}
      def validate(data), do: {:ok, data}
      def normalize(data), do: {:ok, String.trim(data)}
      def uppercase(data), do: {:ok, String.upcase(data)}
    end

    assert(
      RefactorChallenge.process_data_with(404) == {:error, :network_timeout},
      "With Test 2 (Failure)"
    )

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

# Redefine the original module so the tests run correctly from a clean state
defmodule Operations do
  def fetch_data(id) do
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
    {:ok, String.trim(data)}
  end

  def uppercase(data) do
    {:ok, String.upcase(data)}
  end
end

RefactorTest.run()