# Configuracion Pipeline

Creamos un pipeline de build y test, que contiene un conjunto de pasos automatizados que se ejecutan de manera secuencial al hacer un pull request.

El pipeline de "build" realiza las siguientes tareas:
- Clonar el repositorio
- Configurar .NET Core
- Instalar las dependencias .NET necesarias
- Compilar el proyecto .NET
- Configurar Node.js
- Configurar el caché de npm
- Compilar el proyecto Angular

El pipeline de "test" realiza las siguientes tareas:
-Clonar el repositorio
-Configurar .NET Core
-Instalar las dependencias .NET necesarias
-Compilar el proyecto .NET
-Ejecutar pruebas de API, pruebas de lógica de negocios y pruebas de acceso a datos

Si se detectan errores en alguna de las pruebas, el pipeline se interrumpe y se nos notifica.

El pipeline de build y test se puede integrar con un tablero kanban para visualizar el estado actual del proceso y para que el equipo pueda realizar un seguimiento del progreso y detectar cuellos de botella en el flujo de trabajo. Por ejemplo, las fases del pipeline podrían estar asociadas a las diferentes columnas del tablero: a medida que se van pasando por las distintas fases del pipeline, las tareas se mueven a través de las diferentes etapas del tablero kanban.
