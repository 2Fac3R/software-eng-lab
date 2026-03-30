# Domain 1: Design Resilient Architectures

Designing resilient architectures is about ensuring that your system can recover from failures and continue to function.

## Key Concepts
*   **High Availability (HA):** Systems that are continuously operational for a long time.
*   **Fault Tolerance:** The ability of a system to continue operating properly in the event of the failure of some of its components.
*   **Disaster Recovery (DR):** Strategies to restore functionality after a catastrophic event.
*   **Decoupling:** Using message queues (SQS) or pub/sub (SNS) to separate components so a failure in one doesn't bring down the others.

## Core Services for Resilience
*   **Amazon Route 53:** DNS with health checks and failover routing.
*   **Elastic Load Balancing (ELB):** Distributes traffic across multiple targets.
*   **Amazon EC2 Auto Scaling:** Automatically adjusts the number of EC2 instances.
*   **Amazon S3:** Highly durable storage with cross-region replication.
*   **Amazon RDS/Aurora:** Multi-AZ deployments for high availability.

## Architectural Patterns
*   **Multi-AZ Architectures:** Deploying resources across multiple Availability Zones to protect against data center failures.
*   **Stateless Applications:** Storing session data in a database or cache (e.g., ElastiCache) rather than on the application server.
