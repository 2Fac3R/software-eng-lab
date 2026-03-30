# Domain 2 Cheatsheet: High-Performing Architectures

## Performance Comparison: Storage
| Service | Type | Use Case |
| :--- | :--- | :--- |
| **EBS** | Block | Database storage, Boot volumes |
| **S3** | Object | Media, Backups, Static Web |
| **EFS** | File (Linux) | Shared content, CMS |
| **FSx Lustre** | File (HPC) | Machine Learning, Big Data |

## Caching Strategy
*   **Client Side:** Browser cache.
*   **Edge:** CloudFront.
*   **API/Compute:** API Gateway caching, Lambda Provisioned Concurrency.
*   **Database:** ElastiCache (Redis/Memcached), DynamoDB DAX.

## Networking
*   **CloudFront:** Caches content globally.
*   **Global Accelerator:** Optimizes the network path (IP Anycast).
*   **Direct Connect:** Dedicated physical connection (high speed, private).
