# Module 2: Distributed Systems Architecture with OTP (Extended)

This module dives into the heart of Elixir: the Open Telecom Platform (OTP). OTP is a set of libraries and design principles that provide a powerful foundation for building concurrent, distributed, and fault-tolerant systems. Understanding OTP is the single most important skill for a senior Elixir developer.

### Official Documentation
*   [Processes Guide](https://hexdocs.pm/elixir/Process.html)
*   [GenServer Guide](https://hexdocs.pm/elixir/GenServer.html)
*   [Supervisor Guide](https://hexdocs.pm/elixir/Supervisor.html)
*   [Erlang ETS Documentation](https://www.erlang.org/doc/man/ets.html)

---

## 1. The Actor Model and Processes

Elixir's concurrency is built on **Processes**, which are lightweight, isolated actors that communicate via messages. A senior engineer must understand the primitives that power OTP.

-   **Linking (`Process.link/1`):** Creates a bidirectional "death pact" between two processes. If one process crashes, it sends an exit signal that, by default, terminates the other. This is the foundation of how Supervisors work.
-   **Monitoring (`Process.monitor/1`):** A unidirectional notification system. If you monitor a process, you will receive a `{:DOWN, ...}` message in your mailbox if it crashes, but your process will not crash. This is for when you care if something is alive, but your fate isn't tied to it.

---

## 2. `GenServer`: The Workhorse of OTP

A `GenServer` is a process that encapsulates state and provides a standard client-server interface.

### Advanced GenServer Features
-   **Naming Processes:** When starting a GenServer, you can give it a name via the `:name` option (e.g., `name: MyModule`). This registers the name locally and allows you to send messages using the name instead of the PID, which is more convenient.
-   **Timeouts:** `GenServer.call/3` has a default timeout of 5000ms. If the server doesn't reply in time, the caller will exit. This prevents indefinite blocking.
-   **`handle_info/2`:** This callback is a catch-all for any message that is not a `call` or `cast`. It's commonly used for messages from monitored processes (`{:DOWN, ...}`) or for processes sending regular messages with `send/2`.

---

## 3. Supervisors and Fault Tolerance

A Supervisor's only job is to monitor its children and restart them according to a defined strategy.

### Child Specification in Detail
When you define children, you are creating a list of **child specifications**. A spec is a map that tells the supervisor *how* to manage the child.

```elixir
children = [
  %{
    id: MyWorker, # Unique ID for the child
    start: {MyWorker, :start_link, [:arg1, :arg2]}, # The MFA to start it
    restart: :permanent, # :permanent, :transient, or :temporary
    type: :worker # :worker or :supervisor
  }
]

Supervisor.init(children, strategy: :one_for_one)
```
-   `:restart` controls if the child is restarted.
    -   `:permanent`: Always restart.
    -   `:transient`: Restart only if it crashes abnormally.
    -   `:temporary`: Never restart.
-   `:type` tells the supervisor if it's supervising a worker or another supervisor, which affects shutdown timing.

### `DynamicSupervisor`
This is a specialized supervisor for when you don't know all the children upfront. Instead of a static list, you start children on-demand using `DynamicSupervisor.start_child/2`. This is perfect for scenarios like managing a process for each user connected via a websocket.
*   [Official Guide on DynamicSupervisor](https://hexdocs.pm/elixir/DynamicSupervisor.html)

---

## 4. Advanced State Management: ETS

While GenServers are great for managing state, they can become a bottleneck since all requests are handled sequentially by a single process. For state that needs to be accessed concurrently by many processes, **ETS (Erlang Term Storage)** is often the answer.

-   **What is it?** ETS is a powerful, in-memory key-value store built into OTP.
-   **Concurrency:** It allows for concurrent reads and writes from many processes, which is a major advantage over a single GenServer.
-   **Table Types:** Can be configured as a `set` (unique keys), `ordered_set`, `bag` (multiple objects per key), or `duplicate_bag`.
-   **Access Control:** Tables can be `public` (anyone can read/write), `protected` (anyone can read, only owner can write), or `private`.

**When to use ETS over GenServer?** Use ETS when you need high-performance, concurrent access to a large set of data that can be modeled as a key-value table.

---

## 5. Elixir Distribution

Elixir and OTP were designed for distribution from the ground up.

-   **Nodes:** An Elixir application running on a machine is a **node**.
-   **Naming Nodes:** You can give nodes names to make them discoverable on a network. This is done by starting the application with `--name` (long name, includes IP) or `--sname` (short name).
    ```bash
    iex --sname foo@localhost
    ```
-   **Connecting Nodes:** You can connect to another node with `Node.connect/1`. Once connected, message passing and process spawning are transparent.

```elixir
# On node foo@localhost
Node.connect(:'bar@localhost') #=> true

# Spawn a process on the remote node
Node.spawn(:'bar@localhost', fn -> IO.puts("Hello from foo!") end)
```
*   [Official Guide on Distribution](https://elixir-lang.org/getting-started/mix-otp/distribution-and-nodes.html)

---

## 6. The Application Behaviour

The `Application` behaviour is the entry point for an OTP system. Its `start/2` callback is responsible for starting the top-level supervisor, which in turn starts the rest of the processes in your application, forming the supervision tree.
