# Solution: Developing a Function with TDD

# This file shows the final state of the code after completing all the TDD cycles.
# Remember, in a real TDD session, you would write one test, make it pass,
# then write the next test, and so on.

import pytest

# --- Production Code (Final Version) ---

def calculate_shipping_cost(weight: float, destination: str) -> float:
    """Calculates shipping cost based on weight and destination."""
    if weight <= 0:
        raise ValueError("Weight must be positive.")

    cost = 5.0

    if weight > 10.0:
        cost += 10.0

    if destination == "international":
        cost *= 2.0

    return cost


# --- Test Code (Final Version) ---

class TestShippingCost:
    def test_base_cost(self):
        """Test the basic cost for a standard, local shipment."""
        assert calculate_shipping_cost(5.0, "local") == 5.0

    def test_overweight_surcharge(self):
        """Test that the surcharge is applied for heavy items."""
        assert calculate_shipping_cost(15.0, "local") == 15.0  # 5 + 10

    def test_international_cost(self):
        """Test that the cost is doubled for international shipments."""
        assert calculate_shipping_cost(5.0, "international") == 10.0  # 5 * 2

    def test_overweight_international_cost(self):
        """Test that both surcharges can be applied together."""
        assert calculate_shipping_cost(15.0, "international") == 30.0  # (5 + 10) * 2

    def test_exact_weight_boundaries(self):
        """Test the boundaries for the overweight calculation."""
        assert calculate_shipping_cost(10.0, "local") == 5.0
        assert calculate_shipping_cost(10.001, "local") == 15.0

    def test_invalid_weight_raises_error(self):
        """Test that a zero or negative weight raises a ValueError."""
        with pytest.raises(ValueError, match="Weight must be positive."):
            calculate_shipping_cost(0, "local")
        
        with pytest.raises(ValueError):
            calculate_shipping_cost(-10.0, "international")
