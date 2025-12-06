# Module 1 Exam: Elixir and Functional Programming (Extended)

**Instructions:** Choose the best answer for each question.

---

**Question 1:** What is the primary mechanism in Elixir for achieving polymorphism (allowing different data types to respond to the same function call)?

A) Structs
B) Behaviours
C) Protocols
D) Pattern Matching

---

**Question 2:** What is the output of the following `for` comprehension?
```elixir
for n <- [1, 2, 3, 4], is_odd(n), do: n * n

def is_odd(n), do: rem(n, 2) != 0
```

A) `[1, 4, 9, 16]`
B) `[1, 9]`
C) `[2, 4]`
D) The code will produce an error.

---

**Question 3:** You want to use the `Jason.encode/1` function frequently in your module without having to type `Jason.` every time. Which directive should you use at the top of your file?

A) `alias Jason`
B) `require Jason`
C) `use Jason`
D) `import Jason, only: [encode: 1]`

---

**Question 4:** What is the difference between a char-list (`'hello'`) and a binary/string (`"hello"`) in Elixir?

A) There is no difference; they are interchangeable.
B) A char-list is a list of integer codepoints, while a binary is a sequence of UTF-8 encoded bytes.
C) A binary is used for numbers, while a char-list is used for text.
D) A char-list is immutable, but a binary is mutable.

---

**Question 5:** Which sigil is used to create a list of words (strings)?

A) `~r/hello world/`
B) `~s/hello world/`
C) `~w/hello world/`
D) `~c/hello world/`