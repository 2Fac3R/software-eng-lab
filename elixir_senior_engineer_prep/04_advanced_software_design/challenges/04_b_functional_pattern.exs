# Challenge: Refactoring with Railway Oriented Programming

# Instructions:
# The `process_request` function below uses nested `case` statements to handle
# a sequence of operations that can each fail. This is often called the "Pyramid of Doom".
#
# Your task is to refactor `process_request/1` into a new function, 
# `process_request_with_rop/1`, using the Railway Oriented Programming pattern.
#
# 1. Use the `with` special form to chain the function calls together.
# 2. The new function should have the exact same behavior: return `{:ok, uppercased_payload}`
#    on success, and `{:error, reason}` on the first failure.

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

  # --- Your implementation here ---
  def process_request_with_rop(params) do
    # TODO: Implement this function using `with`
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
  defp assert(_, test_name), do: IO.puts("  [FAIL] #{test_name}") && System.halt(1)
end

# ROPTest.run()
