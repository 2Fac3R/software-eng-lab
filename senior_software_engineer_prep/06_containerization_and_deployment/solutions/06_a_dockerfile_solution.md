# Solution: Writing a Dockerfile for a Python Application

```Dockerfile
# =============================================================================
# 1. Build Stage: Used to install dependencies
# =============================================================================
FROM python:3.11 as builder

# Set the working directory in the container
WORKDIR /app

# Install uv for faster package installation
RUN pip install uv

# Copy the requirements file and install dependencies
# This is done in a separate step to leverage Docker layer caching.
# The layer will only be rebuilt if requirements.txt changes.
COPY requirements.txt .
RUN uv pip install --system --no-cache -r requirements.txt

# Copy the rest of the application code
COPY . .

# =============================================================================
# 2. Final Stage: The actual production image
# =============================================================================
FROM python:3.11-slim

WORKDIR /app

# Create a non-root user for security
RUN useradd --create-home appuser

# Copy installed packages from the builder stage
# The location of site-packages can be found by running `python -m site`
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

# Copy application code from the builder stage
COPY --from=builder /app .

# Change ownership of the files to the non-root user
RUN chown -R appuser:appuser /app

# Switch to the non-root user
USER appuser

# Expose the port the app runs on
EXPOSE 8000

# Set the default command to run the application
# Gunicorn is a production-ready WSGI server.
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "my_project.wsgi"]

```
