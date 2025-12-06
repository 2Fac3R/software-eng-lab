# Module 3: Event-Driven Architectures and Kafka (Extended)

This module addresses the explicit job requirement for a "solid understanding of event-driven architectures and experience with technologies like Kafka." We will explore the theory behind EDA, dive deep into Kafka's guarantees, and see how to implement these concepts idiomatically in Elixir.

### Official Documentation
*   [Broadway Official Guide](https://hexdocs.pm/broadway/Broadway.html)
*   [Confluent: Kafka Delivery Semantics](https://www.confluent.io/blog/kafka-delivery-guarantees/)
*   [Confluent: Schema Registry](https://docs.confluent.io/platform/current/schema-registry/index.html)

---

## 1. Principles of Event-Driven Architecture (EDA)

EDA decouples services by having them communicate through events rather than direct requests. This leads to more resilient, scalable, and maintainable systems.

-   **Producer:** Publishes events to an event broker.
-   **Event Broker:** A central router (e.g., Kafka) that streams events to consumers.
-   **Consumer:** Subscribes to and processes events.

### The Saga Pattern
In a distributed system, you cannot use a traditional two-phase commit transaction across multiple services. The **Saga Pattern** is a way to manage data consistency across microservices in the absence of distributed transactions.

-   **How it works:** A saga is a sequence of local transactions. Each local transaction updates its own database and publishes an event that triggers the next transaction in the saga. If a local transaction fails, the saga executes a series of **compensating transactions** that undo the preceding transactions.
-   **Example (Order Service):**
    1.  `Order Service` saves an order with `status: :pending` and publishes `OrderCreated` event.
    2.  `Payment Service` consumes `OrderCreated`, processes payment, and publishes `PaymentProcessed`.
    3.  `Inventory Service` consumes `PaymentProcessed` and ships the order.
    4.  **Failure:** If the `Payment Service` fails, it publishes a `PaymentFailed` event. The `Order Service` consumes this and runs a compensating transaction to update the order status to `:failed`.

---

## 2. Apache Kafka: A Deep Dive

### Producer Guarantees (Delivery Semantics)
-   **At most once:** Messages may be lost but are never redelivered. Achieved by setting `acks=0`.
-   **At least once:** Messages are never lost but may be redelivered. This is the most common setting. Achieved by setting `acks=all` on the producer and having consumers commit offsets after processing.
-   **Exactly once:** Messages are delivered exactly one time without loss or duplication. This is critical for financial systems and is achieved in Kafka through **idempotent producers** and **transactions**.

### Data Serialization: JSON vs. Avro
-   **JSON:** Human-readable and ubiquitous, but has no schema enforcement.
-   **Avro:** A binary format that bundles data with its schema. It is highly efficient and supports **schema evolution**, which allows you to change the data schema without breaking downstream consumers.
-   **Schema Registry:** A centralized service that stores and validates your Avro schemas. Producers and consumers talk to the registry to ensure the data they are sending/receiving conforms to a valid, compatible schema. This is a best practice for any serious Kafka deployment.

---

## 3. Building Pipelines with Broadway

Broadway is a high-level Elixir library for building concurrent and fault-tolerant data-processing pipelines. It integrates perfectly with OTP.

### Broadway's Architecture

```text
+----------+   +-----------------+
| Producer |-->|    Processors   |-->+---------+
| (Kafka)  |   | (Concurrent     |  | Batcher |
+----------+   |  Workers)       |-->+---------+
             +-----------------+
```

-   **Producer:** Fetches messages from the source (e.g., Kafka).
-   **Processors:** A pool of concurrent workers that execute your `handle_message` logic for each message.
-   **Batchers:** Group messages together for bulk operations (e.g., inserting 1000 records into a database at once).

### Key Features for Senior Engineers
-   **Back-pressure:** Broadway automatically monitors the demand of your processors. If they are getting overwhelmed, it tells the producer to stop fetching new messages until the system catches up. This prevents your system from crashing due to memory overload.
-   **Fault Tolerance:** Because each processor is an OTP process, if one crashes while processing a message, a supervisor will restart it. Broadway ensures the message is not lost and will be re-processed.
-   **Batching:** The `handle_batch` callback allows you to perform efficient bulk operations. Broadway provides different batchers, such as `:default` (batches by size or timeout) and `:dynamic` (creates batches based on a partition key).

---

## 4. Other Ecosystem Tools

While Broadway is ideal for pipelines, sometimes you need a simpler client.
-   **`Kaffe` / `Brod`:** These are popular, lower-level Kafka clients for Elixir. They provide more direct control over producing and consuming messages but require you to build your own logic for concurrency, fault tolerance, and back-pressure.