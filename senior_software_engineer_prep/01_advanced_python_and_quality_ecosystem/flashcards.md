# Module 1 Flashcards: Advanced Python & Quality Ecosystem (Extended)

**P:** ¿Para qué se utiliza `Pydantic`?
**R:** Para la validación, serialización y deserialización de datos usando type hints de Python. Es ideal para validar datos de APIs, archivos de configuración, etc.

---

**P:** ¿Cuál es la diferencia entre un linter como `ruff` y un type checker como `mypy`?
**R:** Un linter (`ruff`) se enfoca en el estilo del código y errores comunes. Un type checker (`mypy`) se enfoca exclusivamente en verificar que los tipos de datos se usen correctamente.

---

**P:** ¿Para qué sirve el decorador `@dataclass`?
**R:** Para crear clases que principalmente almacenan datos, generando automáticamente métodos como `__init__`, `__repr__` y `__eq__`, lo que reduce código repetitivo.

---

**P:** ¿Qué es un decorador en Python?
**R:** Es una función que recibe otra función como argumento, le añade alguna funcionalidad y devuelve otra función. Se usa para extender el comportamiento de una función de forma limpia.

---

**P:** ¿Cuándo usarías `threading` vs. `multiprocessing`?
**R:** Usa `threading` para tareas limitadas por I/O (esperas de red, disco), ya que puede cambiar de hilo mientras uno espera. Usa `multiprocessing` para tareas limitadas por CPU (cálculos intensos), ya que evita el GIL y permite paralelismo real en múltiples núcleos.

---

**P:** ¿Para qué tipo de tareas es ideal `asyncio`?
**R:** Para tareas con un alto volumen de operaciones de I/O concurrentes, como en servidores de red. Usa un solo hilo y un bucle de eventos para manejar miles de conexiones de forma muy eficiente.
