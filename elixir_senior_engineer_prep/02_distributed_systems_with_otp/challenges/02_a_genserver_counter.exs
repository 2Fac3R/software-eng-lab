# Challenge: Build a GenServer Counter

# Instructions:
# Your task is to implement a GenServer that acts as a simple integer counter.
#
# 1. Implement the `init/1` callback to set the initial state of the counter to 0.
# 2. Implement a `handle_cast/2` for the `:increment` message. It should increase the counter by 1.
# 3. Implement a `handle_call/3` for the `:get` message. It should return the current value of the counter.
# 4. Complete the client API functions `increment/0` and `get/0`.

defmodule Counter do
  use GenServer

  # --- Client API ---

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  @doc """Increments the counter by 1."""
  def increment do
    # Your implementation here
  end

  @doc """Gets the current counter value."""
  def get do
    # Your implementation here
  end

  # --- Server Callbacks ---

  # @impl true
  # Your implementation here for init/1

  # @impl true
  # Your implementation here for handle_cast/2

  # @impl true
  # Your implementation here for handle_call/3

end

# --- Tests ---
defmodule CounterTest do
  def run do
    IO.puts("Running Counter GenServer tests...")

    # Start the server
    {:ok, _pid} = Counter.start_link([])

    # Initial value should be 0
    assert(Counter.get() == 0, "Test 1: Initial value")

    # Increment a few times
    Counter.increment()
    Counter.increment()
    Counter.increment()

    # Value should be 3
    assert(Counter.get() == 3, "Test 2: Value after increments")

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

CounterTest.run()
