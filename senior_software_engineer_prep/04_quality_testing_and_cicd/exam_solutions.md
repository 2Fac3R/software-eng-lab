# Module 4 Exam Solutions: Quality, Testing, and CI/CD

---

**Question 1:** What is the correct order of the three steps in the Test-Driven Development (TDD) cycle?

**Answer:** C
**Explanation:** The TDD mantra is "Red, Green, Refactor." You first write a failing test (Red), then write the minimal code to make it pass (Green), and finally clean up the code (Refactor).

---

**Question 2:** In `pytest`, what is the primary purpose of a fixture?

**Answer:** B
**Explanation:** Fixtures are designed to provide a reliable and reusable context for tests. This includes setting up resources like database connections, temporary files, or complex objects, and then cleaning them up after the test has run.

---

**Question 3:** What is the main goal of Continuous Integration (CI)?

**Answer:** C
**Explanation:** CI is a practice focused on making integration a frequent, automated, and low-impact event. By merging and testing code often, teams can detect and resolve integration bugs much earlier in the development cycle.

---

**Question 4:** You need to test a function that makes a network request to an external API. To do this, you want to prevent the actual network request and instead control the return value of the API call function. What technique should you use?

**Answer:** B
**Explanation:** Mocking is the technique of replacing real objects or functions with controlled fakes (mocks). This allows you to isolate the code you are testing from its external dependencies, making your tests faster, more reliable, and deterministic.

---

**Question 5:** You want to run a single test function with 10 different sets of inputs to check various edge cases. Which `pytest` feature is best suited for this?

**Answer:** C
**Explanation:** The `@pytest.mark.parametrize` decorator is designed specifically for this purpose. It allows you to define multiple sets of arguments for a single test function, and `pytest` will run the test once for each set, reducing code duplication and making it clear what is being tested.
