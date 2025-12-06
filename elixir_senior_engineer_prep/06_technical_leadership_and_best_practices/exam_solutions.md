# Module 6 Exam Solutions: Technical Leadership (Extended)

---

**Question 1:** What is Property-Based Testing?

**Answer:** B
**Explanation:** Property-based testing involves defining high-level properties of your code (e.g., "reversing a list twice yields the original list") and then using a tool like `StreamData` to generate a large number of random inputs to challenge that property. It's a powerful way to find edge cases.

---

**Question 2:** What is the primary purpose of the `Dialyzer` tool in the Elixir/Erlang ecosystem?

**Answer:** D
**Explanation:** Dialyzer is a static analysis tool that detects discrepancies in code, such as type inconsistencies, unreachable code, or unnecessary tests. It helps find bugs before the code is ever run, providing a form of static typing confidence in a dynamic language.

---

**Question 3:** When mentoring a junior developer during a code review, which piece of feedback is most effective and constructive?

**Answer:** C
**Explanation:** Effective feedback is constructive, educational, and collaborative. Option C asks a question, explains the reasoning behind the suggestion ("make the error handling path clearer"), and links it to a known pattern (ROP). This teaches the "why," not just the "what."

---

**Question 4:** In Elixir, what is the primary benefit of using `@doc` with doctests?

**Answer:** B
**Explanation:** Doctests are both documentation and tests. They provide clear examples of how to use a function while also being verified every time you run `mix test`. This ensures your examples are never wrong or out of date.

---

**Question 5:** According to the Testing Pyramid, which statement is generally true?

**Answer:** C
**Explanation:** The Testing Pyramid is a strategy that advises having a large foundation of fast, simple unit tests. As you move up the pyramid, the tests become more complex, slower, and fewer in number (Integration tests, then E2E tests at the top).
