# Solution for: Build a Supervision Tree

defmodule Worker do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state)
  end

  def crash do
    # A simple way to force a crash
    exit(:boom)
  end

  @impl true
  def init(state) do
    IO.puts("Worker starting with state: #{inspect(state)}")
    {:ok, state}
  end
end

defmodule App.Supervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      # This is a child specification. It tells the supervisor
      # how to start the child process. Here, it's just the module name.
      {Worker, []}
    ]

    # Initialize the supervisor with the list of children and a restart strategy.
    Supervisor.init(children, strategy: :one_for_one)
  end
end

# --- Tests ---
defmodule SupervisorTest do
  def run do
    IO.puts("Running Supervisor tests...")

    # Start the supervisor
    {:ok, sup_pid} = App.Supervisor.start_link([])
    IO.puts("Supervisor started with PID: #{inspect(sup_pid)}")

    # Find the initial worker PID
    [initial_worker_pid] = Supervisor.which_children(sup_pid) |> Enum.map(&elem(&1, 0))
    IO.puts("Initial worker PID: #{inspect(initial_worker_pid)}")

    # Crash the worker
    IO.puts("Crashing the worker...")
    # We must unlink from the test process so it doesn't crash too.
    # Then we link to the worker so we can trap its exit signal.
    Process.unlink(initial_worker_pid)
    Process.link(initial_worker_pid)

    try do
      # This will cause an exit signal to be sent to the linked test process
      GenServer.stop(initial_worker_pid, :shutdown)
    catch
      :exit, _ -> IO.puts("Worker crashed as expected.")
    end

    # Give the supervisor a moment to restart the child
    Process.sleep(100)

    # Find the new worker PID
    children = Supervisor.which_children(sup_pid)
    if length(children) == 0 do
      IO.puts("  [FAIL] Supervisor did not restart the child.")
      System.halt(1)
    end
    [new_worker_pid] = children |> Enum.map(&elem(&1, 0))
    IO.puts("New worker PID: #{inspect(new_worker_pid)}")

    # Assert that the worker was restarted (i.e., it has a new PID)
    if new_worker_pid != initial_worker_pid and Process.alive?(new_worker_pid) do
      IO.puts("  [PASS] Worker was restarted successfully.")
    else
      IO.puts("  [FAIL] Worker was not restarted or has the same PID.")
      System.halt(1)
    end

    IO.puts("All tests passed!")
  end
end

SupervisorTest.run()
