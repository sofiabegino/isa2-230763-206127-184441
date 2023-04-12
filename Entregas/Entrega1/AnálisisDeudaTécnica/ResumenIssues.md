
## Descripción de la actividad 

Para realizar el análisis de la deuda técnica nuestro equipo dividió el trabajo en varias instancias, primero se realizaron todas las configuraciones necesarias para poder ejecutar la aplicación proporcionada "ArenaGestor", luego se realizo un análisis de bugs explorando la UI con los diferentes roles y un análisis del código para detectar problemas en relación a Clean Code. Luego estos errores fueron transformados en issues en nuestro tablero del proyecto.

Debido a que se encontró un gran volumen de bugs que escapan el alcance del proyecto, se consideró por el equipo que los bugs/issues más interesantes eran los listados a continuación:

## Análisis de Bugs en UI

* Tester/s: Sofia Begino y Romina Giaccio
* Fecha: 8/4/23
* Hora: 18:30hs

### Home
* Botón Registrarse no funciona.
* Botón "Compra tickets" sin haber iniciado sesión.

### Ingresando como usuario con todos los roles:
* No se refresca el nombre de usuario al cambiar el nombre.
* Cambio de contraseña no valida la seguridad y quedan campos sucios.

### Ingresando como usuario con rol Administrador
* Filtrado de nombre de concierto en usuario Administrador.
* Puede eliminarse a si mismo.
* Inconsistencia en permisos de administrador.

### Ingresando como usuario con rol Artista
* No puede desloguearce.
* No puede cambiar su nombre/apellido.
* No pueda actualizar su contraseña.
* No debería aparecer el botón de "Comprar Ticket".

### Ingresando como usuario con rol Espectador
* No puede editar sus datos nombre/apellido

### Ingresando como usuario con rol Acomodador
* Tiene acceso a editar sus datos y cambiar su contraseña

### Ingresando como usuario con rol Vendedor
* No debería aparecer el botón de "Comprar Ticket".

## Análisis Calidad de Código

* Tester/s: Joaquin Sommer y Romina Giaccio
* Fecha: 9/04/23 y 10/04/23
* Hora: 20:30hs

### Backend
* Controllers implementan Interfaces
* Metodos en interfaces con visibilidad publica
* Doble validacion de usuario y rol
* AuthorizationFilter no cumple SRP
* No se sigue REST en Endpoints

### Frontend
* Existen multiples comentarios innecesarios
* Existen archivos vacíos

El analisis más profundo de las issues se encuentra en el tablero del proyecto, allí se siguio el formato de las issues establecido en los templates de la carpeta "IssiesTemplates". Donde se puede ver la descripción, la solucion (lo que se espera) y la deuda (lo que ocurre actualmente) en cada caso.