# Module 4: Quality, Testing, and CI/CD - Cheatsheet

---

### TDD (Test-Driven Development) Cycle

The core loop of TDD is **Red -> Green -> Refactor**.

1.  **RED:** Write a failing test that defines a new piece of functionality.
2.  **GREEN:** Write the simplest possible production code to make the test pass.
3.  **REFACTOR:** Clean up and improve the design of the code you just wrote, ensuring all tests remain green.

---

### `pytest` Quick Reference

| Feature | Example | Purpose |
| :--- | :--- | :--- |
| **Fixture** | `@pytest.fixture` | Provides a reusable setup/teardown context for tests (e.g., a database connection). |
| **Parametrize** | `@pytest.mark.parametrize("input,output", ...)` | Runs the same test function with multiple sets of arguments. |
| **Marking** | `@pytest.mark.slow` | Labels a test, allowing you to selectively run or skip tests (`pytest -m "not slow"`). |
| **Mocking** | `mocker.patch("my_app.api.call")` | Replaces a function or object with a fake one to test code in isolation. |

**Common CLI Flags:**
-   `pytest -v`: Verbose output.
-   `pytest -k "my_function"`: Run tests whose names contain "my_function".
-   `pytest -m "slow"`: Run tests marked as "slow".
-   `pytest --cov=my_app`: Run tests and report code coverage for `my_app`.

---

### `pytest-mock` Fixture (`mocker`)

```python
def test_my_function(mocker):
    # Replace an object/function with a mock
    mock_api = mocker.patch("my_app.services.external_api.get_data")
    
    # Set a return value for the mock
    mock_api.return_value = {"status": "ok"}

    # Call the function that uses the patched object
    result = my_app.process_data()

    # Assert that the mock was called
    mock_api.assert_called_once_with(timeout=10)

    # Assert the result
    assert result is True
```

---

### Minimal GitHub Actions CI Workflow

File: `.github/workflows/ci.yml`

```yaml
name: CI

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.11"

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt
          pip install pytest ruff mypy

      - name: Lint and check formatting
        run: |
          ruff check .
          ruff format --check .

      - name: Run type checking
        run: mypy .

      - name: Run tests
        run: pytest
```
