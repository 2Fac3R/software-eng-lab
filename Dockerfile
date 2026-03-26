# Use a lightweight Python base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Create a non-root user for security
RUN groupadd -r engineer && useradd -r -g engineer engineer

# Copy project files (respecting .dockerignore)
# We copy everything as the lab serves markdown, python, elixir, and sql files as static text
COPY --chown=engineer:engineer . .

# Switch to the non-root user
USER engineer

# Expose the default port for python3 -m http.server
EXPOSE 8000

# Metadata
LABEL maintainer="Engineering Mastery Lab"
LABEL description="Static web server for the Senior Architect's Blueprint"

# Run the simple HTTP server
# --directory /app ensures it serves from the correct root
# 0.0.0.0 is required to listen on all interfaces within the container
CMD ["python3", "-m", "http.server", "8000", "--bind", "0.0.0.0"]
