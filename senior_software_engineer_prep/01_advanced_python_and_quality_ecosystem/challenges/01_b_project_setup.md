# Challenge: Setting Up a Modern Python Project

**Goal:**

Your task is to set up a new Python project from scratch using the modern toolchain discussed in this module: `uv`, `ruff`, and `mypy`.

**Instructions:**

Follow these steps in your terminal.

1.  **Create Project Directory:**
    Create a new directory for your project and navigate into it.
    ```bash
    mkdir my_quality_project
    cd my_quality_project
    ```

2.  **Initialize Virtual Environment:**
    Use `uv` to create a new virtual environment.
    ```bash
    uv venv
    ```
    After this, activate the environment.
    *   On macOS/Linux: `source .venv/bin/activate`
    *   On Windows: `.venv\Scripts\activate`

3.  **Install Tools:**
    Use `uv` to install the necessary development dependencies.
    ```bash
    uv pip install ruff mypy
    ```

4.  **Configure Tools:**
    Create a `pyproject.toml` file in the root of your project and add the following configuration for `ruff` and `mypy`. This sets basic rules for formatting and type checking.

    ```toml
    # pyproject.toml

    [tool.ruff]
    select = ["E", "F", "W", "I", "UP"] # Enable several standard rules
    line-length = 90

    [tool.ruff.isort]
    known-first-party = ["my_app"]

    [tool.mypy]
    python_version = "3.11"
    warn_return_any = true
    warn_unused_configs = true
    disallow_untyped_defs = true # Enforce type hints on all functions
    ```

5.  **Create a Sample Python File:**
    Create a file named `main.py` and add the following code. It contains some intentional type errors and formatting issues.

    ```python
    # main.py
    import sys

    def greet( name: str, age:int):
        # This line is too long and has a type error
        print("Hello, " + name + "! You are " + age + " years old. Welcome to the project located at: " + sys.executable)

    greet("Alice", "30")
    ```

6.  **Run the Tools:**
    Now, run the quality tools from your terminal and observe the output.

    *   **Run `ruff` to format the code:**
        ```bash
        ruff format .
        ```
        Check `main.py`. How did it change?

    *   **Run `ruff` to check for linting errors:**
        ```bash
        ruff check .
        ```
        What errors does it report?

    *   **Run `mypy` to check for type errors:**
        ```bash
        mypy .
        ```
        What type error does it find?

7.  **Fix the Code:**
    Manually fix the errors in `main.py` based on the feedback from the tools. Then, run `ruff check .` and `mypy .` again to confirm that all issues are resolved.
