# Module 1 Exam: Advanced Python and Quality Ecosystem (Extended)

**Instructions:** Choose the best answer for each question.

---

**Question 1:** You have a CPU-bound task that involves heavy mathematical calculations on a large dataset. To speed it up on a multi-core machine, which Python module should you use?

A) `threading`
B) `asyncio`
C) `multiprocessing`
D) `pydantic`

---

**Question 2:** What is the primary purpose of the `@dataclass` decorator?

A) To add static typing to a class.
B) To automatically generate boilerplate methods like `__init__` and `__repr__` for classes that store data.
C) To turn a class into a function decorator.
D) To validate the data types of class attributes at runtime.

---

**Question 3:** A developer writes a function that wraps another function to log its execution time. What is this pattern called?

A) A Metaclass
B) A Generator
C) A Decorator
D) A Context Manager

---

**Question 4:** You are building a high-performance network server that needs to handle thousands of simultaneous, non-blocking I/O operations (e.g., web sockets). Which concurrency model is most suitable for this task?

A) `threading`
B) `multiprocessing`
C) `asyncio`
D) A combination of `threading` and `multiprocessing`.

---

**Question 5:** What is the key limitation of Python's `threading` module for CPU-bound tasks in CPython?

A) It cannot run tasks in the background.
B) The Global Interpreter Lock (GIL) prevents multiple threads from executing Python bytecode in parallel.
C) It is slower than `asyncio` for I/O-bound tasks.
D) It does not support sharing data between threads.
