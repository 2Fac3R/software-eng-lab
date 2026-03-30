# Domain 2: Key Services for Performance

## Amazon CloudFront
*   **Edge Locations:** Global network of data centers to cache content.
*   **Origins:** S3 buckets, EC2 instances, or ALBs.
*   **Cache Behaviors:** Path-based configuration for TTL and allowed methods.

## Amazon DynamoDB
*   **Key-Value Store:** NoSQL database.
*   **DAX (DynamoDB Accelerator):** Fully managed, highly available, in-memory cache for DynamoDB.
*   **Global Tables:** Multi-region, fully managed, multi-active database.

## Amazon ElastiCache
*   **Redis:** Supports data structures, replication, and high availability.
*   **Memcached:** Simple, sub-millisecond key-value store.

## AWS Lambda
*   **Function:** Code that runs in response to events.
*   **Scaling:** One execution environment per concurrent request.
*   **Limits:** 15 minutes max execution time, 10GB RAM max.

## Amazon EBS (Volume Types)
*   **SSD-backed:** gp2/gp3, io1/io2.
*   **HDD-backed:** st1 (Throughput Optimized), sc1 (Cold HDD).
