# Module 4: Quality, Testing, and CI/CD

This module covers the critical practices that ensure software is not only functional but also robust, maintainable, and delivered reliably. For a senior role in a financial context, a strong commitment to quality is non-negotiable.

## 1. Test-Driven Development (TDD)

TDD is a software development process that inverts the traditional "write code, then test" model. It follows a short, repetitive cycle:

1.  **RED:** Write a small, automated test for a new feature or improvement. This test **must fail** initially, because the feature doesn't exist yet.
2.  **GREEN:** Write the **absolute minimum** amount of production code required to make the test pass.
3.  **REFACTOR:** Clean up the code you just wrote (both production and test code) while keeping the tests green. This is where you improve the design, remove duplication, and enhance readability.

**Why use TDD?**
-   **Safety Net:** It produces a comprehensive suite of tests that act as a safety net, giving you confidence to refactor and add new features without breaking existing ones.
-   **Drives Design:** It forces you to think about the interface and requirements of your code *before* you write it.
-   **Guarantees Testability:** Since you write the test first, your code is guaranteed to be testable.

## 2. Behavior-Driven Development (BDD)

BDD is an extension of TDD that focuses on describing the desired behavior of the system from the user's perspective. It aims to improve communication between developers, QA, and business stakeholders.

-   **Gherkin Syntax:** BDD often uses a structured, natural language format called Gherkin to define scenarios.

    ```gherkin
    Feature: User Login

      Scenario: Successful login with valid credentials
        Given a registered user with the email "test@example.com"
        When the user navigates to the login page
        And they submit the correct password
        Then they should be redirected to their dashboard
    ```
-   **Tools:** In Python, tools like `pytest-bdd` and `behave` can parse these `.feature` files and connect them to Python test code.

## 3. Advanced `pytest`

`pytest` is the standard for testing in Python. A senior engineer should master its advanced features to write clean, maintainable, and powerful tests.

-   **Fixtures:** Fixtures are the core of `pytest`. They are functions that provide a fixed baseline state or data for your tests. They are reusable and help avoid code duplication.

    ```python
    import pytest

    @pytest.fixture
    def db_connection():
        # --- Setup ---
        conn = create_db_connection()
        yield conn # The test runs here
        # --- Teardown ---
        conn.close()

    # The fixture is passed as an argument to the test
    def test_user_query(db_connection):
        # ... use db_connection to run a test ...
    ```

-   **Parametrization:** Use the `@pytest.mark.parametrize` decorator to run the same test function with multiple different inputs and expected outputs. This is perfect for testing edge cases.

    ```python
    @pytest.mark.parametrize("test_input, expected", [(2, 4), (3, 9), (4, 16)])
    def test_square(test_input, expected):
        assert square(test_input) == expected
    ```

-   **Mocking (`pytest-mock`):** Mocking is the process of replacing parts of your system (like external API calls or database connections) with fake objects. This allows you to test a piece of code in isolation.

    ```python
    def test_user_notification(mocker): # `mocker` is a fixture from pytest-mock
        # Replace the `send_email` function with a mock
        mock_send_email = mocker.patch("my_app.notifications.send_email")

        notify_new_user(user_id=1)

        # Assert that our mock was called exactly once
        mock_send_email.assert_called_once()
    ```

## 4. CI/CD (Continuous Integration/Continuous Deployment)

CI/CD is a set of practices and tools that automate the process of building, testing, and deploying software.

-   **Continuous Integration (CI):** The practice of developers frequently merging their code changes into a central repository. After each merge, an automated **pipeline** is triggered.
    -   **Goal:** To detect integration issues early.
    -   A typical CI pipeline includes steps like: Linting -> Static Analysis -> Running Tests -> Building Artifacts.

-   **Continuous Deployment (CD):** The practice of automatically deploying every change that passes the CI stage to a production or staging environment.

**Example: Simple CI Pipeline with GitHub Actions**

A workflow file (e.g., `.github/workflows/ci.yml`) defines the steps:

```yaml
name: Python CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.11'
    - name: Install dependencies
      run: |
        pip install -r requirements.txt
        pip install ruff mypy pytest
    - name: Lint and Format Check with ruff
      run: ruff check . && ruff format --check .
    - name: Analyze with mypy
      run: mypy .
    - name: Run tests with pytest
      run: pytest
```
