# Module 4: Advanced Software Design & Architecture (Extended)

This module covers the high-level thinking required of a senior engineer: "expertise in software development best practices, design patterns, and system architecture." We will focus on how these principles apply specifically to a functional language like Elixir and discuss the trade-offs involved.

### Official Documentation & Resources
*   [SOLID Principles by Uncle Bob](https://en.wikipedia.org/wiki/SOLID)
*   [GraphQL Official Site](https://graphql.org/)
*   [Absinthe: The GraphQL toolkit for Elixir](https://hexdocs.pm/absinthe/overview.html)

---

## 1. SOLID Principles in a Functional Context

-   **S - Single Responsibility Principle (SRP):** A module should have one reason to change. Achieved through small, focused modules (e.g., `MyApp.Users`, `MyApp.Users.Notifier`).
-   **O - Open/Closed Principle:** Open for extension, closed for modification. Achieved via **Behaviours**. You can add new implementations of a behaviour without changing the original contract.
-   **L - Liskov Substitution Principle (LSP):** Any module implementing a behaviour should be substitutable for another implementation without breaking the system.
-   **I - Interface Segregation Principle (ISP):** Keep behaviours small and focused. Prefer many specific behaviours over one large one.
-   **D - Dependency Inversion Principle (DIP):** Depend on abstractions (behaviours), not on concrete implementations. This is achieved by passing modules as arguments or using configuration, which is central to testing.

---

## 2. Architectural Patterns

### Railway Oriented Programming (ROP)
This pattern, implemented in Elixir with the `with` statement, is essential for creating robust pipelines where any step can fail. It cleanly separates the "happy path" from all possible error paths.

### CQRS (Command Query Responsibility Segregation)
CQRS is an architectural pattern that separates the models used for *writing* data (Commands) from the models used for *reading* data (Queries).

-   **Commands:** They represent an intent to change the state of the system (e.g., `CreateUser`, `UpdateOrderStatus`). They are processed and can be validated, but they do not return data.
-   **Queries:** They retrieve data and return it, but they never modify the state.

**Why is this useful?**
-   **Optimization:** You can have a highly normalized database schema for writing (to ensure consistency) and a separate, denormalized, and optimized read model (or even multiple read models) for fast queries.
-   **Scalability:** The read and write workloads can be scaled independently.
-   **Fit with EDA:** CQRS works perfectly with Event-Driven Architectures. Commands generate events, and consumers process these events to update the read models.

### Documenting Decisions: ADRs
An **Architectural Decision Record (ADR)** is a short document that captures an important architectural decision. For a senior engineer, justifying trade-offs is key.
-   **Structure:** Title, Status (proposed, accepted), Context (the problem), Decision (what was decided), and Consequences (the trade-offs, future implications).
-   **Example:** An ADR could document the decision to use Kafka over RabbitMQ, explaining the trade-offs made regarding performance, ordering guarantees, and operational complexity.

---

## 3. API Design: REST vs. GraphQL

-   **REST:** The standard for many years. Well-understood and leverages HTTP semantics perfectly.
    -   **Trade-off:** Can be rigid. Clients may need to make multiple requests to assemble a complete view (under-fetching) or receive too much data (over-fetching).
-   **GraphQL:** A query language for APIs. The client specifies exactly the data it needs.
    -   **Trade-off:** More flexible for the client, but adds complexity to the server (resolving queries, security, caching). The `Absinthe` library is the standard for GraphQL in Elixir.

---

## 4. Designing for Maintainability

-   **Explicitness over Implicitness:** Elixir culture values clear, readable code. Avoid overly clever "magic". A new developer should be able to understand the flow of data.
-   **Configuration:** Externalize configuration (API keys, hostnames) using `config/runtime.exs`. Never hardcode configuration values.
-   **Contexts (Phoenix):** Even if not using Phoenix, the idea of a "Context" module as a public API for a domain is a powerful way to enforce boundaries and hide implementation details.
