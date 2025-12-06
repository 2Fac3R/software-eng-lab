# Module 6: Containerization & Deployment - Cheatsheet

---

### `Dockerfile` Common Instructions

| Instruction | Purpose |
| :--- | :--- |
| `FROM` | Specifies the base image for the build. |
| `WORKDIR` | Sets the current working directory for subsequent commands. |
| `COPY` | Copies files/directories from the host into the image's filesystem. |
| `RUN` | Executes a command during the build process (e.g., installing packages). Creates a new image layer. |
| `CMD` | Provides the default command to execute when a container starts. Can be overridden. |
| `ENTRYPOINT` | Configures a container that will run as an executable. Harder to override than `CMD`. |
| `EXPOSE` | Documents which port the container listens on. Does not actually publish the port. |
| `ENV` | Sets a persistent environment variable in the image. |

---

### `docker` vs. `docker-compose`

| Task | `docker` (Single Container) | `docker-compose` (Multi-Container) |
| :--- | :--- | :--- |
| **Build** | `docker build -t my-image .` | `docker-compose build` |
| **Run** | `docker run -p 8000:8000 my-image` | `docker-compose up` |
| **Stop** | `docker stop <container_id>` | `docker-compose down` |
| **List Running** | `docker ps` | `docker-compose ps` |
| **View Logs** | `docker logs <container_id>` | `docker-compose logs -f <service_name>` |

---

### Kubernetes Glossary

| Term | Description |
| :--- | :--- |
| **Cluster** | A set of worker machines, called Nodes, that run containerized applications. |
| **Node** | A single machine (VM or physical) in a Kubernetes cluster. |
| **Pod** | The smallest deployable unit. It's a wrapper around one or more containers. |
| **Service** | A stable network endpoint (IP address and DNS name) that directs traffic to a set of Pods. |
| **Deployment** | A declarative object that manages a ReplicaSet, which in turn manages a set of identical Pods. |
| **ReplicaSet** | Ensures that a specified number of Pod replicas are running at any given time. |

---

### Basic `kubectl` Commands

`kubectl` is the command-line tool for interacting with a Kubernetes cluster.

| Command | Description |
| :--- | :--- |
| `kubectl get pods` | List all pods in the current namespace. |
| `kubectl get services` | List all services. |
| `kubectl get deployments` | List all deployments. |
| `kubectl logs <pod-name>` | Print the logs for a specific pod. |
| `kubectl describe pod <pod-name>` | Show detailed information about a pod, useful for debugging. |
| `kubectl apply -f my-app.yaml` | Create or update a resource from a YAML file. |
| `kubectl delete -f my-app.yaml` | Delete a resource defined in a YAML file. |
