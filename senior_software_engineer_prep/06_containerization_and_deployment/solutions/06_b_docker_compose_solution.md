# Solution: Writing a `docker-compose.yml` File

```yaml
version: '3.8'

# Define all the services that make up the application
services:
  # The Python/Django web application service
  web:
    # Build the image from the Dockerfile in the current directory
    build: .
    # The command to run inside the container, overriding the Dockerfile's CMD
    # This uses Django's development server, which is good for local dev.
    command: python manage.py runserver 0.0.0.0:8000
    # Mount the current directory on the host to /app in the container.
    # This allows code changes to be reflected live without rebuilding the image.
    volumes:
      - .:/app
    # Map port 8000 on the host to port 8000 in the container
    ports:
      - "8000:8000"
    # Define environment variables needed by the application
    environment:
      - DB_HOST=db
      - DB_NAME=mydatabase
      - DB_USER=myuser
      - DB_PASS=mypassword
    # Control startup order. This ensures the `db` service is started before the `web` service.
    depends_on:
      - db

  # The PostgreSQL database service
  db:
    # Use the official PostgreSQL 16 image with the lightweight Alpine variant
    image: postgres:16-alpine
    # Mount a named volume to persist database data across container restarts
    volumes:
      - postgres_data:/var/lib/postgresql/data/
    # Environment variables to configure the PostgreSQL server
    # These must match the ones used by the `web` service.
    environment:
      - POSTGRES_DB=mydatabase
      - POSTGRES_USER=myuser
      - POSTGRES_PASSWORD=mypassword

# Define the named volume for data persistence
volumes:
  postgres_data:

```
