# Domain 1: Key Services for Resilience

These services are fundamental for building available and fault-tolerant architectures.

## Amazon EC2 Auto Scaling
*   **Launch Templates:** Define instance configuration (AMI, instance type, security groups).
*   **Auto Scaling Groups (ASG):** Manage groups of EC2 instances.
*   **Scaling Policies:** Target tracking, step scaling, and scheduled scaling.
*   **Health Checks:** EC2 vs ELB status checks.

## Elastic Load Balancing (ELB)
*   **Application Load Balancer (ALB):** Layer 7 (HTTP/HTTPS), path-based routing, target groups.
*   **Network Load Balancer (NLB):** Layer 4 (TCP/UDP), low latency, static IPs.
*   **Gateway Load Balancer (GWLB):** For third-party virtual appliances.

## Amazon Route 53
*   **Routing Policies:** Simple, Weighted, Latency, Failover, Geolocation, Multi-value Answer.
*   **Health Checks:** Monitor endpoint health and trigger failover.

## Amazon S3 (Resilience Features)
*   **Versioning:** Protects against accidental deletes.
*   **Cross-Region Replication (CRR):** For disaster recovery.
*   **Same-Region Replication (SRR):** For compliance or data aggregation.

## Amazon Aurora
*   **Aurora Replicas:** Up to 15, low lag, automatic failover.
*   **Global Database:** Multi-region disaster recovery (RPO < 1s, RTO < 1min).
