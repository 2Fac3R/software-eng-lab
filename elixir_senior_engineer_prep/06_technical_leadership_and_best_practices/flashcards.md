# Module 6 Flashcards: Technical Leadership (Extended)

**P:** ¿Cuál es el objetivo principal de una revisión de código (Code Review)?
**R:** Es un proceso colaborativo para mejorar la calidad y mantenibilidad del código. Sus metas son compartir conocimiento, detectar errores y mejorar el diseño, no encontrar culpas.

---

**P:** ¿Qué es un **Test de Integración**?
**R:** Es un test que verifica cómo dos o más módulos (o componentes) del sistema trabajan juntos. Por ejemplo, probar que un GenServer interactúa correctamente con un módulo de Ecto.

---

**P:** ¿Qué es el **Testing Basado en Propiedades** (Property-Based Testing)?
**R:** Es una técnica donde se definen "propiedades" generales sobre una función (ej. "ordenar una lista no cambia su longitud") y una herramienta genera cientos de datos aleatorios para intentar encontrar un caso que rompa esa propiedad. Es excelente para encontrar casos borde.

---

**P:** ¿Para qué se utiliza la herramienta `Dialyzer`?
**R:** Es un analizador estático de código para Erlang y Elixir que detecta inconsistencias de tipos, código inalcanzable y otros errores potenciales. Ayuda a encontrar bugs sin necesidad de ejecutar el código.

---

**P:** ¿Cuál es el propósito de un **ADR** (Architectural Decision Record)?
**R:** Es un documento que captura una decisión de arquitectura importante, su contexto y sus consecuencias. Sirve como un registro histórico para entender por qué el sistema está diseñado de cierta manera.
