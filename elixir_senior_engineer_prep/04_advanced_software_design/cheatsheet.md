# Module 4: Advanced Software Design - Cheatsheet (Extended)

---

### SOLID Principles in Elixir

| Principle | Acronym | Elixir Implementation |
| :--- | :--- | :--- |
| **S**ingle Responsibility | SRP | **Small, focused modules** with a single purpose. |
| **O**pen/Closed | OCP | **Behaviours** to define contracts that can be extended with new modules. |
| **L**iskov Substitution | LSP | Adherence to **Behaviours**. Implementations can be swapped. |
| **I**nterface Segregation | ISP | **Small, focused Behaviours** instead of large, general ones. |
| **D**ependency Inversion | DIP | **Passing modules as arguments** or using config. Depend on abstractions. |

---

### Architectural Patterns Quick Reference

| Pattern | Core Idea |
| :--- | :--- |
| **Railway Oriented Prog.** | Use `with` to create a pipeline that handles success (`:ok`) and failure (`:error`) paths cleanly. |
| **CQRS** | **C**ommand **Q**uery **R**esponsibility **S**egregation. Separate your models for writing (Commands) and reading (Queries). |
| **ADR** | **A**rchitectural **D**ecision **R**ecord. A document that captures a significant design choice and its consequences. |

---

### REST vs. GraphQL

| Feature | REST | GraphQL |
| :--- | :--- | :--- |
| **Data Fetching** | Fixed data structure per endpoint. | Client requests exactly the data it needs. |
| **Endpoints** | Multiple endpoints (`/users`, `/orders`). | Typically a single endpoint (`/graphql`). |
| **Problem Solved** | Standardization of web APIs. | Over-fetching and under-fetching. |
