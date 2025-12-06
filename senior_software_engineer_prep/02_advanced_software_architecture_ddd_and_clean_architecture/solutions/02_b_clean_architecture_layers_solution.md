# Solution: Applying Clean Architecture Layers

Here is an example of how the "Submit a blog post comment" feature could be structured using Clean Architecture.

---

### 1. Entities Layer

This layer contains the core business objects, independent of any application.

*   **`Comment` Entity:**
    *   Attributes: `id`, `author_id`, `post_id`, `text`, `created_at`.
    *   Business Rule Logic: A `Comment.create()` factory function would enforce that `text` cannot be empty and must be <= 1000 characters. This rule is intrinsic to what a "Comment" is.
*   **`User` Entity:**
    *   Attributes: `id`, `status` (`active`, `inactive`).
    *   Business Rule Logic: A method like `user.can_comment?()` would return `true` only if `status` is `active`.

### 2. Use Cases Layer

This layer orchestrates the application-specific workflow.

*   **`SubmitCommentUseCase` Class/Module:**
    *   **Input:** A data structure (e.g., a simple dataclass) like `SubmitCommentRequest(user_id, post_id, comment_text)`.
    *   **Responsibilities:**
        1.  Takes the input data.
        2.  Uses a `UserRepository` to fetch the `User` entity.
        3.  Checks if the user is allowed to comment by calling `user.can_comment?()`.
        4.  If authorized, it creates a new `Comment` entity using `Comment.create()`.
        5.  Uses a `CommentRepository` to save the new `Comment` entity.
        6.  Returns a result to the Presenter (e.g., success or failure).

### 3. Interface Adapters Layer

This layer converts data between the Use Cases and the external world.

*   **`CommentController`:**
    *   **Responsibility:** Handles the incoming HTTP request (e.g., `POST /posts/123/comments`).
    *   It parses the request body (JSON) and the user ID (from a session or token).
    *   It creates the `SubmitCommentRequest` data object and calls `SubmitCommentUseCase.execute()`.
    *   It receives the result from the use case and passes it to the `Presenter`.

*   **`CommentPresenter`:**
    *   **Responsibility:** Formats the output for the web.
    *   If the use case was successful, it generates a `201 Created` HTTP response with the new comment's data.
    *   If the use case failed (e.g., user inactive, comment too long), it generates an appropriate error response (e.g., `403 Forbidden` or `400 Bad Request`).

*   **`SQLCommentRepository` (Gateway):**
    *   **Responsibility:** Implements the `CommentRepository` interface defined by the Use Case layer.
    *   It contains the actual database logic (e.g., using SQLAlchemy or Django ORM) to translate the `Comment` entity into a database row and save it.

### 4. Frameworks & Drivers Layer

This is the concrete implementation of the outermost layer.

*   **Web Framework:** Django or FastAPI to handle the HTTP routing and request/response cycle.
*   **Database Library:** `psycopg2` driver and `SQLAlchemy` Core (or Django ORM) to implement the `SQLCommentRepository`.
*   **Database Server:** PostgreSQL.
