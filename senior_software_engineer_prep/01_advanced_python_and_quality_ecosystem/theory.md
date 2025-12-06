# Module 1: Advanced Python and Quality Ecosystem (Extended)

This module covers the foundational practices expected of a modern senior Python developer. It goes beyond basic syntax to focus on writing code that is robust, maintainable, and verifiable, using a state-of-the-art toolchain.

### Official Documentation
*   [The `dataclasses` module](https://docs.python.org/3/library/dataclasses.html)
*   [Python Concurrency Docs (`threading`, `multiprocessing`, `asyncio`)](https://docs.python.org/3/library/concurrency.html)

---

## 1. Idiomatic and Effective Python

-   **Comprehensions & Generators:** Use comprehensions for concise list/dict creation and generators for memory-efficient iteration over large datasets.
-   **Context Managers (`with` statement):** Guarantee resource cleanup (e.g., files, network connections).
-   **Dataclasses:** A decorator for creating classes that primarily store data. It automatically generates methods like `__init__()`, `__repr__()`, and `__eq__()`, reducing boilerplate code.
    ```python
    from dataclasses import dataclass

    @dataclass
    class InventoryItem:
        name: str
        unit_price: float
        quantity: int = 0
    ```
-   **Decorators:** A decorator is a function that takes another function and extends its behavior without explicitly modifying it. This is a powerful tool for concerns like logging, timing, or authentication.
    ```python
    import time

    def timer(func):
        def wrapper(*args, **kwargs):
            start_time = time.time()
            result = func(*args, **kwargs)
            end_time = time.time()
            print(f"{func.__name__} ran in {end_time - start_time:.4f}s")
            return result
        return wrapper

    @timer
    def some_heavy_task():
        # ...
    ```

---

## 2. Advanced Static Typing (`PEP 484`)

Static typing with `mypy` catches bugs before runtime. A senior developer should be comfortable with advanced typing patterns.
-   **`Protocol`:** For static duck typing. Defines an interface an object must have to be considered a certain type.
-   **`TypeVar`:** For creating generic functions and classes.
-   **`Callable`:** For describing function signatures.

---

## 3. Data Validation with `Pydantic`

Pydantic uses type hints to perform data validation, serialization, and settings management. It's the standard for data-intensive applications.

---

## 4. Introduction to Concurrency in Python

Python offers three main models for concurrency, each suited for different tasks.

-   **`threading`:**
    -   **Use Case:** Best for **I/O-bound** tasks (e.g., making multiple network requests, reading many files). While one thread is waiting for I/O, the Python interpreter can switch to another thread.
    -   **Limitation:** Due to the Global Interpreter Lock (GIL) in CPython, only one thread can execute Python bytecode at a time. This means `threading` does not provide true parallelism for CPU-bound code.

-   **`multiprocessing`:**
    -   **Use Case:** Best for **CPU-bound** tasks (e.g., heavy calculations, data processing). It bypasses the GIL by creating separate processes, each with its own Python interpreter and memory space. This allows for true parallel execution on multi-core machines.
    -   **Limitation:** Higher memory overhead and more complex inter-process communication (IPC) compared to threads.

-   **`asyncio` (`async`/`await`):**
    -   **Use Case:** A modern approach to high-performance **I/O-bound** tasks, especially for high-throughput network services. It uses a single thread and an event loop to manage tens of thousands of concurrent connections efficiently.
    -   **How it works:** The `await` keyword tells the event loop that a task is waiting for I/O, allowing the loop to run other tasks in the meantime.

---

## 5. The Modern Quality Toolchain

-   **`uv`:** An extremely fast package installer and virtual environment manager.
-   **`ruff`:** An extremely fast linter and code formatter.
-   **`mypy`:** The standard for static type checking.

These tools are typically configured in the `pyproject.toml` file.
