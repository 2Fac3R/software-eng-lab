# Module 4 Exam: Quality, Testing, and CI/CD

**Instructions:** Choose the best answer for each question.

---

**Question 1:** What is the correct order of the three steps in the Test-Driven Development (TDD) cycle?

A) Green -> Red -> Refactor
B) Red -> Refactor -> Green
C) Red -> Green -> Refactor
D) Green -> Refactor -> Red

---

**Question 2:** In `pytest`, what is the primary purpose of a fixture?

A) To run the same test with multiple different inputs.
B) To provide a reusable setup and teardown mechanism for tests, such as creating a database connection.
C) To mark tests as slow so they can be skipped.
D) To check the code for style errors according to PEP 8.

---

**Question 3:** What is the main goal of Continuous Integration (CI)?

A) To automatically deploy every new feature to production.
B) To write all tests after the code has been completed.
C) To frequently merge code changes and run automated tests to detect integration issues early.
D) To manually test every feature before a release.

---

**Question 4:** You need to test a function that makes a network request to an external API. To do this, you want to prevent the actual network request and instead control the return value of the API call function. What technique should you use?

A) Parametrization
B) Mocking
C) Fixtures
D) Refactoring

---

**Question 5:** You want to run a single test function with 10 different sets of inputs to check various edge cases. Which `pytest` feature is best suited for this?

A) Creating 10 separate test functions.
B) Using a `for` loop inside a single test function.
C) Using the `@pytest.mark.parametrize` decorator.
D) Using a fixture to generate the inputs.
