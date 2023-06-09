# Armado del repositorio

Se creó el repositorio de GitHub y se agregaron los tres integrantes del equipo.

El repositorio cuenta con una estructura de carpetas donde la carpeta "Entregas" incluirá las entregas (informes de avance) del proyecto. Para esta primera entrega solo contendrá la carpeta “Entrega1”, dentro de la cual tendremos una carpeta por ticket/branch, esta carpeta contendrá un archivo .md con la resolución del ticket. Mientras que la carpeta "Obligatorio" contendrá la aplicación de la asignatura "Diseño de aplicaciones 2" que nos fue proporcionada por los docentes.

Ej:

- Entrega
    - Entrega1
        - VersionadoRepositorio
            - VersionadoRepositorio.md
        - RolesDelEquipo
            - RolesDelEquipo.md
        - ProcesoDeGestion
            - ProcesodeGestion.md
            - tablero.png
        - etc
- Obligatorio
    - carpetas de la aplicación.
	
# Manejo del repositorio

## Estrategias de branching
Utilizaremos GitFlow como estrategia de branching, tendremos:

* Main - Rama principal. Esta será la rama donde se mergeara cada entrega finalizada.
* Dev - Rama de desarrollo. Esta será la rama donde se mergeara los cambios realizados para cada entrega.

Además utilizaremos ramas que parten de la rama Dev, para incorporar cada documento, arreglo o feature implementados durante la entrega, de esta forma el equipo puede trabajar de forma independiente sin pisar el trabajo realizado por otros integrantes. Cada issue tendrá una rama propia y se vinculará a un Pull Request.

### Para las ramas seguiremos el siguiente estandar:

feature/nro-ticket/nombre-ticket
bug/nro-ticket/nombre-ticket
document/nro-ticket/nombre-ticket
fix/nro-ticket/nombre-ticket

La idea de las ramas anteriores, es detectar facilmente que ticket/issue se esta trabajando en cada rama y que actividad predomina en estas.

### Para los commits utilizaremos el siguiente estandar de "Conventional Commits":

fix: descripción-corta
feat: descripción-corta
BREAKING CHANGE: descripción-corta

Donde fix se utilizara en caso de commits que hacen algun cambio sobre la rama y feat para todo lo que se implementa en la misma.

Documentación sobre el estandar se puede encontrar en el siguiente link:

https://www.conventionalcommits.org/en/v1.0.0/#:~:text=Commits%20MUST%20be%20prefixed%20with,to%20your%20application%20or%20library.

