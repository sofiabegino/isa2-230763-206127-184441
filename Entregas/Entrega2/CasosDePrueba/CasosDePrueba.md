# Registro de casos de prueba

## Cambio de contraseña no valida la seguridad

Este bug se soluciono haciendo TDD. Los siguientes son los test que se crearon para probar la funcionalidad.

![Test de cambio de contraseña](testsbug1.png)
![Test de cambio de contraseña](tests2bug1.png)

## Usuario con rol "Artista" no puede desloguearse

El bug resultó ser un ajuste rápido que involucro agregar el rol del usuario Artista en el AuthoritationFilter del verbo POST para el logout que se encontraba en el archivo Security Controller.
El testing de este bug se realizó de forma manual, probando loguear y desloguear nuevamente con un usuario de rol Artista, identificando a su vez lo que sucedía con el token de la sesión del usuario al cerrar la misma.
En la review se puede ver la prueba manual que se hizo para verificar que el bug se solucionó.
