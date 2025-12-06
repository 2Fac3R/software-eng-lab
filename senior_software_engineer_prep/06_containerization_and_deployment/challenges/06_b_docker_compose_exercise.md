# Challenge: Writing a `docker-compose.yml` File

**Instructions:**

Your task is to create a `docker-compose.yml` file to run the Django application from the previous challenge along with a PostgreSQL database for local development.

**Your `docker-compose.yml` file should define two services:**

1.  **`web` service:**
    *   It should build the image from the `Dockerfile` in the current directory.
    *   It should map port `8000` on the host to port `8000` in the container.
    *   It should mount the current directory (`.`) as a volume into the container's code directory (e.g., `/app`). This allows for live code reloading during development.
    *   It should define environment variables for the database connection (e.g., `DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PASS`).
    *   It should specify that the `web` service `depends_on` the `db` service to control startup order.

2.  **`db` service:**
    *   It should use the official `postgres:16-alpine` image.
    *   It should mount a named volume to `/var/lib/postgresql/data` to ensure the database data persists even if the container is removed.
    *   It should use the same environment variables as the `web` service to configure the database user, password, and name.

3.  **Top-level `volumes` key:**
    *   Define the named volume used by the `db` service.

---

**(Write your complete `docker-compose.yml` file below)**

