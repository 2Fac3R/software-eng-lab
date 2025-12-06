# Challenge: Using Ecto.Multi for Transactions

# NOTE: This challenge is conceptual. It provides schemas and a function
# signature. You are to write the Ecto.Multi code. A running Elixir
# application with a database is required to execute it.

# Instructions:
# 1. You are given an `Account` schema.
# 2. Complete the `transfer/3` function.
# 3. The function should accept a `from_account`, a `to_account`, and an `amount`.
# 4. It must use `Ecto.Multi` and `Repo.transaction` to ensure that the debit
#    from the `from_account` and the credit to the `to_account` either both
#    succeed or both fail.
# 5. The function should return `{:ok, %{from: from_account, to: to_account}}` on success
#    or `{:error, ...}` on failure.

# --- Schema (for context) ---
defmodule Bank.Account do
  use Ecto.Schema

  schema "accounts" do
    field :balance, :decimal
  end

  def changeset(account, attrs) do
    # A simple changeset for updates
    Ecto.Changeset.cast(account, attrs, [:balance])
  end
end

# --- Your Code Here ---
defmodule MoneyTransfer do
  alias Bank.Account
  alias Ecto.Multi
  # Assume `Bank.Repo` is your Ecto Repo module.
  alias Bank.Repo

  def transfer(from_account, to_account, amount) do
    # TODO: Create a new Ecto.Multi.
    # TODO: Add a step to update the `from_account` balance (subtract amount).
    # TODO: Add a step to update the `to_account` balance (add amount).
    # TODO: Execute the multi inside a `Repo.transaction`.
  end
end
