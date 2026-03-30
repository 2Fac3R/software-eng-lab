# Domain 1 Cheatsheet: Resilient Architectures

| Strategy | RPO (Data Loss) | RTO (Downtime) | Cost |
| :--- | :--- | :--- | :--- |
| **Backup & Restore** | Hours | 24h+ | Low |
| **Pilot Light** | Minutes | Hours | Med-Low |
| **Warm Standby** | Seconds | Minutes | Medium |
| **Multi-Site (Active-Active)** | Zero | Zero | High |

## Resilience Key Facts
*   **ALB:** Layer 7, path/host based routing.
*   **NLB:** Layer 4, ultra-high performance, static IP.
*   **Multi-AZ RDS:** Sync replication, automatic failover.
*   **Read Replicas:** Async replication, for read scaling.
*   **S3 Durability:** 99.999999999% (11 9's).
*   **SQS Visibility Timeout:** Time during which a message is "hidden" from other consumers.
