# Module 2 Flashcards: Distributed Systems with OTP (Extended)

**P:** ¿Cuál es la diferencia entre `Process.link` y `Process.monitor`?
**R:** `link` crea un enlace bidireccional de "pacto de muerte": si un proceso muere, el otro también. `monitor` es unidireccional: el proceso monitor recibe un mensaje `{:DOWN}` si el proceso monitoreado muere, pero no se ve afectado.

---

**P:** ¿Qué es un `GenServer`?
**R:** Es un comportamiento (behaviour) de OTP que implementa una lógica de cliente-servidor dentro de un único proceso de Elixir. Es la abstracción más común para manejar estado de forma concurrente.

---

**P:** ¿Cuál es la diferencia entre `GenServer.call` y `GenServer.cast`?
**R:** `call` es **síncrono** y espera una respuesta, usado para leer estado. `cast` es **asíncrono** y no espera respuesta, usado para enviar comandos o actualizar estado.

---

**P:** ¿Cuándo usarías un `DynamicSupervisor` en lugar de un `Supervisor` normal?
**R:** Cuando los procesos hijos no se conocen al inicio de la aplicación y necesitan ser creados y destruidos dinámicamente en tiempo de ejecución, como por ejemplo, un proceso por cada conexión de usuario.

---

**P:** ¿Qué es ETS (Erlang Term Storage) y cuándo lo usarías en lugar de un GenServer?
**R:** ETS es una tabla en memoria de alto rendimiento para almacenar tuplas. Se usa en lugar de un GenServer cuando se necesita acceso **concurrente** de lectura/escritura a un gran conjunto de datos, para evitar el cuello de botella de un único proceso GenServer.

---

**P:** ¿Qué significa la opción `restart: :transient` en la especificación de un hijo de un supervisor?
**R:** Significa que el supervisor solo reiniciará a ese hijo si termina de forma anormal (es decir, con una razón de salida diferente a `:normal`). No lo reiniciará si el proceso termina de forma normal.
