# Module 2: Distributed Systems with OTP - Cheatsheet (Extended)

---

### GenServer: `call` vs. `cast` vs. `info`

| Feature | `GenServer.call/3` | `GenServer.cast/2` | `handle_info/2` |
| :--- | :--- | :--- | :--- |
| **Behavior** | **Synchronous** | **Asynchronous** | **Asynchronous** |
| **Source** | External client | External client | Internal (another process, VM) |
| **Reply** | Must reply | No reply | No reply |
| **Use Case** | Reading state | Updating state | Receiving messages from monitored processes or plain `send/2`. |

---

### Supervisor Strategies & Specs

-   **Strategies:** `:one_for_one`, `:one_for_all`, `:rest_for_one`.
-   **Child Spec:** A map defining how to start/manage a child.
    ```elixir
    child_spec = %{
      id: MyWorker,          # Unique ID
      start: {MyWorker, :start_link, [arg]},
      restart: :permanent,   # :permanent, :transient, :temporary
      type: :worker          # :worker or :supervisor
    }
    ```

### `DynamicSupervisor`

-   **Purpose:** For supervising children that are started and stopped dynamically.
-   **Strategy:** Always `:one_for_one`.
-   **Usage:**
    ```elixir
    # Start the supervisor
    DynamicSupervisor.start_link(strategy: :one_for_one, name: MyPool)

    # Start a child on demand
    DynamicSupervisor.start_child(MyPool, {MyWorker, worker_arg})
    ```

---

### State Management: GenServer vs. ETS

| Feature | `GenServer` | `ETS` (Erlang Term Storage) |
| :--- | :--- | :--- |
| **Concurrency** | **Sequential**. All requests are processed one by one. | **Concurrent**. Allows simultaneous reads and writes from many processes. |
| **Access** | Via the GenServer's PID (message passing). | Via the table identifier. Can be public. |
| **Data Model** | Any Elixir term. | A key-value table of tuples. |
| **Use Case** | Encapsulating state with complex logic; when sequential access is required. | High-performance, concurrent cache; shared lookup tables; when you need to avoid a GenServer bottleneck. |

**Creating an ETS table:**
```elixir
# Create a named, public table where other processes can write
:ets.new(:my_table, [:set, :public, :named_table])

# Insert data
:ets.insert(:my_table, {"some_key", "some_value"})

# Lookup data
:ets.lookup(:my_table, "some_key")
```
