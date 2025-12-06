# Module 3 Exam: EDA & Kafka (Extended)

**Instructions:** Choose the best answer for each question.

---

**Question 1:** You need to implement a multi-step business process that spans three different microservices. If any step fails, the previous steps must be undone. Which design pattern is most appropriate for this scenario?

A) Singleton Pattern
B) Saga Pattern
C) Decorator Pattern
D) Request-Response Pattern

---

**Question 2:** For a financial system where processing a payment event more than once would be catastrophic, which Kafka delivery semantic is the most appropriate, even if it's more complex to implement?

A) At-most-once
B) At-least-once
C) Exactly-once
D) Best-effort

---

**Question 3:** What is the primary advantage of using a data format like Avro with a Schema Registry in a Kafka-based architecture?

A) It makes the event data human-readable, like JSON.
B) It enforces data structure and allows schemas to evolve over time without breaking consumers.
C) It guarantees that messages will be delivered in a shorter amount of time.
D) It is the only format that Broadway can process.

---

**Question 4:** In a Broadway pipeline, what is the purpose of the `handle_batch/4` callback?

A) To process a single message with high priority.
B) To group messages together for efficient bulk operations, like inserting many records into a database at once.
C) To configure the number of concurrent processors.
D) To handle messages that have failed processing multiple times.

---

**Question 5:** What is the main function of "back-pressure" in a data processing pipeline like Broadway?

A) To increase the number of messages being processed.
B) To automatically stop fetching new messages from the source (e.g., Kafka) when the consumer processes are overwhelmed, preventing system crashes.
C) To send pressure-related metrics to a monitoring system.
D) To apply data compression to messages.
