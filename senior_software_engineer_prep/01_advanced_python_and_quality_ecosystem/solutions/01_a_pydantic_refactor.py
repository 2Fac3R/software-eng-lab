from typing import Dict, Any, Optional, List
from pydantic import BaseModel, validator, ValidationError, EmailStr, Field

# --- Original Function (for reference) ---

def process_user_data(data: Dict[str, Any]) -> Optional[Dict[str, Any]]:
    """Manually validates and processes raw user data."""
    if "id" not in data or not isinstance(data["id"], int):
        print("Error: Missing or invalid user ID.")
        return None

    if "username" not in data or not isinstance(data["username"], str):
        print("Error: Missing or invalid username.")
        return None
    
    username = data["username"].strip()
    if len(username) < 3:
        print("Error: Username must be at least 3 characters.")
        return None

    if "email" not in data or "@" not in data["email"]:
        print("Error: Missing or invalid email.")
        return None

    processed = {
        "id": data["id"],
        "username": username,
        "email": data["email"],
        "is_active": data.get("is_active", True),
        "tags": data.get("tags", [])
    }
    return processed

# --- Pydantic Implementation ---

class User(BaseModel):
    """A Pydantic model representing a user."""
    id: int
    # Use Field to add constraints and metadata
    username: str = Field(..., min_length=3)
    # Pydantic has built-in types for common patterns like emails
    email: EmailStr
    is_active: bool = True
    tags: List[str] = []

    # Pydantic validators can transform data as well as validate it.
    # Here, we strip whitespace from the username.
    @validator('username')
    def username_must_be_stripped(cls, v):
        return v.strip()

def process_user_with_pydantic(data: Dict[str, Any]) -> Optional[User]:
    """
    Parses and validates raw user data using the Pydantic User model.
    Returns a User model instance on success, or None on failure.
    """
    try:
        # `parse_obj` is used to parse a Python dictionary.
        user = User.parse_obj(data)
        return user
    except ValidationError as e:
        print(f"Data validation failed: \n{e}")
        return None

# --- Tests ---

def run_tests():
    print("Running tests...")
    
    valid_data = {
        "id": 1,
        "username": "  john_doe  ",
        "email": "john.doe@example.com",
        "tags": ["customer", "vip"]
    }

    invalid_data_short_username = {
        "id": 2,
        "username": "jo",
        "email": "jane.doe@example.com"
    }
    
    invalid_data_bad_email = {
        "id": 3,
        "username": "jane_doe",
        "email": "jane.doe.example.com" # Missing @
    }

    print("\n--- Testing Pydantic Implementation ---")
    
    # Test 1: Valid data
    try:
        user_model = process_user_with_pydantic(valid_data)
        assert user_model is not None
        assert user_model.id == 1
        # The validator should have stripped the whitespace
        assert user_model.username == "john_doe"
        assert user_model.is_active is True # Should have default value
        print("[PASS] Test 1: Valid data processed correctly.")
    except Exception as e:
        print(f"[FAIL] Test 1: An unexpected error occurred: {e}")

    # Test 2: Invalid username
    user_model_2 = process_user_with_pydantic(invalid_data_short_username)
    if user_model_2 is None:
        print("[PASS] Test 2: Correctly handled short username.")
    else:
        print("[FAIL] Test 2: Did not handle short username correctly.")

    # Test 3: Invalid email
    user_model_3 = process_user_with_pydantic(invalid_data_bad_email)
    if user_model_3 is None:
        print("[PASS] Test 3: Correctly handled invalid email.")
    else:
        print("[FAIL] Test 3: Did not handle invalid email correctly.")

if __name__ == "__main__":
    run_tests()
