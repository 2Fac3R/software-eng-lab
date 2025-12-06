# Module 6 Exam: Containerization and Deployment

**Instructions:** Choose the best answer for each question.

---

**Question 1:** In a `Dockerfile`, what is the primary purpose of the `CMD` instruction?

A) To execute commands during the image build process, such as installing packages.
B) To set a persistent environment variable for the image.
C) To specify the default command that should be run when a container is started from the image.
D) To copy files from the host machine into the image.

---

**Question 2:** What is the fundamental difference between a Docker image and a Docker container?

A) An image is a running process, while a container is a template.
B) An image is a read-only template, while a container is a runnable instance of an image.
C) They are the same thing.
D) An image runs on a single host, while a container can run across a cluster.

---

**Question 3:** You are developing an application that requires a web server, a database, and a caching service to all run simultaneously on your local machine. Which tool is designed to manage this multi-service setup with a single configuration file?

A) `Dockerfile`
B) `Kubernetes`
C) `docker-compose`
D) `kubectl`

---

**Question 4:** In the Kubernetes object model, what is the smallest deployable unit that you can create and manage?

A) A Node
B) A Service
C) A Container
D) A Pod

---

**Question 5:** What is the main advantage of using a multi-stage build in a `Dockerfile`?

A) It makes the build process faster.
B) It allows you to create smaller and more secure production images by separating build-time dependencies from runtime dependencies.
C) It allows you to run multiple containers from a single `Dockerfile`.
D) It automatically publishes the image to Docker Hub.
