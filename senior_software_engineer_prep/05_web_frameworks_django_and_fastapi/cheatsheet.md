# Module 5: Web Frameworks - Cheatsheet

---

### Clean Architecture Request Flow (Django/FastAPI)

This diagram shows how a request flows through the layers of a Clean Architecture.

```text
+-----------------------+
|       Browser         |
+-----------------------+
           |
           v (HTTP Request)
+-----------------------+
|   Web Framework       |
| (Django/FastAPI View) |
+-----------------------+
           |
           v (Calls Use Case with simple DTO)
+-----------------------+
|      Controller       |  <-- Interface Adapters
+-----------------------+
           |
           v (Executes business logic)
+-----------------------+
|       Use Case        |
|     (Interactor)      |
+-----------------------+
           |
           v (Operates on Entities)
+-----------------------+
|        Entities       |
+-----------------------+
           |
           v (Persistence via Repository Interface)
+-----------------------+
|      Repository       |  <-- Interface Adapters
|    (Implementation)   |
+-----------------------+
           |
           v (Talks to DB)
+-----------------------+
|       Database        |
+-----------------------+
```

---

### Django Clean Architecture Mapping

| Architectural Layer | Typical Location in Project |
| :--- | :--- |
| **Entities** | `core/domain/models.py` (Pure Python classes) |
| **Use Cases** | `core/application/use_cases.py` |
| **Repository Interfaces** | `core/application/repositories.py` |
| **Controllers/Presenters** | `my_django_app/views.py` (kept very thin) |
| **Repository Impls.** | `infrastructure/persistence/django_repositories.py` |
| **Framework** | `my_django_project/` and `my_django_app/` |

**Key Idea:** The `core/` directory should have **zero** imports from Django.

---

### FastAPI Dependency Injection Snippet

FastAPI's `Depends` makes implementing the Dependency Rule straightforward.

```python
from fastapi import Depends, FastAPI

# --- Core Layer (no FastAPI knowledge) ---
class MyService:
    def do_work(self) -> str:
        return "Work done!"

# --- Infrastructure Layer ---
# This is the "factory" for the service.
def get_my_service() -> MyService:
    # In a real app, you might initialize with a db connection, etc.
    return MyService()

# --- Web Layer ---
app = FastAPI()

@app.get("/")
def read_root(
    # 1. The endpoint declares its dependency on `MyService`.
    # 2. It provides the factory function `get_my_service`.
    # 3. FastAPI calls the factory and injects the resulting object.
    service: MyService = Depends(get_my_service)
):
    # 4. The endpoint uses the dependency, decoupled from its creation.
    result = service.do_work()
    return {"message": result}
```
