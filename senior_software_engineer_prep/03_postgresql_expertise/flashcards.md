# Module 3 Flashcards: PostgreSQL Expertise

**P:** ¿Para qué se utiliza principalmente el particionamiento de tablas en PostgreSQL?
**R:** Para mejorar el rendimiento de las consultas en tablas muy grandes. Permite al planificador de consultas ignorar las particiones que no contienen los datos solicitados (un proceso llamado "partition pruning").

---

**P:** ¿Cuál es la diferencia práctica entre los tipos de datos `json` y `jsonb`?
**R:** `json` almacena el texto exacto del JSON, mientras que `jsonb` lo almacena en un formato binario descomprimido. `jsonb` es casi siempre la mejor opción porque es más eficiente para consultar y soporta indexación avanzada.

---

**P:** ¿Cuándo deberías usar un índice `GIN` en lugar de un `B-Tree`?
**R:** Debes usar un índice `GIN` cuando necesitas indexar tipos de datos compuestos, donde múltiples valores pueden existir en una sola fila. El caso de uso más común es para acelerar las consultas en columnas `jsonb` (usando el operador `@>`).

---

**P:** ¿Qué problema de seguridad resuelve la Row-Level Security (RLS)?
**R:** Resuelve el problema de la autorización de datos en aplicaciones multi-tenant (multi-inquilino). Asegura que un usuario solo pueda ver o modificar las filas que le pertenecen, aplicando políticas de seguridad directamente en la base de datos.

---

**P:** ¿Cuál es una ventaja y una desventaja de usar procedimientos almacenados (`PL/PgSQL`)?
**R:** **Ventaja:** Pueden mejorar el rendimiento al reducir los viajes de ida y vuelta a la red para lógica compleja. **Desventaja:** Son más difíciles de versionar, probar y depurar que el código de la aplicación, y crean una dependencia del proveedor de la base de datos.
