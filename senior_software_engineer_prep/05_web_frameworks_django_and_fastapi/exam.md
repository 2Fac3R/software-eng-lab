# Module 5 Exam: Web Frameworks (Django & FastAPI)

**Instructions:** Choose the best answer for each question.

---

**Question 1:** In a project following Clean Architecture, where should the core business logic for creating a user be located?

A) Inside a Django model method (`User.objects.create(...)`).
B) Directly inside a Django or FastAPI view function.
C) In a `CreateUserUseCase` class that has no knowledge of Django or FastAPI.
D) In a middleware function.

---

**Question 2:** What is the primary benefit of using FastAPI's Dependency Injection system (`Depends`) for implementing Clean Architecture?

A) It automatically generates API documentation.
B) It makes database queries faster.
C) It allows the web layer to be decoupled from the creation of the business logic services it uses.
D) It validates all incoming request data automatically.

---

**Question 3:** The practice of putting complex business logic, calculations, and state changes into the methods of Django's `models.py` files is a well-known anti-pattern called:

A) Fat Views
B) Fat Models
C) The Repository Pattern
D) Dependency Injection

---

**Question 4:** According to the Dependency Rule of Clean Architecture, which of the following import statements would be considered a violation if found in a `use_cases.py` file?

A) `from domain.entities import User`
B) `from application.repositories import UserRepository`
C) `from fastapi import HTTPException`
D) `import dataclasses`

---

**Question 5:** What is the primary role of a Controller (e.g., a Django View) in a Clean Architecture?

A) To contain all the business logic for a specific feature.
B) To connect directly to the database to fetch data.
C) To act as a thin layer that parses HTTP requests, calls the appropriate use case, and formats the HTTP response.
D) To define the database schema for the application.
