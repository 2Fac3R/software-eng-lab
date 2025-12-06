# Module 1 Exam Solutions: Elixir and Functional Programming (Extended)

---

**Question 1:** What is the primary mechanism in Elixir for achieving polymorphism (allowing different data types to respond to the same function call)?

**Answer:** C
**Explanation:** Protocols are Elixir's way of achieving polymorphism. A protocol defines an interface, and you can then provide concrete implementations of that interface for various data types. This allows you to call `MyProtocol.my_func(data)` and have it dispatch to the correct implementation based on the type of `data`.

---

**Question 2:** What is the output of the following `for` comprehension?
```elixir
for n <- [1, 2, 3, 4], is_odd(n), do: n * n

def is_odd(n), do: rem(n, 2) != 0
```

**Answer:** B
**Explanation:** The `for` comprehension iterates through the list `[1, 2, 3, 4]`. The filter `is_odd(n)` only allows the values `1` and `3` to pass. For each of these, the `do` block is executed: `1*1` is `1`, and `3*3` is `9`. The final result is `[1, 9]`.

---

**Question 3:** You want to use the `Jason.encode/1` function frequently in your module without having to type `Jason.` every time. Which directive should you use at the top of your file?

**Answer:** D
**Explanation:** `import Jason, only: [encode: 1]` brings only the `encode` function with an arity of 1 into the local scope. `alias` would only shorten the name, still requiring `Jason.encode`. `require` is for macros, and `use` is for injecting code.

---

**Question 4:** What is the difference between a char-list (`'hello'`) and a binary/string (`"hello"`) in Elixir?

**Answer:** B
**Explanation:** This is a fundamental distinction. A binary/string (`"..."`) is a UTF-8 encoded sequence of bytes, which is highly efficient for I/O. A char-list (`'...'`) is a list of integer codepoints, which is a data structure inherited from Erlang and is much less efficient to process.

---

**Question 5:** Which sigil is used to create a list of words (strings)?

**Answer:** C
**Explanation:** The `~w` sigil is the word-list sigil. It splits the string inside it by whitespace and returns a list of strings. `~r` is for regex, `~s` is for a regular string, and `~c` is for a char-list.
