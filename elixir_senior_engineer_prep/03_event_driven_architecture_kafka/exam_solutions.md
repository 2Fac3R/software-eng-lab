# Module 3 Exam Solutions: EDA & Kafka (Extended)

---

**Question 1:** You need to implement a multi-step business process that spans three different microservices. If any step fails, the previous steps must be undone. Which design pattern is most appropriate for this scenario?

**Answer:** B
**Explanation:** The Saga Pattern is specifically designed to manage data consistency across distributed services without using traditional, locking transactions. It handles failures by executing compensating transactions to revert previous steps.

---

**Question 2:** For a financial system where processing a payment event more than once would be catastrophic, which Kafka delivery semantic is the most appropriate, even if it's more complex to implement?

**Answer:** C
**Explanation:** Exactly-once semantics guarantee that each message is processed once and only once. This is critical for financial systems or any application where duplicate operations would corrupt data or lead to incorrect results.

---

**Question 3:** What is the primary advantage of using a data format like Avro with a Schema Registry in a Kafka-based architecture?

**Answer:** B
**Explanation:** The combination of Avro and a Schema Registry provides strong data governance. It enforces that all messages conform to a defined schema and manages the evolution of that schema over time, preventing data quality issues and breaking changes between producers and consumers.

---

**Question 4:** In a Broadway pipeline, what is the purpose of the `handle_batch/4` callback?

**Answer:** B
**Explanation:** Broadway can be configured to group messages into batches. The `handle_batch/4` callback is invoked to process an entire batch at once, which is highly efficient for operations like bulk inserts into a database, reducing the number of round-trips.

---

**Question 5:** What is the main function of "back-pressure" in a data processing pipeline like Broadway?

**Answer:** B
**Explanation:** Back-pressure is a crucial feature for stability. It is a feedback mechanism where the consumer system signals to the producer to slow down or stop sending messages when it is becoming overwhelmed. This prevents the consumer from running out of memory and crashing.
