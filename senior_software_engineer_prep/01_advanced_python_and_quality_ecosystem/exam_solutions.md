# Module 1 Exam Solutions: Advanced Python & Quality Ecosystem (Extended)

---

**Question 1:** You have a CPU-bound task that involves heavy mathematical calculations on a large dataset. To speed it up on a multi-core machine, which Python module should you use?

**Answer:** C
**Explanation:** `multiprocessing` bypasses the Global Interpreter Lock (GIL) by creating separate processes, allowing for true parallel execution on multiple CPU cores. This makes it the ideal choice for CPU-bound work.

---

**Question 2:** What is the primary purpose of the `@dataclass` decorator?

**Answer:** B
**Explanation:** The `@dataclass` decorator is a code generator that automatically adds special methods like `__init__()`, `__repr__()`, `__eq__()`, and others to a class, which significantly reduces boilerplate code for classes that primarily store data.

---

**Question 3:** A developer writes a function that wraps another function to log its execution time. What is this pattern called?

**Answer:** C
**Explanation:** This is the definition of a Decorator. It's a function that takes another function as an argument, adds functionality (the wrapper), and returns the new function.

---

**Question 4:** You are building a high-performance network server that needs to handle thousands of simultaneous, non-blocking I/O operations (e.g., web sockets). Which concurrency model is most suitable for this task?

**Answer:** C
**Explanation:** `asyncio` is specifically designed for high-concurrency I/O operations. It uses a single-threaded event loop to manage many non-blocking tasks efficiently, making it a perfect fit for network applications.

---

**Question 5:** What is the key limitation of Python's `threading` module for CPU-bound tasks in CPython?

**Answer:** B
**Explanation:** The Global Interpreter Lock (GIL) is a mutex that protects access to Python objects, preventing multiple threads from executing Python bytecode at the same time. While it simplifies memory management, it effectively makes Python threading single-core for CPU-bound tasks.
