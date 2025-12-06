# Module 4 Flashcards: Advanced Software Design (Extended)

**P:** ¿Cómo se aplica el Principio de Inversión de Dependencias (DIP) en Elixir?
**R:** Pasando módulos como argumentos a las funciones o usando configuración. La función depende de una abstracción (un `behaviour`), no de una implementación concreta, lo que facilita las pruebas.

---

**P:** ¿Qué característica de Elixir se usa para cumplir con el Principio Abierto/Cerrado (OCP)?
**R:** Los **Behaviours**. Definen un contrato que puede ser extendido con nuevos módulos de implementación sin modificar el código existente que usa el contrato.

---

**P:** ¿Qué es "Railway Oriented Programming" (ROP)?
**R:** Es un patrón para manejar pipelines de funciones que pueden fallar, usando tuplas `{:ok, ...}` y `{:error, ...}`. En Elixir, se implementa de forma idiomática con la macro `with`.

---

**P:** ¿Qué es **CQRS** (Command Query Responsibility Segregation)?
**R:** Es un patrón que separa los modelos para escribir datos (Comandos) de los modelos para leer datos (Queries). Esto permite optimizar cada lado de forma independiente.

---

**P:** ¿Qué es un **ADR** (Architectural Decision Record)?
**R:** Es un documento corto que captura una decisión de arquitectura importante, su contexto y sus consecuencias. Sirve como un registro histórico para entender por qué el sistema está diseñado de cierta manera.
