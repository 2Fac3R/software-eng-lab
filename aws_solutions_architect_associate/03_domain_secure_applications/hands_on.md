# Domain 3: Hands-On - Securing a Three-Tier App

## Objective
Design and implement security for a multi-tier application.

## Lab Tasks
1.  **IAM Roles:** Create an IAM role for an EC2 instance to access an S3 bucket.
2.  **VPC Security:** Create public and private subnets. Place the DB in a private subnet with NO internet access.
3.  **Security Groups:** Create tiered security groups (Web SG allows 80, App SG allows only Web SG, DB SG allows only App SG).
4.  **Encryption:** Create a KMS key and encrypt an EBS volume and an S3 bucket.
5.  **Secrets Manager:** Store DB credentials in Secrets Manager and retrieve them from the app.

## Architecture Diagram (Mental)
*   **S3 (Encrypted with KMS)**
*   **ALB SG** -> **EC2 App SG** -> **RDS DB SG**
*   **IAM Role (EC2-to-S3-Access)**
