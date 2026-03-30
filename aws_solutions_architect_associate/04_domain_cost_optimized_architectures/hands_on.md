# Domain 4: Hands-On - Cost Reduction Workshop

## Objective
Analyze a given architecture and identify cost-saving opportunities.

## Scenario
A startup has a dev environment with:
1.  **EC2:** 5 m5.xlarge instances running 24/7.
2.  **S3:** 10TB of data in Standard class, mostly old backups.
3.  **RDS:** Single-AZ m5.large for development.

## Lab Tasks
1.  **Right-sizing:** Use Compute Optimizer to find if the m5.xlarge instances are over-provisioned.
2.  **Scheduling:** Implement a start/stop schedule for EC2 instances using Instance Scheduler or Lambda.
3.  **Lifecycle:** Create an S3 Lifecycle rule to move data older than 90 days to Glacier Deep Archive.
4.  **Purchase Options:** Analyze the cost difference of switching the dev RDS to a Spot Instance (Conceptual - RDS doesn't support Spot, but dev apps could).
5.  **Cost Explorer:** Create a report showing cost by "Environment" tag.
