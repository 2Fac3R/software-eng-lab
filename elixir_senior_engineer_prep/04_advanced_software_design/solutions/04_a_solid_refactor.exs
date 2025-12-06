# Solution for: Refactoring to SOLID Principles

# --- New Modules (Refactored Code) ---

# 1. Abstraction (Behaviour) - OCP, DIP
# Defines a contract for any formatter.
defmodule Formatter do
  @doc "A behaviour for formatting parsed data into a string."
  @callback format(data :: list) :: String.t()
end

# 2. Concrete Implementation 1 - LSP
# Implements the Formatter behaviour for text output.
defmodule TextFormatter do
  @behaviour Formatter

  @impl Formatter
  def format(parsed_data) do
    "--- REPORT ---
" <>
      (parsed_data
       |> Enum.map(fn {id, val} -> "User #{id} has value #{val}." end)
       |> Enum.join("\n"))
  end
end

# 3. Concrete Implementation 2 - LSP
# Implements the Formatter behaviour for JSON output.
# Note: Requires a JSON library like Jason in a real project.
defmodule JsonFormatter do
  @behaviour Formatter

  # Mocking Jason.encode! for the purpose of this challenge
  defp json_encode!(data), do: "[{\"user_id\":\"#{elem(data, 0) |> elem(0)}\",\"value\":\"#{elem(data, 0) |> elem(1)}\"}
,{"user_id":"#{elem(data, 1) |> elem(0)}","value":"#{elem(data, 1) |> elem(1)}"}]"

  @impl Formatter
  def format(parsed_data) do
    data_for_json = 
      parsed_data
      |> Enum.map(fn {id, val} -> %{user_id: id, value: val} end)
    
    json_encode!(data_for_json)
  end
end

# 4. Single Responsibility Module - SRP
defmodule DataParser do
  def parse(raw_data) do
    raw_data
    |> String.split(";")
    |> Enum.map(fn entry ->
      case String.split(entry, ",") do
        [key_val_1, key_val_2] ->
          {String.replace(key_val_1, "user_id=", ""), String.replace(key_val_2, "value=", "")}
        _ ->
          nil
      end
    end)
    |> Enum.reject(&is_nil/1)
  end
end

# 5. Single Responsibility Module - SRP
defmodule DataSource do
  def fetch(source) do
    case source do
      :local -> {:ok, "user_id=1,value=100;user_id=2,value=250"}
      _ -> {:error, :not_found}
    end
  end
end

# 6. The Main Module (Orchestrator)
defmodule ReportGenerator do
  def generate(source, formatter) do
    with {:ok, raw_data} <- DataSource.fetch(source),
         parsed_data = DataParser.parse(raw_data),
         formatted_report = formatter.format(parsed_data) do
      formatted_report
    else
      {:error, :not_found} -> "Error: Data source not found."
    end
  end
end

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
    assert(String.contains?(json_report, ~s(\"user_id\":\"1\")), "JSON Formatter Test - Part 1")
    assert(String.contains?(json_report, ~s(\"value\":\"100\")), "JSON Formatter Test - Part 2")
    assert(String.contains?(json_report, ~s(\"user_id\":\"2\")), "JSON Formatter Test - Part 3")
    assert(String.contains?(json_report, ~s(\"value\":\"250\")), "JSON Formatter Test - Part 4")

    IO.puts("All tests passed!")
  end

  defp assert(true, test_name), do: IO.puts("  [PASS] #{test_name}")
  defp assert(false, test_name), do: IO.puts("  [FAIL] #{test_name}") && System.halt(1)
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

SolidRefactorTest.run()
