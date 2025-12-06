# Module 5 Flashcards: Web Frameworks

**P:** En una Arquitectura Limpia, ¿cuál es el rol principal de una vista de Django o una operación de ruta de FastAPI?
**R:** Actuar como un controlador/adaptador. Su única responsabilidad es recibir la petición HTTP, extraer los datos necesarios, llamar al Caso de Uso apropiado con datos simples, y presentar el resultado del caso de uso como una respuesta HTTP.

---

**P:** ¿Cómo ayuda el sistema de Inyección de Dependencias de FastAPI a implementar la Arquitectura Limpia?
**R:** Permite que la capa web (el endpoint) "dependa" de una abstracción (como una clase de Caso de Uso) sin saber cómo se construye. FastAPI se encarga de crear e "inyectar" la implementación concreta, lo que facilita el desacoplamiento entre la capa web y la lógica de negocio.

---

**P:** ¿Qué es el anti-patrón "Fat Model" o "Fat View" en Django?
**R:** Es la práctica de poner lógica de negocio compleja directamente en los métodos de los modelos de Django (`models.py`) o en las vistas (`views.py`). Esto acopla fuertemente la lógica de negocio al framework y a la base de datos, dificultando las pruebas y el mantenimiento.

---

**P:** ¿Dónde debería vivir la lógica de negocio principal (los Casos de Uso) en un proyecto con Arquitectura Limpia?
**R:** Debería vivir en una capa central y aislada de la aplicación (ej. un directorio `core/`) que no tiene ninguna dependencia de los frameworks externos como Django o FastAPI.

---

**P:** ¿Cuál es la responsabilidad de la capa de Repositorio en una Arquitectura Limpia?
**R:** Abstraer la persistencia de datos. La capa de Casos de Uso depende de una interfaz de Repositorio, mientras que la implementación concreta (ej. usando el ORM de Django) se encuentra en la capa externa de infraestructura, cumpliendo con la Regla de Dependencia.
