# Solution: Using a DynamicSupervisor

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

defmodule JobRunner do
  use DynamicSupervisor

  def start_link(_opts) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(:ok) do
    # DynamicSupervisors always use :one_for_one, so we just need to call super
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_job(job_name) do
    # The child spec can be a simple tuple for basic workers
    child_spec = {JobWorker, job_name}
    DynamicSupervisor.start_child(__MODULE__, child_spec)
  end

  def running_jobs do
    DynamicSupervisor.count_children(__MODULE__)
  end
end

# --- Tests ---
defmodule DynamicSupervisorTest do
  def run do
    IO.puts("Running DynamicSupervisor tests...")

    {:ok, _pid} = JobRunner.start_link([])

    assert JobRunner.running_jobs().active == 0, "Test 1: Starts with 0 jobs"

    {:ok, _pid1} = JobRunner.start_job("process_invoices")
    {:ok, _pid2} = JobRunner.start_job("send_emails")

    assert JobRunner.running_jobs().active == 2, "Test 2: Two jobs are running"
    
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

DynamicSupervisorTest.run()
