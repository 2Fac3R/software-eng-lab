# Challenge: Refactoring a Django View to be "Clean"

# Instructions:
# The code below represents a typical "fat view" in Django. It handles
# request parsing, validation, business logic, and database interaction all in one place.
#
# Your task is to refactor this code to follow the principles of Clean Architecture.
# For simplicity, you will write all the refactored components in this single file,
# but use comments to indicate which architectural layer each component belongs to.

# You will need to create:
# 1. A pure Python `User` entity.
# 2. A `CreateUserUseCase` class containing the core business logic.
# 3. A `UserRepository` protocol (interface) and a concrete implementation.
# 4. A new, thin `create_user_view` function.

import re
from typing import Protocol, Dict, Any
from django.http import HttpRequest, JsonResponse
from django.db import models

# --- Original "Fat View" (To be refactored) ---

# Let's imagine this is a Django ORM model
class UserModel(models.Model):
    username = models.CharField(max_length=100)
    email = models.EmailField()

    class Meta:
        app_label = "fake_app"

def create_user_fat_view(request: HttpRequest) -> JsonResponse:
    if request.method != "POST":
        return JsonResponse({"error": "Invalid method"}, status=405)

    try:
        data = json.loads(request.body)
        username = data["username"]
        email = data["email"]

        # 1. Validation logic mixed in the view
        if len(username) < 3:
            return JsonResponse({"error": "Username too short"}, status=400)
        if not re.match(r"[^@]+@[^@]+\.[^@]+", email):
            return JsonResponse({"error": "Invalid email"}, status=400)

        # 2. Business logic mixed in the view
        if UserModel.objects.filter(email=email).exists():
            return JsonResponse({"error": "Email already exists"}, status=409)

        # 3. Database logic mixed in the view
        user = UserModel.objects.create(username=username, email=email)

        return JsonResponse({"id": user.id, "username": user.username}, status=201)

    except (KeyError, json.JSONDecodeError):
        return JsonResponse({"error": "Invalid request body"}, status=400)


# --- Your Refactored Code Here ---

# TODO: 1. ENTITIES LAYER
# (Pure Python objects, no Django)


# TODO: 2. APPLICATION LAYER (Use Cases & Repository Interfaces)
# (Pure Python, no Django)


# TODO: 3. INFRASTRUCTURE LAYER (Concrete Repository Implementation)
# (This is where Django ORM is allowed)


# TODO: 4. INTERFACE ADAPTERS / WEB LAYER (The new, thin view)
# (This layer handles HTTP and calls the use case)
