# Solution: Refactoring a Django View to be "Clean"

import re
import json
from typing import Protocol, Dict, Any, Optional, Union
from dataclasses import dataclass

# Mock Django classes for demonstration purposes
class HttpRequest:
    method: str
    body: bytes

class JsonResponse:
    def __init__(self, data, status=200): pass

class DjangoORMModel:
    def __init__(self, **kwargs): self.id = 1; self.__dict__.update(kwargs)
    @classmethod
    def create(cls, **kwargs): return cls(**kwargs)

class DjangoObjectsManager:
    def filter(self, **kwargs): return self
    def exists(self): return False
    def create(self, **kwargs): return DjangoORMModel(**kwargs)

class UserModel(DjangoORMModel):
    objects = DjangoObjectsManager()

# --- Original "Fat View" (for reference) ---

# ... (original code omitted for brevity)

# --- Refactored Code ---

# =============================================================================
# CORE BUSINESS LOGIC (e.g., in a `core/` directory)
# =============================================================================

# 1. ENTITIES LAYER
@dataclass
class User:
    id: Optional[int]
    username: str
    email: str

# 2. APPLICATION LAYER (Use Cases & Repository Interfaces)

class UserRepository(Protocol):
    """Defines the interface for user persistence, abstracting the database."""
    def get_by_email(self, email: str) -> Optional[User]: ...
    def save(self, user: User) -> User: ...

@dataclass
class CreateUserRequest:
    username: str
    email: str

class CreateUserUseCase:
    """Contains the core business logic for creating a user."""
    def __init__(self, user_repo: UserRepository):
        self._user_repo = user_repo

    def execute(self, request: CreateUserRequest) -> Union[User, str]:
        # Validation logic that belongs to the use case
        if len(request.username) < 3:
            return "Error: Username too short"
        if not re.match(r"[^@]+@[^@]+\.[^@]+", request.email):
            return "Error: Invalid email"
        
        # Business Rule
        if self._user_repo.get_by_email(request.email):
            return "Error: Email already exists"

        # Create entity and save
        new_user = User(id=None, username=request.username, email=request.email)
        created_user = self._user_repo.save(new_user)
        return created_user

# =============================================================================
# INFRASTRUCTURE & INTERFACE LAYERS (e.g., in a `django_project/` directory)
# =============================================================================

# 3. INFRASTRUCTURE LAYER (Concrete Repository Implementation)

class DjangoUserRepository(UserRepository):
    """Implements the repository interface using the Django ORM."""
    def get_by_email(self, email: str) -> Optional[User]:
        try:
            orm_user = UserModel.objects.get(email=email)
            return User(id=orm_user.id, username=orm_user.username, email=orm_user.email)
        except UserModel.DoesNotExist:
            return None

    def save(self, user: User) -> User:
        orm_user = UserModel.objects.create(username=user.username, email=user.email)
        return User(id=orm_user.id, username=orm_user.username, email=orm_user.email)

# 4. INTERFACE ADAPTERS / WEB LAYER (The new, thin view)

def create_user_view(request: HttpRequest) -> JsonResponse:
    """The thin view layer. It only handles HTTP and calls the use case."""
    if request.method != "POST":
        return JsonResponse({"error": "Invalid method"}, status=405)

    try:
        data = json.loads(request.body)
        # Create the request model for the use case
        use_case_request = CreateUserRequest(username=data["username"], email=data["email"])
    except (KeyError, json.JSONDecodeError):
        return JsonResponse({"error": "Invalid request body"}, status=400)

    # --- Composition Root ---
    # In a real app, this would be handled by a dependency injection container.
    user_repo = DjangoUserRepository()
    use_case = CreateUserUseCase(user_repo=user_repo)
    # --- End Composition Root ---

    # Execute the use case
    result = use_case.execute(use_case_request)

    # Present the result
    if isinstance(result, User):
        return JsonResponse({"id": result.id, "username": result.username}, status=201)
    else: # It's an error string
        if "already exists" in result:
            return JsonResponse({"error": result}, status=409)
        else:
            return JsonResponse({"error": result}, status=400)
