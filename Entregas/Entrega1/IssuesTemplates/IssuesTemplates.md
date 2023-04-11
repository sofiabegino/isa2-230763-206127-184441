# Templates 

Decidimos crear templates para los siguientes issues: user stories, tasks (con y sin relacioón a user story), reporte de bugs y reporte de calidad de código.
Al crear un "New issue" en github, se deberá seleccionar uno de los templates.
Además, tenemos labels asociados por default a cada uno. 

### User stories

**Label asociada**: user story 
Una user story en BDD es una descripción de una característica o funcionalidad que se va a agregar al software, desde la perspectiva del usuario. Se describe en términos de quién es el usuario, qué desea lograr y por qué. La user story es una forma de comunicar el valor que se espera que la nueva característica agregue al software.

##### Template:
```
Nombre de la tarea: nombre concreto y representativo

Narrativa
Como [tipo de usuario]
Quiero [objetivo]
Para [beneficio]

Descripción
Descripción detallada de la historia de usuario, incluyendo información sobre el comportamiento deseado y cualquier condición o contexto relevante.

Criterios de Aceptación
*Escenario [número]: [descripción]*
Dado [contexto]
Cuando [evento]
Entonces [resultado]

Esfuerzo
Estimado: en horas-persona
```
Definimos el esfuerzo refiere al trabajo intelectual que tiene que hacer alguien para construir algo.
Ej: si un desarrollador trabaja en una tarea durante 4 horas el lunes y 2 horas el martes, el esfuerzo en horas persona total para esa tarea sería de 6 horas persona.


# Tasks

Definimos templates para tasks con y sin relación a una user story.

#### Tasks relacionadas a una user story:
**Label asociada**: task
Una tarea en BDD es una unidad de trabajo más específica. Las tareas se enfocan en las acciones técnicas que se deben realizar para agregar la funcionalidad descrita en la user story. Las tareas también se pueden describir utilizando la sintaxis de Dado-Cuando-Entonces, y su objetivo es especificar los detalles de implementación necesarios para realizar la funcionalidad descrita en la user story.

##### Template:
```
Nombre de tarea: nombre concreto y representativo

User story relacionada: nombre de user story relacionada

Descripción: descripción detallada de la tarea y objetivo

Criterios de Aceptación
*Escenario [número]: [descripción]*
Dado [contexto]
Cuando [evento]
Entonces [resultado]

Esfuerzo
Estimado: en horas-persona 
```

#### Tasks sin user story:
**Label asociada**: task de gestión 
Tasks relacionadas a la gestión del proyecto: crear el tablero de tareas, crear la retrospectiva, documentar el proceso, etc.
##### Template:
```
Nombre de tarea: nombre concreto y representativo

Descripción: descripción detallada de la tarea y objetivo

Esfuerzo estimado: en horas-persona 
```

## Reportes de Bugs
**Label asociada**: bug
Aquí reportamos los bugs identificados al hacer un análisis dinámico de UX/UI.
#### Template:
```
Nombre del bug: nombre concreto y representativo

Descripción: descripción detallada, incluyendo cualquier condición o contexto relevante
Pasos para reproducir: pasos para reproducir                        
Resultado actual: resultado obtenido                        
Resultado esperado: lo que debería pasar                            
Clasificacin: funcionalidad, usabilidad, eficiencia                            
Severidad: (crítica, mayor, menor, leve) nos indica qué tan severo es el bug              
Prioridad: (alta, baja, media) nos indica qué tan prioritario es el arreglo                  
Imagen/es: Imagen/es descriptivas                           
```
**Definimos las clasificaciones de la siguiente manera:**

**Funcionalidad**: errores en las funciones principales del software, por ejemplo en los CRUDs
**Usabilidad**: enfocado en la experiencia del usuario al utilizar el software. Incluye la interfaz gráfica, la navegación, el flujo de trabajo, la accesibilidad y la facilidad de comprensión de las características y funciones del software
**Eficenca**: enfocado en la eficiencia del sistema a ojos del usuario. Por ejemplo: se hace una solicitud al servidor para validar la entrada del usuario en lugar de validarla en el lado del cliente. Si los mensajes de error solo se generan después de hacer una solicitud al servidor, los usuarios pueden tener que esperar más tiempo para recibir comentarios sobre sus entradas incorrectas

## Reportes de Calidad de código
**Label asociada**: calidad de código
Estos refieren a cualquier issue obtenido a partir del análisis de código. Revisamos estándares, existencia de loops anidados, cumplimiento de clean code y principios de diseño, ejecución de linters.

##### Template:
```
Nombre del issue: nombre concreto y representativo

Descripción: descripción detallada, incluyendo cualquier condición o contexto relevante 
Pasos para reproducir: pasos para reproducir (incluir archivo/s en el que se encuentra el issue)
Resultado actual: resultado actual
Resultado esperado: lo que debería pasar para cumplir con una buena calidad de código
Imagen/es: [Imagen/es descriptivas]
```

