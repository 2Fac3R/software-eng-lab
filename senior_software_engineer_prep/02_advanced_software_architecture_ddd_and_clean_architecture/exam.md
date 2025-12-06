# Module 2 Exam: Advanced Software Architecture (Extended)

**Instructions:** Choose the best answer for each question.

---

**Question 1:** In a Python application using Clean Architecture, what is the best way to define the contract for a Repository in the application layer, ensuring that different persistence technologies could be used?

A) A concrete class with methods that call the Django ORM directly.
B) A simple dictionary.
C) A `typing.Protocol` or an `abc.ABC` (Abstract Base Class).
D) A function that takes a database connection string.

---

**Question 2:** In Domain-Driven Design, what is the primary purpose of an Aggregate?

A) To group all objects of the same type together.
B) To provide an abstraction over the database.
C) To treat a cluster of related objects as a single unit of consistency and enforce business rules (invariants).
D) To define the public API of a Bounded Context.

---

**Question 3:** You are modeling a `Currency` object that only has a `code` (e.g., "USD"). Two instances of `Currency` with the code "USD" should be considered identical and interchangeable. This object should be immutable. Which Python feature is most idiomatic for creating this?

A) A standard class with a custom `__init__`.
B) A `typing.TypedDict`.
C) A `@dataclass(frozen=True)`.
D) A global dictionary.

---

**Question 4:** In Clean Architecture, which layer contains the application-specific business logic, such as a "TransferFunds" use case?

A) Entities
B) Use Cases (Interactors)
C) Interface Adapters
D) Frameworks & Drivers

---

**Question 5:** According to The Dependency Rule, which of these `import` statements is a clear violation if found inside a file defining a core domain Entity?

A) `from dataclasses import dataclass`
B) `from decimal import Decimal`
C) `from fastapi import HTTPException`
D) `from typing import Optional`
