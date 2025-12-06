# Module 2: Advanced Software Architecture (DDD & Clean Architecture) (Extended)

This module covers the most important conceptual requirements for the senior role: "Clean Architecture and Domain-Driven Design." These paradigms are essential for building complex, maintainable, and scalable systems, especially in critical domains like finance.

## Part 1: Domain-Driven Design (DDD) in Python

DDD is about tackling complexity by modeling the core business domain.

### Tactical Patterns in Python

-   **Entity:** An object with a distinct identity. In Python, this is often a class with a unique ID. It is mutable.
    ```python
    @dataclass
    class Account:
        id: UUID
        balance: Money
        # ... other attributes
    ```

-   **Value Object:** An immutable object defined by its attributes. Use `@dataclass(frozen=True)` to create robust, immutable Value Objects.
    ```python
    @dataclass(frozen=True)
    class Money:
        amount: Decimal
        currency: str
    ```

-   **Aggregate:** A cluster of objects treated as a single unit to enforce business rules (**invariants**). The **Aggregate Root** is the only entry point.
    -   **Implementation:** The Aggregate Root is a class that holds references to other entities and value objects. Its methods contain the business logic to ensure consistency.
    ```python
    class Order:
        def __init__(self, id: OrderId, customer_id: CustomerId):
            self._id = id
            self._customer_id = customer_id
            self._lines: List[OrderLine] = []

        def add_item(self, product_id: ProductId, price: Money):
            # INVARIANT: An order cannot have more than 5 lines.
            if len(self._lines) >= 5:
                raise ValueError("Cannot add more than 5 items.")
            self._lines.append(OrderLine(product_id, price))
    ```

-   **Repository:** An abstraction over persistence. In Python, this is defined as an interface using `typing.Protocol` or an Abstract Base Class (`abc.ABC`).
    ```python
    class OrderRepository(Protocol):
        def get_by_id(self, id: OrderId) -> Optional[Order]: ...
        def save(self, order: Order) -> None: ...
    ```

---

## Part 2: Clean Architecture in Python

This design enforces separation of concerns, making the system testable and independent of frameworks.

### The Layers in Practice

-   **Entities:** Pure Python objects (often dataclasses) representing the core domain. No dependencies.

-   **Use Cases (Interactors):** Classes that orchestrate the business logic. They depend on Entity objects and Repository *interfaces* (Protocols), but not on concrete implementations.
    ```python
    # core/use_cases.py
    class TransferMoneyUseCase:
        def __init__(self, account_repo: AccountRepository):
            self._repo = account_repo

        def execute(self, from_id: UUID, to_id: UUID, amount: Money):
            # 1. Fetch aggregates
            from_acct = self._repo.get_by_id(from_id)
            to_acct = self._repo.get_by_id(to_id)

            # 2. Execute domain logic
            from_acct.debit(amount)
            to_acct.credit(amount)

            # 3. Save aggregates
            self._repo.save(from_acct)
            self._repo.save(to_acct)
    ```

-   **Interface Adapters:** The glue layer.
    -   **Controllers:** (e.g., a FastAPI endpoint function, a Django view) Parse the HTTP request and call the Use Case.
    -   **Gateways:** (e.g., `SqlAlchemyAccountRepository`) The concrete implementation of the Repository protocol. This is where the translation from the domain Entity to a database model (like a SQLAlchemy or Django ORM model) happens.

-   **Frameworks & Drivers:** The outermost layer. This includes the web framework (FastAPI, Django), the database driver (`psycopg2`), and the ORM (`SQLAlchemy`).

### The Dependency Rule & Inversion of Control

Dependencies only point inwards. The `UseCases` know about `Entities`, but `Entities` know nothing about `UseCases`. Crucially, the inner circles define abstractions (like the `AccountRepository` protocol), and the outer circles provide the concrete implementations. This is **Inversion of Control**, and it's what makes the core logic testable in isolation from the database or web framework.
