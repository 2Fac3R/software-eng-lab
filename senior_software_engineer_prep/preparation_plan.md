# Study Plan: Senior Software Engineer (Critical Infrastructure)

This plan is designed to build the skills of a senior software engineer capable of building robust, scalable, and maintainable systems in high-stakes environments like finance.

---

### **Module 1: Advanced Python and Quality Ecosystem**
This module covers the requirement for "Advanced Python proficiency" and the use of a modern static analysis toolchain.

*   **Theory:** Idiomatic Python, advanced static typing with `PEP 484`, data validation with `Pydantic`, and using quality tools like `mypy`, `ruff`, and `uv`.
*   **Practical Challenges:** Refactor a script to be fully typed and validated with `Pydantic`; set up a new project with `uv` and configure `ruff` and `mypy`.
*   **Cheatsheet & Flashcards:** Guide to advanced `mypy` types; `Pydantic` common validators; `uv` and `ruff` configuration.

---

### **Module 2: Advanced Software Architecture (DDD & Clean Architecture)**
This is the most important module, focusing directly on "Clean Architecture and Domain-Driven Design."

*   **Theory:** Domain-Driven Design (Bounded Contexts, Aggregates, Repositories), Clean Architecture (Layers, Dependency Rule), and documenting architectural decisions (ADRs).
*   **Practical Challenges (Conceptual):** Design Bounded Contexts for a wallet system; model an "Account" Aggregate; diagram a feature using Clean Architecture layers.
*   **Cheatsheet & Flashcards:** Clean Architecture diagram; glossary of DDD terms.

---

### **Module 3: PostgreSQL Expertise**
Covers the requirement for "Expertise in PostgreSQL" with its advanced features.

*   **Theory:** Table Partitioning, `JSONB` data types and operators, advanced index types (`GIN`, `GiST`), Row-Level Security (RLS), and writing `PL/PgSQL` stored procedures.
*   **Practical Challenges:** Write a query using `JSONB` operators; create and query a partitioned table.
*   **Cheatsheet & Flashcards:** "Which index to use when" guide; `JSONB` operators quick reference.

---

### **Module 4: Quality, Testing, and CI/CD**
Focuses on "Apply TDD/BDD and maintain significant coverage using pytest."

*   **Theory:** Test-Driven Development (TDD) workflow, Behavior-Driven Development (BDD) concepts, advanced `pytest` (fixtures, mocking), and setting up a basic CI/CD pipeline with GitHub Actions.
*   **Practical Challenges:** Develop a function using a strict TDD cycle; create a complex `pytest` fixture.
*   **Cheatsheet & Flashcards:** `pytest` popular markers and CLI commands; template for a CI workflow file.

---

### **Module 5: Web Frameworks (Django & FastAPI)**
Covers the use of web frameworks within a clean architecture.

*   **Theory:** Using Django (ORM, Middleware) and FastAPI (Dependency Injection) as the outer "Frameworks & Drivers" layer without polluting the core business logic.
*   **Practical Challenges:** Build a Django API endpoint that calls a "Use Case" service class, keeping the layers separate.
*   **Cheatsheet & Flashcards:** Diagram of a request flowing through Clean Architecture layers in a Django/FastAPI app.

---

### **Module 6: Containerization and Deployment (Docker & Kubernetes)**
Addresses the "Nice to have" requirements crucial for senior roles.

*   **Theory:** Docker fundamentals (`Dockerfile`, `docker-compose`), Kubernetes fundamentals (Pods, Services, Deployments), and an introduction to Helm/Kustomize.
*   **Practical Challenges:** Write a multi-stage `Dockerfile` for a Django app; create a `docker-compose.yml` to run the app and a Postgres database.
*   **Cheatsheet & Flashcards:** Common `Dockerfile` instructions; basic `kubectl` commands.
