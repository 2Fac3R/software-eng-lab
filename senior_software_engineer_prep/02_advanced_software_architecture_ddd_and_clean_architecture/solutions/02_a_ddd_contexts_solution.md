# Solution: Identifying Bounded Contexts and Aggregates

---

### 1. Identified Bounded Contexts

Here are three logical Bounded Contexts for the library system:

1.  **Catalog Management:**
    *   **Responsibility:** Manages the library's collection of book titles and physical copies. Its concern is what the library *owns*. In this context, a "Book" is an asset to be tracked, cataloged, and maintained.

2.  **Circulation:**
    *   **Responsibility:** Manages the core library operations of lending books to members. This includes member accounts, checkouts, returns, and fines. Here, a "Member" is a borrower, and a "Book Copy" is an item that can be loaned.

3.  **Staffing & Administration:**
    *   **Responsibility:** Manages employee schedules and internal administrative tasks. In this context, a "Librarian" is an employee with shifts, not just a user of the system.

---

### 2. Aggregates within the "Circulation" Bounded Context

Let's model the aggregates for the **Circulation** context.

#### Aggregate 1: Member

*   **Aggregate Root:** `Member` (Entity)
*   **Internal Objects:**
    *   A list of `LoanID`s (Value Objects) representing currently checked-out books.
    *   `Fine` (Value Object) representing the total outstanding amount.
*   **Invariants (Business Rules) protected by the `Member` root:**
    *   **Invariant 1:** "A member cannot have more than 5 books checked out simultaneously." The `Member.checkout_book()` method would check the size of its internal list of loans before proceeding.
    *   **Invariant 2:** "A member cannot borrow a new book if they have outstanding fines." The `Member.checkout_book()` method would check if the `Fine` amount is greater than zero.

#### Aggregate 2: Loan

*   **Aggregate Root:** `Loan` (Entity)
*   **Internal Objects:**
    *   `MemberID` (Value Object)
    *   `BookCopyID` (Value Object)
    *   `DueDate` (Value Object)
    *   `Status` (Value Object, e.g., `:active` or `:completed`)
*   **Invariants (Business Rules) protected by the `Loan` root:**
    *   **Invariant 1:** "A loan's due date cannot be in the past." The `Loan.create()` function would validate this upon creation.
    *   **Invariant 2:** "A completed loan cannot be modified." Once the status is set to `:completed`, methods like `extend_due_date()` would raise an error.
