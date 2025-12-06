# Module 5 Exam Solutions: Web Frameworks (Django & FastAPI)

---

**Question 1:** In a project following Clean Architecture, where should the core business logic for creating a user be located?

**Answer:** C
**Explanation:** The core business logic must reside in the Use Cases (Interactors) layer, which is independent of any framework. The web framework is just a delivery mechanism that calls the use case.

---

**Question 2:** What is the primary benefit of using FastAPI's Dependency Injection system (`Depends`) for implementing Clean Architecture?

**Answer:** C
**Explanation:** The Dependency Injection system allows the web layer (the endpoint) to declare what it needs (e.g., a use case service) without being responsible for how to construct it. This decouples the layers, making the system easier to test and maintain, which is a core goal of Clean Architecture.

---

**Question 3:** The practice of putting complex business logic, calculations, and state changes into the methods of Django's `models.py` files is a well-known anti-pattern called:

**Answer:** B
**Explanation:** This is known as the "Fat Model" anti-pattern. It violates the Single Responsibility Principle by mixing persistence concerns (from the ORM) with core business logic, making the domain model anemic and tightly coupled to the database.

---

**Question 4:** According to the Dependency Rule of Clean Architecture, which of the following import statements would be considered a violation if found in a `use_cases.py` file?

**Answer:** C
**Explanation:** The Dependency Rule states that inner layers (like Use Cases) cannot know anything about outer layers (like Frameworks). Importing `fastapi` or `django` in a use case file is a direct violation of this rule. The use case should be pure Python.

---

**Question 5:** What is the primary role of a Controller (e.g., a Django View) in a Clean Architecture?

**Answer:** C
**Explanation:** The controller is part of the "Interface Adapters" layer. Its job is to be a thin adapter that converts data from the format of the delivery mechanism (HTTP) to the format of the use case, and vice-versa. It should not contain any business logic.
