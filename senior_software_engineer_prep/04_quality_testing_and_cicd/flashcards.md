# Module 4 Flashcards: Quality, Testing, and CI/CD

**P:** ¿Cuáles son los tres pasos del ciclo de TDD (Test-Driven Development)?
**R:** **Rojo** (escribir un test que falla), **Verde** (escribir el código mínimo para que el test pase) y **Refactor** (limpiar el código sin cambiar su comportamiento).

---

**P:** ¿Qué es una "fixture" en `pytest`?
**R:** Es una función que proporciona un estado o datos base reutilizables para los tests. Es la forma preferida de manejar la configuración (setup) y limpieza (teardown) de los tests, como crear una conexión a una base de datos.

---

**P:** ¿Para qué sirve el decorador `@pytest.mark.parametrize`?
**R:** Permite ejecutar una misma función de test con múltiples conjuntos de argumentos de entrada y salida esperada. Esto reduce la duplicación de código y facilita la prueba de múltiples casos (especialmente casos borde).

---

**P:** ¿Cuál es el objetivo principal de la Integración Continua (CI)?
**R:** Detectar problemas de integración de forma temprana. Se logra mediante la fusión frecuente de cambios de código en un repositorio central, lo que desencadena una pipeline automatizada de construcción y pruebas.

---

**P:** ¿Qué es "mocking" en el contexto de las pruebas de software?
**R:** Es la técnica de reemplazar dependencias de una pieza de código (como una API externa, una base de datos o una función compleja) con objetos falsos y controlados. Esto permite probar el código de forma aislada.
