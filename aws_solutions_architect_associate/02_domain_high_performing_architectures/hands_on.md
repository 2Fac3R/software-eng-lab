# Domain 2: Hands-On - Performance Optimization

In this lab, you will optimize a standard architecture for performance using caching and edge computing.

## Objective
Reduce latency for a web application using CloudFront and ElastiCache.

## Scenario
A static website hosted on S3 and a dynamic API on EC2 are experiencing high latency for global users.

## Lab Tasks
1.  **S3 Website:** Configure an S3 bucket for static website hosting.
2.  **CloudFront:** Create a CloudFront distribution with the S3 bucket as the origin.
3.  **EC2 API:** Deploy a simple API on an EC2 instance.
4.  **ElastiCache:** Deploy a Redis cluster and modify the API to cache database results.
5.  **Global Accelerator:** (Conceptual) Explain how Global Accelerator would help for non-HTTP traffic.

## Architecture Diagram (Mental)
*   **Users** -> **CloudFront** -> **S3 (Static Content)**
*   **Users** -> **CloudFront** -> **ALB** -> **EC2 (API)** -> **ElastiCache (Redis)** -> **RDS**
