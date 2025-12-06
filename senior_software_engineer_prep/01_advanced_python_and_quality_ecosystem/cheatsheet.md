# Module 1: Advanced Python & Quality Ecosystem - Cheatsheet (Extended)

---

### Concurrency Models

| Model | Best For | Key Characteristic |
| :--- | :--- | :--- |
| **`threading`** | I/O-bound tasks (network, disk) | Bypasses I/O waits, but limited by GIL for CPU tasks. |
| **`multiprocessing`** | CPU-bound tasks (calculations) | True parallelism by using multiple processes; bypasses GIL. |
| **`asyncio`** | High-throughput I/O (networking) | Single-threaded; uses an event loop to manage many concurrent tasks. |

---

### Dataclass Quick Reference

```python
from dataclasses import dataclass, field

@dataclass(frozen=True) # frozen=True makes instances immutable
class User:
    id: int
    username: str
    is_active: bool = True
    # Use default_factory for mutable defaults
    roles: list[str] = field(default_factory=list)
```

---

### Decorator Template

A decorator is a function that wraps another function to add behavior.

```python
import functools

def my_decorator(func):
    @functools.wraps(func) # Preserves original function metadata
    def wrapper(*args, **kwargs):
        print("Something is happening before the function is called.")
        result = func(*args, **kwargs)
        print("Something is happening after the function is called.")
        return result
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")
```

---

### Pydantic `BaseModel` Quick Reference

```python
from pydantic import BaseModel, Field, EmailStr

class Item(BaseModel):
    name: str = Field(..., min_length=3)
    price: float = Field(..., gt=0)
    owner_email: EmailStr
```

---

### Common `uv` Commands

| Command | Description |
| :--- | :--- |
| `uv venv` | Creates a virtual environment. |
| `uv pip install -r r.txt` | Installs packages from a requirements file. |
| `uv pip sync r.txt` | Synchronizes the environment to match a requirements file exactly. |
