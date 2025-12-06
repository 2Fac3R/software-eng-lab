# Module 4 Exam Solutions: Advanced Software Design & Architecture (Extended)

---

**Question 1:** You are designing a system where the data model for writing information is highly normalized for consistency, but the read queries need to be very fast and require denormalized data. Which architectural pattern would be most suitable?

**Answer:** B
**Explanation:** CQRS (Command Query Responsibility Segregation) is the pattern that explicitly separates the models for writing (Commands) and reading (Queries). This allows you to optimize the read model (e.g., by creating denormalized views) for performance, independently of the write model.

---

**Question 2:** A function needs to fetch a user from the database, check their permissions, and then update their profile. Each of these steps can fail. What is the most idiomatic Elixir construct for handling this sequence of operations?

**Answer:** C
**Explanation:** The `with` statement is designed precisely for this "railway oriented programming" scenario. It chains functions that return `{:ok, ...}` or `{:error, ...}` and short-circuits on the first failure, making the code clean and robust.

---

**Question 3:** What is the primary purpose of an Architectural Decision Record (ADR)?

**Answer:** B
**Explanation:** An ADR is a lightweight document used to capture the context, decision, and consequences of a significant architectural choice. Its purpose is to create a historical log that helps future team members understand the rationale behind the system's design.

---

**Question 4:** You are writing a service that needs to send notifications. Instead of calling `MyApp.EmailClient.send/1` directly, you pass the `email_client` module as an argument to your function. This is an example of which SOLID principle?

**Answer:** C
**Explanation:** This is a classic example of the Dependency Inversion Principle. Your high-level function no longer depends on a concrete implementation (`MyApp.EmailClient`). Instead, it depends on an abstraction (any module that responds to a `send/1` function), which can be easily swapped for a mock during testing.

---

**Question 5:** In Elixir, which language feature is most commonly used to achieve the Open/Closed Principle (open for extension, closed for modification)?

**Answer:** C
**Explanation:** Behaviours define a contract (an interface). You can "extend" the system by creating new modules that implement this behaviour without ever "modifying" the original behaviour definition or the client code that uses it.