# Module 4 Exam: Advanced Software Design & Architecture (Extended)

**Instructions:** Choose the best answer for each question.

---

**Question 1:** You are designing a system where the data model for writing information is highly normalized for consistency, but the read queries need to be very fast and require denormalized data. Which architectural pattern would be most suitable?

A) Railway Oriented Programming (ROP)
B) CQRS (Command Query Responsibility Segregation)
C) The Singleton Pattern
D) The Decorator Pattern

---

**Question 2:** A function needs to fetch a user from the database, check their permissions, and then update their profile. Each of these steps can fail. What is the most idiomatic Elixir construct for handling this sequence of operations?

A) A series of nested `case` statements.
B) A `try...rescue` block to catch exceptions.
C) A `with` statement.
D) A `cond` statement.

---

**Question 3:** What is the primary purpose of an Architectural Decision Record (ADR)?

A) To automatically generate API documentation.
B) To document a significant architectural decision, its context, and its consequences for future reference.
C) To enforce coding style across a project.
D) To define the database schema.

---

**Question 4:** You are writing a service that needs to send notifications. Instead of calling `MyApp.EmailClient.send/1` directly, you pass the `email_client` module as an argument to your function. This is an example of which SOLID principle?

A) Single Responsibility Principle
B) Liskov Substitution Principle
C) Dependency Inversion Principle
D) Open/Closed Principle

---

**Question 5:** In Elixir, which language feature is most commonly used to achieve the Open/Closed Principle (open for extension, closed for modification)?

A) Structs
B) The pipe operator (`|>`)
C) Behaviours
D) GenServers