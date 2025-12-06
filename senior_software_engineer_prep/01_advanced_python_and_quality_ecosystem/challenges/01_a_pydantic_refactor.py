# Challenge: Refactor with Pydantic

# Instructions:
# The function `process_user_data` below takes a dictionary of raw user data,
# manually validates it, and returns a cleaned dictionary. This approach is
# verbose, error-prone, and hard to maintain.
#
# Your task is to refactor this using Pydantic.
#
# 1. Create a `User` model using `pydantic.BaseModel`.
# 2. The model should have the following fields with appropriate types:
#    - `id`: integer
#    - `username`: string
#    - `email`: a valid email string
#    - `is_active`: boolean, with a default value of `True`
#    - `tags`: a list of strings, can be empty
# 3. Add a custom validator to ensure the `username` is at least 3 characters long.
# 4. Create a new function `process_user_with_pydantic` that takes the raw
#    dictionary, uses your new `User` model to parse and validate it, and
#    returns the validated model instance.
# 5. The function should handle potential `ValidationError` exceptions gracefully.

from typing import Dict, Any, Optional, List
from pydantic import BaseModel, validator, ValidationError

# --- Original Function ---

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

# --- Your Pydantic Implementation Here ---

class User(BaseModel):
    id: int
    username: str
    email: str
    is_active: bool = True
    tags: List[str] = []

    @validator('username')
    def username_must_be_at_least_3_chars(cls, v):
        if len(v.strip()) < 3:
            raise ValueError('Username must be at least 3 characters')
        return v.strip()

    @validator('email')
    def email_must_be_valid(cls, v):
        if "@" not in v:
            raise ValueError('Invalid email format')
        return v

def process_user_with_pydantic(data: Dict[str, Any]) -> Optional[User]:
    """Processes raw user data using Pydantic model."""
    try:
        user = User(**data)
        return user
    except ValidationError as e:
        print(f"Validation Error: {e}")
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
        assert user_model.username == "john_doe" # Should be stripped by the model
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
    # This is to allow running the file even before the solution is implemented
    try:
        process_user_with_pydantic
        run_tests()
    except NameError:
        print("Skipping tests: `process_user_with_pydantic` is not yet defined.")
