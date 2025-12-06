# Solution for: Build a GenServer Counter

defmodule Counter do
  use GenServer

  # --- Client API ---

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  @doc """Increments the counter by 1."""
  def increment do
    # Use `cast` for asynchronous updates where no reply is needed.
    GenServer.cast(__MODULE__, :increment)
  end

  @doc """Gets the current counter value."""
  def get do
    # Use `call` for synchronous requests where a reply is expected.
    GenServer.call(__MODULE__, :get)
  end

  # --- Server Callbacks ---

  @impl true
  def init(initial_value) do
    # The initial state of our server is the counter's value.
    {:ok, initial_value}
  end

  @impl true
  def handle_cast(:increment, state) do
    # Increment the state and return it.
    new_state = state + 1
    {:noreply, new_state}
  end

  @impl true
  def handle_call(:get, _from, state) do
    # The first element of the tuple is the reply to send to the client.
    # The state remains unchanged for a `:get` request.
    {:reply, state, state}
  end
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
