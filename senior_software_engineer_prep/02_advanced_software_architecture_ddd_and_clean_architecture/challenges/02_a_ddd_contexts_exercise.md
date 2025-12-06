# Challenge: Identifying Bounded Contexts and Aggregates

**Scenario:**

You are tasked with designing a simplified software system for a public library. After speaking with the librarians (the domain experts), you have gathered the following information about how the library operates:

*   The library owns multiple **copies** of each **book title**. Each book title has an ISBN, author, and publication year. Each physical copy has a unique ID and a status (e.g., `available`, `checked_out`, `in_repair`).
*   **Members** can borrow book copies. Members have a name, address, and a library card number. A member can have multiple books checked out at once, but they cannot borrow more than 5 books total.
*   When a member checks out a book, a **loan** is created. The loan tracks the book copy, the member, the checkout date, and the due date. When the book is returned, the loan is marked as complete.
*   If a book is not returned on time, **fines** are calculated daily. A member cannot borrow new books if they have outstanding fines.
*   The library also manages **staff schedules**. Librarians have shifts, and the system needs to ensure there are always at least two librarians on duty during opening hours.

**Your Task:**

Based on the scenario above, answer the following questions in a Markdown file.

1.  **Identify Bounded Contexts:** Propose at least three distinct Bounded Contexts for this system. For each context, briefly explain its primary responsibility.
    *   *Hint: Think about the different major "departments" or concerns of the library. Where does the meaning of a term like "Book" or "Member" change?*

2.  **Define Aggregates:** For **one** of the Bounded Contexts you identified, define the Aggregates within it. For each Aggregate:
    *   Name the Aggregate Root.
    *   List the other Entities or Value Objects that belong inside the Aggregate.
    *   Describe at least one **invariant** (a business rule) that the Aggregate Root would be responsible for protecting.
