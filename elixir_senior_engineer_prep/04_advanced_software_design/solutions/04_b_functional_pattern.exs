# Solution for: Refactoring with Railway Oriented Programming

defmodule ROPChallenge do
  # --- Helper functions that can fail ---
  def validate_params(params) do
    if Map.has_key?(params, "payload"), do: {:ok, params["payload"]}, else: {:error, :missing_payload}
  end

  def authorize_user(payload) do
    if String.starts_with?(payload, "admin:") do
      {:ok, String.replace(payload, "admin:", "")}
    else
      {:error, :unauthorized}
    end
  end

  def upcase_payload(payload) do
    {:ok, String.upcase(payload)}
  end

  # --- Original function to be refactored ---
  def process_request(params) do
    case validate_params(params) do
      {:ok, payload} ->
        case authorize_user(payload) do
          {:ok, authorized_payload} ->
            case upcase_payload(authorized_payload) do
              {:ok, uppercased_payload} ->
                {:ok, uppercased_payload}
              {:error, reason} ->
                {:error, reason}
            end
          {:error, reason} ->
            {:error, reason}
        end
      {:error, reason} ->
        {:error, reason}
    end
  end

  # --- Solved implementation using `with` ---
  def process_request_with_rop(params) do
    with {:ok, payload} <- validate_params(params),
         {:ok, authorized_payload} <- authorize_user(payload),
         {:ok, uppercased_payload} <- upcase_payload(authorized_payload) do
      # This is the "success" track. It only runs if all previous clauses matched.
      {:ok, uppercased_payload}
    else
      # This is the "failure" track. It catches the first non-matching result.
      {:error, reason} -> {:error, reason}
      # It's good practice to have a catch-all clause.
      _ -> {:error, :unknown_error}
    end
  end
end

# --- Tests ---
defmodule ROPTest do
  def run do
    IO.puts("Running ROP Challenge tests...")

    # Success case
    params1 = %{"payload" => "admin:my data"}
    expected1 = {:ok, "MY DATA"}
    assert(ROPChallenge.process_request_with_rop(params1) == expected1, "Success Case")

    # Failure case 1: Missing payload
    params2 = %{"other_key" => "value"}
    expected2 = {:error, :missing_payload}
    assert(ROPChallenge.process_request_with_rop(params2) == expected2, "Failure Case 1: Missing Payload")

    # Failure case 2: Unauthorized
    params3 = %{"payload" => "user:my data"}
    expected3 = {:error, :unauthorized}
    assert(ROPChallenge.process_request_with_rop(params3) == expected3, "Failure Case 2: Unauthorized")

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

ROPTest.run()
