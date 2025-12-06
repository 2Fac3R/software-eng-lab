# Solution: Creating a Timing Decorator

import time
import functools
from typing import Callable, Any

# --- Decorator Implementation ---

def timer(func: Callable) -> Callable:
    """A decorator that prints the execution time of the wrapped function."""
    
    @functools.wraps(func)
    def wrapper(*args: Any, **kwargs: Any) -> Any:
        # 1. Record the start time
        start_time = time.perf_counter()
        
        # 2. Call the original function, passing all arguments
        result = func(*args, **kwargs)
        
        # 3. Record the end time and calculate the duration
        end_time = time.perf_counter()
        run_time = end_time - start_time
        
        # 4. Print the result
        print(f"Function '{func.__name__}' ran in {run_time:.4f}s")
        
        # 5. Return the original function's result
        return result
        
    return wrapper


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
