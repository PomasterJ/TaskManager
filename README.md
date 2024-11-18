# Task Management API

## Descripción
API de gestión de tareas construida con **Spring Boot**. Permite la creación, actualización, eliminación y gestión de tareas con subtareas anidadas.

## Endpoints principales
- **GET** `/tasks` - Lista todas las tareas.
- **POST** `/tasks` - Crea una nueva tarea.
- **PATCH** `/tasks/{id}/complete` - Marca una tarea y sus subtareas como completadas.
- **DELETE** `/tasks/{id}` - Elimina una tarea y sus subtareas.

  ## Documentación
Accede a la documentación completa en [Swagger UI](http://localhost:8080/swagger-ui/index.html).
