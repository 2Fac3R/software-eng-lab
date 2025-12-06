# Module 2: Advanced Software Architecture - Cheatsheet (Extended)

---

### Clean Architecture Diagram

**The Dependency Rule:** Dependencies must always flow from an outer layer to an inner layer.

```text
+----------------------------------------------------+
|                Frameworks & Drivers                |  <-- (e.g., FastAPI, PostgreSQL)
| +------------------------------------------------+ |
| |              Interface Adapters                | |  <-- (e.g., Controllers, Repositories)
| | +------------------------------------------+ | |
| | |                Use Cases                 | | |  <-- (Application Business Logic)
| | | +------------------------------------+ | | |
| | | |              Entities              | | | |  <-- (Core Domain Logic)
| | | +------------------------------------+ | | |
| | +------------------------------------------+ | |
| +------------------------------------------------+ |
+----------------------------------------------------+
```

---

### Domain-Driven Design (DDD) Glossary

| Term | Description |
| :--- | :--- |
| **Ubiquitous Language** | A shared language between developers and domain experts. |
| **Bounded Context** | A boundary within which a specific domain model is consistent. |
| **Entity** | An object with a unique identity that persists over time. |
| **Value Object** | An immutable object defined by its attributes. Use `@dataclass(frozen=True)`. |
| **Aggregate** | A cluster of objects treated as a single unit to enforce business rules (invariants). |
| **Aggregate Root** | The single entry point for all modifications to an Aggregate. |
| **Repository** | An abstraction over data persistence (e.g., a `typing.Protocol`). |

**Value Object Example in Python:**
```python
from dataclasses import dataclass

@dataclass(frozen=True)
class Money:
    amount: Decimal
    currency: str

    def __post_init__(self):
        if self.amount < 0:
            raise ValueError("Amount cannot be negative.")
```
