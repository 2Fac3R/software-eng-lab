# Challenge: Using a DynamicSupervisor

# Instructions:
# Your task is to build a simple "Job Runner" system. A `JobRunner` supervisor
# will manage worker processes that are started on-demand.
#
# 1. The `JobRunner` module should use the `DynamicSupervisor` behaviour.
# 2. Implement a `start_job/1` function in `JobRunner` that takes a `job_name`.
#    This function should dynamically start a new `JobWorker` process as a child
#    of the `JobRunner` supervisor.
# 3. The `JobWorker` is a simple GenServer that just holds the job name as its state.

# --- Worker Module (already provided) ---
defmodule JobWorker do
  use GenServer

  def start_link(job_name) do
    GenServer.start_link(__MODULE__, job_name)
  end

  @impl true
  def init(job_name) do
    IO.puts("Starting worker for job: #{job_name}")
    {:ok, job_name}
  end
end

# --- Your Code Here ---
defmodule JobRunner do
  use DynamicSupervisor

  def start_link(_opts) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(:ok) do
    # TODO: Initialize the DynamicSupervisor with a :one_for_one strategy
  end

  def start_job(job_name) do
    # TODO: Define the child spec for the JobWorker
    # TODO: Use DynamicSupervisor.start_child/2 to start the worker
  end

  def running_jobs do
    # Helper to count children for the test
    DynamicSupervisor.count_children(__MODULE__)
  end
end

# --- Tests ---
defmodule DynamicSupervisorTest do
  def run do
    IO.puts("Running DynamicSupervisor tests...")

    {:ok, _pid} = JobRunner.start_link([])

    assert JobRunner.running_jobs()[:active] == 0, "Test 1: Starts with 0 jobs"

    JobRunner.start_job("process_invoices")
    JobRunner.start_job("send_emails")

    assert JobRunner.running_jobs()[:active] == 2, "Test 2: Two jobs are running"
    
    IO.puts("All tests passed!")
  end

  defp assert(result, expected, test_name) do
    if result == expected do
      IO.puts("  [PASS] #{test_name}")
    else
      IO.puts("  [FAIL] #{test_name} - Expected #{expected}, got #{result}")
      System.halt(1)
    end
  end
end

# DynamicSupervisorTest.run()
