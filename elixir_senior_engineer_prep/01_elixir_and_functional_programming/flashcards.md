# Module 1 Flashcards: Elixir and Functional Programming (Extended)

**P:** ¿Cuál es el principal beneficio de la **inmutabilidad** en Elixir?
**R:** Elimina toda una clase de errores de concurrencia (race conditions), ya que garantiza que ningún dato compartido puede ser modificado por múltiples procesos al mismo tiempo.

---

**P:** ¿Cuál es la diferencia clave entre `Enum` y `Stream`?
**R:** `Enum` es "eager" (ansioso), procesa toda la colección de una vez. `Stream` es "lazy" (perezoso), crea una "receta" de computaciones que solo se ejecuta cuando es necesario, siendo mucho más eficiente para colecciones grandes.

---

**P:** ¿Qué es un **Protocolo** en Elixir?
**R:** Es un mecanismo para lograr polimorfismo (comportamiento diferente para diferentes tipos de datos). Define una interfaz que puede ser implementada para cualquier tipo de dato, permitiendo que el código sea extensible.

---

**P:** ¿Para qué es útil una `for` **comprehension**?
**R:** Es una forma concisa de iterar sobre una colección, filtrarla y transformar sus elementos, todo en una sola construcción. A menudo es más legible que encadenar múltiples funciones de `Enum`.

---

**P:** ¿Cuál es la diferencia entre un **binary** (string) y un **char-list**?
**R:** Un binary (`"hello"`) es una secuencia de bytes codificada en UTF-8, eficiente para I/O. Un char-list (`'hello'`) es una lista de code points de caracteres, más compatible con librerías de Erlang antiguas.

---

**P:** ¿Qué es un **sigil** en Elixir?
**R:** Es un atajo sintáctico que empieza con `~` seguido de una letra para crear literales. Por ejemplo, `~r/foo/` para Regex, `~w/foo bar/` para una lista de palabras, o `~D[2024-01-01]` para una fecha.

---

**P:** ¿Cuál es la diferencia entre `alias` e `import`?
**R:** `alias` crea un nombre más corto para un módulo (`alias MyApp.MyModule` -> `MyModule`). `import` trae las funciones de un módulo al scope actual, permitiendo llamarlas sin el prefijo del módulo (ej. `map` en lugar de `Enum.map`).
