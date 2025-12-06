# Module 6: Containerization and Deployment (Docker & Kubernetes)

This module covers the "nice-to-have" skills related to containerization and deployment. In modern software development, these skills are practically essential for a senior engineer, as they are fundamental to how applications are built, shipped, and operated.

## 1. Containerization Fundamentals

**Why Containers?**
Before containers, the common problem was "it works on my machine." A developer might have a different version of Python, a library, or an operating system, leading to bugs that were hard to reproduce. Containers solve this by packaging an application with all of its dependencies—libraries, configuration files, and a runtime—into a single, isolated unit.

**Containers vs. Virtual Machines (VMs):**
-   **VMs:** Virtualize the hardware, running a full guest operating system on top of a hypervisor. They are heavy and slow to start.
-   **Containers:** Virtualize the operating system. All containers on a host share the host's OS kernel. They are lightweight, fast, and efficient.

## 2. Docker

Docker is the most popular platform for building and running containers.

-   **Image vs. Container:** This is a crucial distinction.
    -   An **Image** is a read-only template or blueprint. It contains the application code, libraries, and dependencies. (e.g., `postgres:16` image).
    -   A **Container** is a running instance of an image. You can have many containers running from the same image.

-   **The `Dockerfile`:** A `Dockerfile` is a text file that contains a set of instructions for building a Docker image.

    **Common Instructions:**
    -   `FROM`: Specifies the base image to start from (e.g., `FROM python:3.11-slim`).
    -   `WORKDIR`: Sets the working directory for subsequent instructions.
    -   `COPY`: Copies files from your host machine into the image.
    -   `RUN`: Executes a command during the image build process (e.g., `RUN pip install -r requirements.txt`).
    -   `CMD`: Specifies the default command to run when a container is started from the image.
    -   `EXPOSE`: Informs Docker that the container listens on the specified network ports at runtime.

-   **Multi-stage Builds:** A best practice for creating small and secure production images. You use one stage (e.g., with a full Python SDK) to build your application and install dependencies, and a second, minimal stage (e.g., a plain OS image) to copy only the necessary runtime artifacts. This discards all build-time dependencies and source code, reducing the final image size and attack surface.

## 3. `docker-compose`

`docker-compose` is a tool for defining and running multi-container Docker applications. It uses a YAML file (`docker-compose.yml`) to configure all the application's services, networks, and volumes.

**Why use it?** It simplifies the process of running a full local development environment. With a single command (`docker-compose up`), you can start your web application, a database, a caching service, and any other required services.

**Example `docker-compose.yml`:**
```yaml
version: '3.8'
services:
  web:
    build: . # Build the image from the Dockerfile in the current directory
    command: python manage.py runserver 0.0.0.0:8000
    volumes:
      - .:/code
    ports:
      - "8000:8000"
    depends_on:
      - db

  db:
    image: postgres:16 # Use an official image from Docker Hub
    volumes:
      - postgres_data:/var/lib/postgresql/data/
    environment:
      - "POSTGRES_HOST_AUTH_METHOD=trust"

volumes:
  postgres_data:
```

## 4. Kubernetes (k8s) Fundamentals

While Docker is for running containers on a single machine, **Kubernetes** is a **container orchestration platform** for running and managing containers at scale across a cluster of many machines.

**What problems does it solve?**
-   **Deployment:** How do I roll out a new version of my application with zero downtime?
-   **Scaling:** How do I automatically add more containers when traffic increases?
-   **Self-healing:** If a container or a whole machine crashes, how do I automatically replace it?

**Core Concepts:**
-   **Cluster:** A set of machines (Nodes) on which your containerized applications run.
-   **Node:** A single worker machine in a cluster.
-   **Pod:** The smallest and simplest unit in the Kubernetes object model. A Pod represents a running process in your cluster and contains one or more containers.
-   **Service:** A stable network endpoint (a fixed IP address and DNS name) that exposes a set of Pods to the network. Services allow for load balancing and service discovery.
-   **Deployment:** A declarative object that manages a set of identical Pods. You tell the Deployment you want "3 replicas of my app," and it works to ensure that 3 Pods are always running, handling updates and rollbacks.

-   **Helm & Kustomize:** These are tools for managing Kubernetes configuration files. As applications grow, managing raw YAML files becomes difficult. **Helm** is a package manager for Kubernetes, and **Kustomize** is a template-free way to customize application configuration.
