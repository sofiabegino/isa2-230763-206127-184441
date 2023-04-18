# Modificaciónes al Proceso de ingeniería



# Modificaciónes del tablero

Para esta instancia se agregaron nuevas columnas para con la estratégia BDD, estas son las siguientes:

* Requirements Definition - En esta intancia se utilizara para refinar los requerimientos de los bugs a solucionar y pasarlos a User Story
* Test Cases Implementation - En esta intancia se utilizara para implementar los test que luego serviran para implementar la solucion
* Application Implementation - En esta instancia se desarrolla el codigo para solucionar el bug
* Refactor - Luego de ejecutar los tests y probar la solucion de los bugs se decidirá si es necesario realizar algun ajuste, en dicho caso la issue se moverá hasta esta columna.

Por otro lado, además agregamos una nueva columna "TO DO" que se ocupara para ubicar las issues que se van a estar trabajando del BACKLOG, ya que para esta entrega solo se van a trabajar 2 bugs y nuestro BACKLOG cuenta con muchos más.

Finalmente, la columna de "IN PROGRESS" se utilizará para ubicar las issues de documentación que se están trabajando y que luego pasarán a estar en "DONE", ya que no pasan por todas las instancias del proceso como si lo podrían hacer los bugs.

# Guía del tablero

Existen dos flujos de las issues por el tablero:

## Issues relacionadas a la documentación

Nacen en la columna BACKLOG, luego en la entrega que corresponde se mueven a la columna de TO DO, desde allí se van tomando para trabajarce y se van moviendo a IN PROGRESS, finalmente cuando se termina de trabajar en estas se mueven a la columna DONE, terminando el recorrido por el tablero.

## Issues de bugs

Nacen en la columna BACKLOG, luego en la entrega que corresponde se mueven a la columna de TO DO, desde allí se van tomando para trabajarce y se puede mover a "Requirements Definition", cuando se termina de procesar, se pasan a la columna "Test Cases Implementation", luego pasan por la columna de "Application Implementation", pasando luego por "testing" y "Refactoring" de ser necesario, terminando el recorrido por el tablero en la columna DONE.

Tener en cuenta de que no todas las issues son bugs, es por esto que pueden existir ligeras variantes.

![Tablero 3](progreso-tablero3.png)