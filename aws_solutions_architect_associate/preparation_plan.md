# Study Plan: AWS Solutions Architect Associate (SAA-C03)

This plan is designed to help you master the architectural principles of AWS and pass the SAA-C03 certification exam. It focuses on designing resilient, high-performing, secure, and cost-optimized architectures.

---

### **Module 1: Design Resilient Architectures (26%)**
Focuses on designing solution architectures that are reliable and resilient.

*   **Theory:** High availability, disaster recovery (RTO/RPO), decoupling (SQS, SNS), and multi-AZ/multi-region strategies.
*   **Key Services:** EC2 (Auto Scaling), ELB, Route 53, S3 (Replication), Aurora (Global Database).
*   **Practical Challenges:** Design a multi-tier application architecture that survives an AZ failure.
*   **Cheatsheet:** Disaster Recovery strategies and AWS service resilience features.

---

### **Module 2: Design High-Performing Architectures (24%)**
Focuses on selecting the right services for performance and scalability.

*   **Theory:** Selecting high-performing storage (EBS types, FSx), compute (Instance types), and database solutions. Caching strategies and edge computing.
*   **Key Services:** EBS, EFS, ElastiCache, CloudFront, Lambda, API Gateway.
*   **Practical Challenges:** Optimize a database-heavy application for low latency using ElastiCache and CloudFront.
*   **Cheatsheet:** Storage performance comparison (EBS vs EFS vs S3).

---

### **Module 3: Design Secure Applications and Architectures (30%)**
The most heavily weighted domain, focusing on the AWS Well-Architected Security Pillar.

*   **Theory:** Identity and Access Management (IAM), data protection at rest and in transit, network security (VPC, Security Groups, NACLs).
*   **Key Services:** IAM, KMS, Secrets Manager, VPC (Flow Logs, Peering, Endpoints), WAF, Shield.
*   **Practical Challenges:** Design a secure VPC architecture with public and private subnets, including Bastion hosts or Systems Manager.
*   **Cheatsheet:** IAM Policies vs Service Control Policies (SCPs); Shared Responsibility Model.

---

### **Module 4: Design Cost-Optimized Architectures (20%)**
Focuses on minimizing costs while meeting performance and reliability requirements.

*   **Theory:** Right-sizing, purchasing options (Spot vs Reserved vs Savings Plans), and cost-effective data transfer.
*   **Key Services:** Cost Explorer, AWS Budgets, S3 Storage Classes, Compute Optimizer.
*   **Practical Challenges:** Evaluate an architecture and identify 3 ways to reduce costs by 30% without affecting availability.
*   **Cheatsheet:** S3 Storage Class comparison and cost-optimization checklist.

---

### **Module 5: Final Preparation and Practice Exams**
Reviewing all domains and testing knowledge with full-length practice exams.

*   **Practice Exam 1:** Focus on foundational architectural concepts.
*   **Practice Exam 2:** Focus on complex, multi-service scenarios.
*   **Final Review:** Focus on the Well-Architected Framework 6 Pillars.
