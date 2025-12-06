# Solution for: Using Ecto.Multi for Transactions

# --- Schemas and Mocks (for context) ---
defmodule Bank.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :balance, :decimal
  end

  def changeset(account, attrs) do
    cast(account, attrs, [:balance])
    |> validate_required([:balance])
  end
end

defmodule Bank.Repo do
  def transaction(multi), do: {:ok, %{debit: %Bank.Account{}, credit: %Bank.Account{}}}
end
# --- End Mocks ---

defmodule MoneyTransfer do
  alias Bank.Account
  alias Ecto.Multi
  alias Bank.Repo

  def transfer(from_account, to_account, amount) do
    # 1. Create a new Multi struct to hold our operations.
    Ecto.Multi.new()
    # 2. Add the first operation: debit the `from_account`.
    #    We use `Multi.update` which takes a name for the operation (`:debit`)
    #    and a changeset that defines the update.
    |> Multi.update(:debit, 
        Account.changeset(from_account, %{balance: from_account.balance - amount})
       )
    # 3. Add the second operation: credit the `to_account`.
    |> Multi.update(:credit, 
        Account.changeset(to_account, %{balance: to_account.balance + amount})
       )
    # 4. Pass the Multi struct to `Repo.transaction`.
    #    Ecto will run these operations inside a database transaction.
    #    If any step fails, the entire transaction is rolled back.
    |> Repo.transaction()
  end
end

# --- Conceptual Test ---
IO.puts("Conceptual test for MoneyTransfer.transfer/3")

from_acc = %Bank.Account{id: 1, balance: 100.0}
to_acc = %Bank.Account{id: 2, balance: 50.0}
amount = 20.0

case MoneyTransfer.transfer(from_acc, to_acc, amount) do
  {:ok, results} ->
    IO.puts("  [PASS] Transaction succeeded conceptually.")
    IO.inspect(results, label: "Results map")
  {:error, failed_op, failed_value, _} ->
    IO.puts("  [FAIL] Transaction failed at step: #{failed_op} with value: #{inspect(failed_value)}")
end
