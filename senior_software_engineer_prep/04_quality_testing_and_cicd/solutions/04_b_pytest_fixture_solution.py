# Solution: Refactoring to a Pytest Fixture

import pytest
import os
import tempfile

# --- Original Test (for reference) ---

def test_read_and_write_to_file_original():
    """This test manually creates and deletes a temporary file."""
    file_path = "temp_test_file.txt"
    try:
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
    finally:
        # Teardown
        if os.path.exists(file_path):
            os.remove(file_path)


# --- Refactored Code ---

@pytest.fixture
def temp_file():
    """
    A pytest fixture that creates a temporary file for a test.
    It `yields` the path to the file and guarantees cleanup after the test.
    """
    # SETUP: Create a temporary file
    # `tempfile.mkstemp()` is a safe way to create temporary files.
    fd, path = tempfile.mkstemp(text=True)
    os.close(fd) # We just need the path, so close the file descriptor.

    print(f"\n--- Fixture setup: created {path} ---")

    # YIELD: This is where the test function will execute.
    # The value yielded (the path) is passed to the test function.
    yield path

    # TEARDOWN: This code runs after the test is complete, even if it failed.
    print(f"--- Fixture teardown: removing {path} ---")
    os.remove(path)


# The rewritten test is now much cleaner.
# It declares that it needs the `temp_file` fixture by accepting it as an argument.
# It no longer contains any manual setup or teardown logic.
def test_with_fixture(temp_file):
    """This test uses the fixture to get a clean temporary file."""
    # The `temp_file` argument is the path yielded by our fixture.
    file_path = temp_file

    # Test logic 1: Write to the file and read it back
    with open(file_path, "w") as f:
        f.write("hello from fixture")
    
    with open(file_path, "r") as f:
        content = f.read()
        assert content == "hello from fixture"

    # Test logic 2: Overwrite and read again
    with open(file_path, "w") as f:
        f.write("new content")

    with open(file_path, "r") as f:
        content = f.read()
        assert content == "new content"

