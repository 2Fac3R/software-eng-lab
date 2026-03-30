# Domain 4 Cheatsheet: Cost Optimization

## Cost Pillars
*   **Inventory:** Use Tagging to track costs.
*   **Efficiency:** Use Right-sizing and Managed Services.
*   **Elasticity:** Scale based on demand (ASG).

## Purchase Comparison
| Model | Use Case | Savings |
| :--- | :--- | :--- |
| **On-Demand** | Spiky, Short-term | 0% |
| **Reserved** | Steady state, 1-3 years | Up to 72% |
| **Savings Plan** | Flexible across instances | Up to 72% |
| **Spot** | Fault-tolerant, Batch | Up to 90% |

## Storage Cost Rules
*   **Standard-IA:** Best for data accessed once a month.
*   **Intelligent-Tiering:** Best for unknown or changing access patterns.
*   **Glacier:** Best for archives where minutes/hours of retrieval is OK.
*   **Transfer:** Minimize cross-region and cross-AZ traffic.
