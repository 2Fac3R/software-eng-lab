# Challenge: Developing a Function with TDD

# Instructions:
# Your task is to develop a simple `calculate_shipping_cost` function using the
# Test-Driven Development (TDD) cycle. 
#
# The requirements for the function are:
# 1. It takes a `weight` (float) and a `destination` (string) as input.
# 2. The base cost is $5.
# 3. If the weight is over 10.0 kg, add a surcharge of $10.
# 4. If the destination is "international", double the total cost.
# 5. The function should raise a `ValueError` if the weight is zero or negative.

# Follow the TDD cycle:
# 1. RED: Write a test for one piece of functionality (e.g., the base cost).
#    Run the test and watch it fail (since the function doesn't exist yet).
# 2. GREEN: Write the simplest possible code in the `calculate_shipping_cost` function
#    to make that one test pass.
# 3. REFACTOR: Clean up the code if necessary.
# 4. REPEAT: Go back to step 1 for the next piece of functionality (e.g., the overweight surcharge).

import pytest

# --- Production Code (Your implementation goes here) ---

def calculate_shipping_cost(weight: float, destination: str) -> float:
    # Start by making the first test pass. A simple `return 5.0` will do.
    # Then, add logic incrementally as you write more tests.
    pass


# --- Test Code (You write these first, one by one) ---

class TestShippingCost:
    def test_base_cost(self):
        """Test the basic cost for a standard, local shipment."""
        # TODO: Write this test
        pass

    def test_overweight_surcharge(self):
        """Test that the surcharge is applied for heavy items."""
        # TODO: Write this test after the first one passes
        pass

    def test_international_cost(self):
        """Test that the cost is doubled for international shipments."""
        # TODO: Write this test
        pass

    def test_overweight_international_cost(self):
        """Test that both surcharges can be applied together."""
        # TODO: Write this test
        pass

    def test_invalid_weight_raises_error(self):
        """Test that a zero or negative weight raises a ValueError."""
        # TODO: Write this test. Use `pytest.raises`.
        pass
