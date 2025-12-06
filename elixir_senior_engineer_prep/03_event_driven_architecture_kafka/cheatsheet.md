# Module 3: EDA & Kafka - Cheatsheet (Extended)

---

### Kafka Glossary

| Term | Description |
| :--- | :--- |
| **Topic** | A named category or feed to which events are published. |
| **Partition** | A division of a topic. The unit of parallelism in Kafka. |
| **Offset** | A unique, sequential ID for each event within a partition. |
| **Consumer Group** | A group of consumers that work together to process a topic. |
| **Schema Registry** | A centralized service to manage and validate data schemas (like Avro). |

---

### Kafka Delivery Semantics

| Semantic | Guarantee | Common Scenario |
| :--- | :--- | :--- |
| **At most once** | Messages may be lost, but are never redelivered. | Non-critical metrics, logging. |
| **At least once** | Messages are never lost, but may be redelivered. | Most common use case. Requires idempotent consumers. |
| **Exactly once** | Messages are delivered once and only once. | Critical financial transactions, data processing pipelines. |

---

### The Saga Pattern

A pattern for managing distributed transactions. It's a sequence of local transactions where each transaction updates its own database and publishes an event to trigger the next step.

**Key Components:**
-   **Local Transaction:** An atomic operation within a single service.
-   **Compensating Transaction:** An operation that reverts the action of a previous local transaction if the saga fails.

**Flow:**
`Start Saga -> T1 -> T2 -> T3 -> End`
`If T3 fails: -> Execute C2 -> Execute C1 -> End` (where C1/C2 are compensating transactions for T1/T2).

---

### Minimal Broadway Module Skeleton

```elixir
defmodule MyPipeline.Broadway do
  use Broadway

  alias Broadway.Message

  def start_link(opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module: BroadwayKafka.Producer,
        # ... producer config ...
      ],
      processors: [
        default: [concurrency: 10]
      ],
      batchers: [
        default: [batch_size: 100, batch_timeout: 200]
      ]
    )
  end

  @impl true
  def handle_message(_, message, _), do: message

  @impl true
  def handle_batch(_, messages, _, _), do: messages
end
```
