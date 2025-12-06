# Module 5 Flashcards: Relational Databases & Ecto (Extended)

**P:** ¿Cuál es el propósito principal de un `Ecto.Changeset`?
**R:** Filtrar, convertir (cast), validar y rastrear cambios en los datos *antes* de que se escriban en la base de datos. Es el pilar de la integridad de datos en Ecto.

---

**P:** ¿Cuál es la diferencia entre `preload` y `join` en una consulta de Ecto?
**R:** `join` se usa para filtrar o seleccionar datos basados en una asociación en una única consulta SQL. `preload` se usa para cargar eficientemente los datos de una asociación en una (o más) consultas SQL separadas para evitar el problema N+1.

---

**P:** ¿Para qué se utiliza `Ecto.Multi`?
**R:** Se utiliza para componer múltiples operaciones de base de datos en una única **transacción**, garantizando que todas las operaciones tengan éxito o todas fallen (atomicidad).

---

**P:** ¿Qué es una "Consulta Dinámica" (Dynamic Query) en Ecto?
**R:** Es una consulta que se construye de forma condicional, pieza por pieza. Es un patrón muy poderoso en Ecto que permite añadir filtros o `joins` opcionales a una consulta base de forma limpia y componible.

---

**P:** En un esquema de Ecto, ¿qué significa una asociación `many_to_many`?
**R:** Define una relación donde un registro de un tipo puede estar relacionado con muchos registros de otro tipo, y viceversa. Requiere una tabla intermedia en la base de datos, que se especifica con la opción `join_through`.
