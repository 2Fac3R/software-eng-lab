# Module 2 Exam: Distributed Systems with OTP (Extended)

**Instructions:** Choose the best answer for each question.

---

**Question 1:** When should you use a `DynamicSupervisor` instead of a regular `Supervisor`?

A) When you need a restart strategy other than `:one_for_one`.
B) When the child processes need to be started and stopped on-demand at runtime.
C) When you want to supervise other supervisors.
D) When you need to limit the number of restarts.

---

**Question 2:** You need to store a large, shared cache of key-value data that will be read frequently and concurrently by many processes. Using a single `GenServer` is causing a performance bottleneck. What is the most idiomatic OTP solution?

A) Use `Process.put/2` to store data in the process dictionary.
B) Create a pool of `GenServer` workers.
C) Use an ETS (Erlang Term Storage) table with `read_concurrency` enabled.
D) Link all processes together so they can share data.

---

**Question 3:** A `Manager` process needs to be notified when a `Worker` process dies, but the `Manager` itself should NOT crash if the `Worker` crashes. Which mechanism should be used?

A) `Process.link(worker_pid)`
B) `Process.monitor(worker_pid)`
C) `GenServer.call(worker_pid, :ping)`
D) `Supervisor.start_child(manager_pid, worker_spec)`

---

**Question 4:** In a supervisor's child specification, what does the `restart: :transient` option mean?

A) The child process will never be restarted.
B) The child process will always be restarted.
C) The child process will only be restarted if it terminates abnormally (not with a `:normal` exit reason).
D) The child process will be restarted, along with all processes started after it.

---

**Question 5:** What is a key difference between storing state in a `GenServer` versus an ETS table?

A) `GenServer` state is persistent to disk, while ETS is in-memory only.
B) Access to `GenServer` state is sequential (serialized through the process mailbox), while ETS allows for concurrent access.
C) Only the process that created a `GenServer` can access it, while ETS is always public.
D) `GenServer` state is mutable, while ETS data is immutable.

