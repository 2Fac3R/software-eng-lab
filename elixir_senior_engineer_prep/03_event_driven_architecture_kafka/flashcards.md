# Module 3 Flashcards: EDA & Kafka (Extended)

**P:** ¿Cuál es el beneficio principal de una Arquitectura Orientada a Eventos (EDA)?
**R:** El **bajo acoplamiento** (loose coupling). Los servicios no necesitan conocerse entre sí, lo que permite que los sistemas sean más flexibles, escalables y resilientes.

---

**P:** ¿Cómo logra Kafka el paralelismo en el consumo de eventos?
**R:** A través de las **Particiones**. Un topic se divide en particiones, y cada partición puede ser procesada por un consumidor diferente dentro de un mismo grupo de consumidores.

---

**P:** ¿Qué es el **Patrón Saga** y qué problema resuelve?
**R:** Es un patrón para gestionar la consistencia de datos a través de múltiples microservicios sin usar transacciones distribuidas. Lo hace dividiendo una transacción global en una secuencia de transacciones locales con sus correspondientes acciones de compensación en caso de fallo.

---

**P:** ¿Qué significa la semántica de entrega "at-least-once" (al menos una vez) en Kafka?
**R:** Garantiza que un mensaje nunca se perderá, pero podría ser entregado más de una vez. Esto requiere que los consumidores sean **idempotentes** (que procesar el mismo mensaje varias veces no tenga efectos secundarios no deseados).

---

**P:** ¿Por qué se usa **Avro** con un **Schema Registry** junto a Kafka?
**R:** Para garantizar la calidad y evolución de los datos. Avro es un formato binario con esquema, y el Schema Registry centraliza y versiona estos esquemas, asegurando que los productores y consumidores siempre estén de acuerdo sobre la estructura de los datos, incluso cuando esta cambia.
