# Module 5: Web Frameworks (Django & FastAPI)

This module covers how to use popular web frameworks like Django and FastAPI while adhering to the principles of Clean Architecture. The key is to treat the framework as a **delivery mechanism** and an implementation detail, not as the core of your application.

## 1. Frameworks as the Outermost Layer

In Clean Architecture, the web framework (Django, FastAPI, etc.) resides in the outermost layer: "Frameworks & Drivers." Its primary responsibilities are:

-   To handle HTTP requests and responses.
-   To parse incoming data (JSON bodies, query parameters).
-   To call the appropriate **Use Case** (Interactor) in the application layer.
-   To take the result from the Use Case and present it to the user (e.g., as a JSON response or an HTML page).

**Crucially, the business logic (Use Cases and Entities) should have zero knowledge of the web framework.** Your core application should be able to run without Django or FastAPI.

---

## 2. Django with Clean Architecture

Django is a powerful, "batteries-included" framework. Its default patterns encourage rapid development but can lead to tight coupling if not managed carefully.

**The Common Pitfall: Fat Views and Fat Models**

The default Django approach often leads to business logic being placed directly in `views.py` or in the methods of `models.py`. This is an anti-pattern in Clean Architecture because it mixes business logic with web concerns and database concerns.

**The Clean Approach:**

-   **`views.py` (The Controller):** The view should be extremely thin. Its only job is to act as a translator.
    1.  Parse the `HttpRequest`.
    2.  Extract relevant data.
    3.  Call the appropriate Use Case with simple, primitive data types.
    4.  Receive a result from the Use Case.
    5.  Pass the result to a Presenter or format an `HttpResponse`.

-   **`models.py` (The ORM Detail):** Django models are a database implementation detail. The core application (Entities) should be pure Python objects. The **Repository** layer is responsible for translating between your pure business Entities and the Django ORM models.

-   **Use Cases (`interactors.py` or `use_cases.py`):** These live *outside* your Django app directory (e.g., in a top-level `core` directory). They contain the pure business logic and know nothing about Django.

**Example Flow:**
```text
HttpRequest -> Django URL Router -> MyView.as_view() -> MyUseCase.execute() -> MyRepository.save() -> Django ORM -> DB
```

---

## 3. FastAPI with Clean Architecture

FastAPI's design makes implementing Clean Architecture more natural, primarily due to its built-in **Dependency Injection (DI)** system.

**The Advantage: Dependency Injection**

FastAPI allows you to "depend on" a function or a class in your path operation functions. FastAPI takes care of creating and providing an instance of that dependency.

This is the perfect mechanism for implementing the Dependency Rule. Your web layer can depend on your Use Case layer, and FastAPI will inject the Use Case for you.

**Example:**

```python
# --- In your core application (e.g., core/use_cases.py) ---
# This code has NO knowledge of FastAPI.
class CreateUserUseCase:
    def __init__(self, user_repo: UserRepository):
        self.user_repo = user_repo

    def execute(self, user_data: UserCreate) -> User:
        # ... business logic ...
        return self.user_repo.create(user_data)


# --- In your web layer (e.g., web/main.py) ---
from fastapi import FastAPI, Depends

app = FastAPI()

# This function tells FastAPI how to create the Use Case.
# This is the "composition root" where dependencies are wired together.
def get_create_user_use_case() -> CreateUserUseCase:
    db_repo = SQLUserRepository() # The concrete implementation
    return CreateUserUseCase(user_repo=db_repo)


@app.post("/users/")
def create_user_endpoint(
    user_data: UserCreateAPIModel, # Pydantic model for the web layer
    # FastAPI injects the use case here!
    use_case: CreateUserUseCase = Depends(get_create_user_use_case)
):
    # The endpoint is now just a thin wrapper around the use case.
    created_user = use_case.execute(user_data)
    return created_user
```

In this example, the `create_user_endpoint` is completely decoupled from how the `CreateUserUseCase` is created. The business logic lives purely in the use case, and the framework is just a delivery mechanism.
