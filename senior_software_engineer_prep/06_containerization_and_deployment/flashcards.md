# Module 6 Flashcards: Containerization and Deployment

**P:** ¿Cuál es la diferencia fundamental entre una imagen Docker y un contenedor Docker?
**R:** Una **imagen** es una plantilla inmutable, un blueprint (como una clase en OOP). Un **contenedor** es una instancia en ejecución de una imagen (como un objeto de una clase).

---

**P:** ¿Cuál es el propósito de un `Dockerfile`?
**R:** Es un archivo de texto con instrucciones que define paso a paso cómo construir una imagen de Docker.

---

**P:** ¿Por qué es una buena práctica usar "multi-stage builds" (construcciones multi-etapa) en un Dockerfile?
**R:** Para crear imágenes de producción más pequeñas y seguras. Se usa una etapa con todas las herramientas de compilación para construir la aplicación, y una segunda etapa mínima donde solo se copia el artefacto final, descartando todas las dependencias y herramientas de compilación.

---

**P:** ¿Qué problema resuelve `docker-compose`?
**R:** Simplifica la definición y ejecución de aplicaciones multi-contenedor en un entorno de desarrollo local. Permite orquestar servicios (como una app web y una base de datos) con un solo comando (`docker-compose up`).

---

**P:** ¿Cuál es la unidad de despliegue más pequeña en Kubernetes?
**R:** Un **Pod**. Es un grupo de uno o más contenedores que comparten almacenamiento y red, y que se despliegan y gestionan como una sola unidad.
