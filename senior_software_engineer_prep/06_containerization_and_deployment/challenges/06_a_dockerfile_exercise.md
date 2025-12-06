# Challenge: Writing a Dockerfile for a Python Application

**Instructions:**

Your task is to write a `Dockerfile` for a simple Django application. The goal is to create an optimized, production-ready image using a multi-stage build.

**Project Structure:**
```
my_django_app/
├── Dockerfile
├── manage.py
├── my_project/
│   └── ...
└── requirements.txt
```

**`requirements.txt` contains:**
```
django
gunicorn
```

**Your `Dockerfile` should:**

1.  **Build Stage:**
    *   Start from a full-featured Python image (e.g., `python:3.11`).
    *   Set a working directory (e.g., `/app`).
    *   Install `uv` for faster package installation.
    *   Copy the `requirements.txt` file into the image.
    *   Install the Python dependencies using `uv pip install`.
    *   Copy the rest of the application code into the image.

2.  **Final Stage:**
    *   Start from a minimal, secure base image (e.g., `python:3.11-slim`).
    *   Set a working directory.
    *   Create a non-root user to run the application for better security.
    *   Copy the installed packages from the `build-stage` into the final image.
    *   Copy the application code from the `build-stage`.
    *   Switch to the non-root user.
    *   Expose port 8000.
    *   Set the default command (`CMD`) to run the application using `gunicorn`.

---

**(Write your complete `Dockerfile` below)**

