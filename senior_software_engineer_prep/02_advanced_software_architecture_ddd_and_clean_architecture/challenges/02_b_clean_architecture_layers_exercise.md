# Challenge: Applying Clean Architecture Layers

**Scenario:**

You are tasked with designing the architecture for a single, specific feature in a larger application: **"Submitting a blog post comment."**

**Feature Requirements:**

*   A logged-in user can submit a comment on a blog post.
*   The comment text cannot be empty and must be less than 1000 characters.
*   The user must have an "active" status to be allowed to comment.
*   When a comment is successfully submitted, it is saved to the database.

**Your Task:**

Describe how you would structure the code for this feature according to the layers of Clean Architecture. For each of the four main layers, list the components (classes, functions, data structures) that would exist and briefly describe their responsibility.

1.  **Entities Layer:**
    *   What core business objects are involved? What are their key attributes and rules?

2.  **Use Cases Layer:**
    *   What is the name of the primary Use Case class/function? What data does it take as input? What does it orchestrate?

3.  **Interface Adapters Layer:**
    *   **Controller:** What does the controller do? What data format does it receive?
    *   **Presenter:** How is the result (success or failure) communicated back to the UI?
    *   **Repository (Gateway):** What interface (e.g., abstract methods) would you define for saving the comment and fetching the user/post?

4.  **Frameworks & Drivers Layer:**
    *   What specific tools and frameworks would you use to implement the outer layer? (e.g., web framework, database library).
