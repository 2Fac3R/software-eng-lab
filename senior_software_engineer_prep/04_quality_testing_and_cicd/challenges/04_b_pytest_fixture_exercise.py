# Challenge: Refactoring to a Pytest Fixture

# Instructions:
# The test function `test_read_and_write_to_file` below works, but it has
# a problem: it manually handles the setup and teardown of a temporary file.
# This makes the test verbose and error-prone (e.g., the cleanup code might
# not run if an assertion fails).
#
# Your task is to refactor this test using a `pytest` fixture.
#
# 1. Create a fixture named `temp_file`.
# 2. The fixture should create a temporary file and write some initial content to it.
# 3. It should `yield` the path to the file so the test can use it.
# 4. After the `yield`, the fixture should include teardown logic to delete the file,
#    ensuring it gets cleaned up even if the test fails.
# 5. Rewrite the test function `test_with_fixture` to use your new `temp_file` fixture.

import pytest
import os

# --- Original Test (to be refactored) ---

def test_read_and_write_to_file():
    """This test manually creates and deletes a temporary file."""
    file_path = "temp_test_file.txt"
    
    # Setup
    with open(file_path, "w") as f:
        f.write("initial content")

    # Test logic
    with open(file_path, "r") as f:
        content = f.read()
        assert content == "initial content"

    # More test logic
    with open(file_path, "w") as f:
        f.write("new content")

    with open(file_path, "r") as f:
        content = f.read()
        assert content == "new content"

    # Teardown
    os.remove(file_path)


# --- Your Refactored Code Here ---

# TODO: Create the `temp_file` fixture
# Hint: Use `yield` to separate setup from teardown.


# TODO: Rewrite the test to use the fixture.
# The test should be much cleaner and only contain the actual test logic.
def test_with_fixture(temp_file):
    pass
