# Module 2 Exam Solutions: Distributed Systems with OTP (Extended)

---

**Question 1:** When should you use a `DynamicSupervisor` instead of a regular `Supervisor`?

**Answer:** B
**Explanation:** A `DynamicSupervisor` is the correct choice when child processes are not known at startup and need to be created and terminated on-demand. A regular `Supervisor` is for a static list of children that are known when the application starts.

---

**Question 2:** You need to store a large, shared cache of key-value data that will be read frequently and concurrently by many processes. Using a single `GenServer` is causing a performance bottleneck. What is the most idiomatic OTP solution?

**Answer:** C
**Explanation:** This is the primary use case for ETS. An ETS table allows for high-performance, concurrent reads and writes, solving the bottleneck issue of a single `GenServer` which processes all requests sequentially.

---

**Question 3:** A `Manager` process needs to be notified when a `Worker` process dies, but the `Manager` itself should NOT crash if the `Worker` crashes. Which mechanism should be used?

**Answer:** B
**Explanation:** `Process.monitor/1` creates a unidirectional link. The monitoring process (`Manager`) receives a `{:DOWN, ...}` message if the monitored process (`Worker`) dies, but its own lifecycle is not tied to it. `Process.link/1` would cause the `Manager` to crash by default.

---

**Question 4:** In a supervisor's child specification, what does the `restart: :transient` option mean?

**Answer:** C
**Explanation:** `:transient` tells the supervisor to only restart the child if it terminates due to an abnormal reason (any reason other than `:normal`, `:shutdown`, or `{:shutdown, term}`). If the process stops normally, it is not restarted.

---

**Question 5:** What is a key difference between storing state in a `GenServer` versus an ETS table?

**Answer:** B
**Explanation:** Access to a `GenServer`'s state is serialized through its message-passing interface, meaning it handles one request at a time. ETS is designed for high concurrency and allows many processes to read and write to the table simultaneously (with some caveats on write concurrency for `ordered_set`).
