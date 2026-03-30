# Domain 3 Cheatsheet: Secure Applications

## Shared Responsibility Model
*   **AWS:** Security **OF** the cloud (Hardware, Global Infrastructure).
*   **Customer:** Security **IN** the cloud (Data, OS, Network configuration).

## Security Quick Facts
*   **IAM Role:** Temporary credentials for services.
*   **KMS:** Multi-tenant, integrated with most AWS services.
*   **CloudHSM:** Dedicated hardware for compliance/regulation.
*   **Security Group:** Stateful (Return traffic allowed by default), allows only.
*   **NACL:** Stateless (Return traffic MUST be allowed explicitly), allows and denies.
*   **AWS GuardDuty:** Threat detection using machine learning.
*   **AWS Artifact:** Portal for on-demand access to compliance reports.
