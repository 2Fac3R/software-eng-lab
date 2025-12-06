# Challenge: Build a Supervision Tree

# Instructions:
# Your task is to create a supervisor that manages a simple worker process.
# The `Worker` module is already provided. It can be started with an initial state,
# and it has a function `crash/0` that forces it to exit.
#
# 1. Complete the `App.Supervisor.init/1` callback.
# 2. The supervisor should start ONE child process using the `Worker` module.
# 3. Use the `:one_for_one` restart strategy.
# 4. The test script will start your supervisor, find the worker's PID, crash it,
#    and then check if the supervisor has restarted it (it will have a new PID).

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
      # TODO: Add the child specification for the Worker process here.
      # The worker should be started with an initial state of `[]`.
    ]

    # TODO: Initialize the supervisor with the children and the :one_for_one strategy.
    # Supervisor.init(..., ...)
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
    try do
      Process.link(initial_worker_pid)
      Worker.crash()
    catch
      :exit, _ -> IO.puts("Worker crashed as expected.")
    end

    # Give the supervisor a moment to restart the child
    Process.sleep(100)

    # Find the new worker PID
    [new_worker_pid] = Supervisor.which_children(sup_pid) |> Enum.map(&elem(&1, 0))
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
