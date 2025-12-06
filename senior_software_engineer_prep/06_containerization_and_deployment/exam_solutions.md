# Module 6 Exam Solutions: Containerization and Deployment

---

**Question 1:** In a `Dockerfile`, what is the primary purpose of the `CMD` instruction?

**Answer:** C
**Explanation:** The `CMD` instruction sets the default command and/or parameters, which will be executed when a container starts. `RUN` is used for executing commands during the build process.

---

**Question 2:** What is the fundamental difference between a Docker image and a Docker container?

**Answer:** B
**Explanation:** An image is the static, immutable blueprint from which containers are created. A container is a live, running instance of an image. You can create many containers from a single image.

---

**Question 3:** You are developing an application that requires a web server, a database, and a caching service to all run simultaneously on your local machine. Which tool is designed to manage this multi-service setup with a single configuration file?

**Answer:** C
**Explanation:** `docker-compose` is specifically designed for defining and running multi-container applications. It uses a `docker-compose.yml` file to configure and link multiple services, making it ideal for local development environments.

---

**Question 4:** In the Kubernetes object model, what is the smallest deployable unit that you can create and manage?

**Answer:** D
**Explanation:** A Pod is the smallest unit of deployment in Kubernetes. It represents a single instance of a running process in a cluster and encapsulates one or more tightly coupled containers.

---

**Question 5:** What is the main advantage of using a multi-stage build in a `Dockerfile`?

**Answer:** B
**Explanation:** Multi-stage builds allow you to use a larger image with all the necessary build tools and dependencies to compile your application, and then copy only the final compiled artifacts into a minimal, clean runtime image. This drastically reduces the size and attack surface of your final production image.
