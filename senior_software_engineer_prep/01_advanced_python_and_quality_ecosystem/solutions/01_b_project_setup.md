# Solution: Setting Up a Modern Python Project

This document shows the expected output and final state after completing the challenge.

### 1-4. Initial Setup

After creating the directory, initializing the `uv` environment, installing packages, and creating `pyproject.toml`, your directory should look like this:

```
my_quality_project/
├── .venv/
├── main.py
└── pyproject.toml
```

### 5. Initial `main.py`

This is the starting code with errors.
```python
# main.py
import sys

def greet( name: str, age:int):
    # This line is too long and has a type error
    print("Hello, " + name + "! You are " + age + " years old. Welcome to the project located at: " + sys.executable)

greet("Alice", "30")
```

### 6. Running the Tools (Expected Output)

**`ruff format .`**

After running the formatter, `main.py` will be automatically changed to:

```python
# main.py
import sys


def greet(name: str, age: int):
    # This line is too long and has a type error
    print(
        "Hello, "
        + name
        + "! You are "
        + age
        + " years old. Welcome to the project located at: "
        + sys.executable
    )


greet("Alice", "30")
```
*Ruff broke the long line into multiple lines to conform to the line-length limit.*

---

**`ruff check .`**

The linter will report several issues, including:
```
main.py:4:1: F841 Unused function `greet`.
main.py:6:29: E231 Missing whitespace after ','
...
```
*(Note: The exact errors might vary slightly with ruff versions, but it will catch unused imports, spacing issues, etc.)*

---

**`mypy .`**

The type checker will report the most critical error:
```
main.py:6: error: Unsupported operand types for + ("str" and "int")  [operator]
Found 1 error in 1 file (checked 1 source file)
```
*Mypy correctly identifies that you cannot use `+` to concatenate a string with an integer (`age`).*

### 7. Final `main.py` (After Fixes)

To fix the errors, you should use an f-string for formatting and pass the correct type for the `age` argument.

```python
# main.py
import sys


def greet(name: str, age: int) -> None:
    """Greets the user."""
    print(
        f"Hello, {name}! You are {age} years old. "
        f"Welcome to the project located at: {sys.executable}"
    )


greet("Alice", 30)
```

**Verification:**

*   Running `ruff format .` now makes no changes.
*   Running `ruff check .` now reports no errors.
*   Running `mypy .` now reports `Success: no issues found in 1 source file`.
