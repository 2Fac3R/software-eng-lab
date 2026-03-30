# Domain 1: Hands-On - Multi-Tier Resilient Architecture

In this lab, you will design a multi-tier, highly available application architecture on AWS.

## Objective
Design a system that survives the failure of an entire Availability Zone (AZ).

## Scenario
A company has a web application that needs to be highly available. The application consists of:
1.  **Web Tier:** Apache web servers.
2.  **Application Tier:** Logic servers.
3.  **Database Tier:** Relational database.

## Lab Tasks
1.  **VPC Setup:** Create a VPC with public and private subnets across 2 AZs.
2.  **ELB Configuration:** Deploy an Application Load Balancer in the public subnets.
3.  **Auto Scaling:** Configure an Auto Scaling Group for the web/app servers in the private subnets.
4.  **Database:** Deploy an Amazon RDS instance in Multi-AZ mode.
5.  **Simulation:** "Destroy" one AZ and observe how the system continues to function.

## Architecture Diagram (Mental)
*   **Public Subnets (AZ1, AZ2):** ALB, NAT Gateways.
*   **Private Subnets (AZ1, AZ2):** EC2 Instances (ASG).
*   **Database Subnets (AZ1, AZ2):** RDS (Primary and Standby).
