# Module 2 Exam Solutions: Advanced Software Architecture (Extended)

---

**Question 1:** In a Python application using Clean Architecture, what is the best way to define the contract for a Repository in the application layer, ensuring that different persistence technologies could be used?

**Answer:** C
**Explanation:** A `typing.Protocol` or an Abstract Base Class (`abc.ABC`) defines an interface without a concrete implementation. The Use Case layer depends on this abstraction, and the Infrastructure layer provides a concrete implementation (e.g., `SQLAlchemyRepository`), adhering to the Dependency Inversion Principle.

---

**Question 2:** In Domain-Driven Design, what is the primary purpose of an Aggregate?

**Answer:** C
**Explanation:** An Aggregate is a consistency boundary. It groups entities and value objects that must be consistent with each other and uses an Aggregate Root to ensure that business rules (invariants) are never violated when the state changes.

---

**Question 3:** You are modeling a `Currency` object that only has a `code` (e.g., "USD"). Two instances of `Currency` with the code "USD" should be considered identical and interchangeable. This object should be immutable. Which Python feature is most idiomatic for creating this?

**Answer:** C
**Explanation:** This describes a Value Object. The `@dataclass(frozen=True)` decorator is the perfect tool in modern Python to create simple, immutable classes whose equality is based on their attributes.

---

**Question 4:** In Clean Architecture, which layer contains the application-specific business logic, such as a "TransferFunds" use case?

**Answer:** B
**Explanation:** The Use Cases (or Interactors) layer is explicitly responsible for orchestrating the application-specific business rules. It directs the Entities to perform their core business logic to achieve a specific application goal.

---

**Question 5:** According to The Dependency Rule, which of these `import` statements is a clear violation if found inside a file defining a core domain Entity?

**Answer:** C
**Explanation:** The Dependency Rule states that inner layers (like Entities) cannot know anything about outer layers (like Frameworks). Importing `fastapi` (or Django, Flask, etc.) in a core domain entity file is a direct violation of this rule. The entity must be independent of the delivery mechanism.
