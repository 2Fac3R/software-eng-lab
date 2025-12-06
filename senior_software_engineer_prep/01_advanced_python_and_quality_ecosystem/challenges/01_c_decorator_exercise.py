# Challenge: Creating a Timing Decorator

# Instructions:
# Your task is to create a decorator called `timer`.
#
# 1. The `timer` decorator should measure the execution time of the function it wraps.
# 2. It should print the execution time to the console in a human-readable format
#    (e.g., "Function 'my_function' ran in 0.1234s").
# 3. The decorator should work on functions that take any combination of positional
#    and keyword arguments.
# 4. The decorator must return the original function's return value.
# 5. Use `functools.wraps` to preserve the metadata of the original function.

import time
import functools

# --- Your Decorator Implementation Here ---

def timer(func):
    # TODO: Implement the wrapper function
    pass


# --- Example Usage (provided) ---

@timer
def slow_function(delay: float, name: str) -> str:
    """A sample function that simulates work by sleeping."""
    print(f"Starting slow_function for {name}...")
    time.sleep(delay)
    result = f"Job '{name}' complete!"
    print("slow_function finished.")
    return result


# --- Tests ---

def run_tests():
    print("Running tests...")
    return_value = slow_function(0.1, name="Test Job")
    
    # Test if the original function's return value is preserved
    assert return_value == "Job 'Test Job' complete!"
    print("[PASS] Decorator preserved the return value.")

    # Test if the decorator preserves the function's metadata
    assert slow_function.__name__ == "slow_function"
    print("[PASS] Decorator preserved the function name.")

    print("\nAll tests passed! Check the console output for the timer message.")

if __name__ == "__main__":
    run_tests()
