# Module 2 Flashcards: Advanced Software Architecture (Extended)

**P:** ¿Cuál es la Regla de Dependencia en la Arquitectura Limpia?
**R:** Las dependencias en el código fuente solo pueden apuntar hacia adentro. Las capas internas (Entidades, Casos de Uso) no deben saber nada sobre las capas externas (Frameworks, UI, Base de Datos).

---

**P:** En DDD, ¿qué es un "Bounded Context" (Contexto Delimitado)?
**R:** Es una frontera explícita (como un paquete de Python o un microservicio) dentro de la cual un modelo de dominio y su lenguaje son consistentes y no tienen ambigüedades.

---

**P:** ¿Cuál es la diferencia entre una Entidad (Entity) y un Objeto de Valor (Value Object) en DDD?
**R:** Una Entidad tiene una identidad única y es mutable (un `Usuario`). Un Objeto de Valor se define por sus atributos, no tiene identidad y es inmutable (una cantidad de `Dinero`). En Python, se implementan idealmente con `@dataclass(frozen=True)`.

---

**P:** ¿Cuál es la función de un Raíz de Agregado (Aggregate Root)?
**R:** Es el único punto de entrada para realizar modificaciones en un grupo de objetos (el agregado). Protege las reglas de negocio (invariantes) que aplican al agregado como un todo.

---

**P:** En una Arquitectura Limpia en Python, ¿cómo se define la interfaz de un Repositorio?
**R:** Se define como una abstracción en la capa de aplicación, idealmente usando `typing.Protocol` o `abc.ABC` (Abstract Base Class), para que la lógica de negocio no dependa de una implementación de base de datos concreta.
