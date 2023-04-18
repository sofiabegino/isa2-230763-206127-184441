# Informe y Justificación de Bugs

Dentro de los bugs encontrados, identificamos los siguientes como los de mayor importancia:

## Bugs cons severidad crítica y prioridad alta:
* Botón Registrarse no funciona#43

## Bugs cons severidad mayor y prioridad alta:
* Cambio de contraseña no valida la seguridad y quedan campos sucios. #46
* Usuario con rol "Artista" no puede desloguearse. #48

Luego notamos que existía un error al identificar el bug #43, en este consideramos que el botón para registrarse no estaba funcionando, pero en realidad, revisando la letra del obligatorio para trabajarlo, nos dimos cuenta que los usuarios no deben tener la posibilidad de registrarse, sino que deben ser registrados por un usuario con rol administrador. Por este motivo, el bug termino por ser desestimado, luego como es la única que se consideró con severidad crítica y el PO la desestima cambiando su prioridad a baja, entonces pasamos a seleccionar los bugs con severidad mayor y prioridad alta. Por lo tanto, seleccionamos las issues #48 y #46.

# bugs trabajados

## Usuario con rol "Artista" no puede desloguearse. #48

Se selecciono este bug por ser un error que invalida seguir utilizando la UI con otros usuarios, ya que cuando el usuario con rol artista intenta desloguearse, ocurre un error de permisos, en el cual se indica que el usuario no tiene permiso para salir de la sesión, lo cual debe ser un permiso otorgado a cualquier rol, entonces el usuario con rol artista es incapaz de cerrar su sesión y no es posible loguearce con otros usuarios de diferentes roles. Por lo que para arreglar este ajuste se formularon los siguientes criterios de aceptación:

* Escenario 1: Deslogueo exitoso
Dado que el usuario con rol "Artista" desea desloguearse
Cuando el usuario hace clic en la opción "Desloguearse"
Entonces el sistema debe cerrar la sesión del usuario y redirigirlo a la página de inicio de sesión

* Escenario 2: Protección de la información del usuario
Dado que el usuario con rol "Artista" se ha deslogueado de su cuenta
Cuando otro usuario intenta acceder a la información del usuario deslogueado
Entonces el sistema debe asegurar que la información del usuario se borre de manera segura y que ningún otro usuario pueda acceder a ella

## Cambio de contraseña no valida la seguridad y quedan campos sucios. #46

Se selecciono este bug para trabaja debido a que se consideró la seguridad antes que la interacción con el usuario (que es a lo que apuntan muchos de los demás bugs encontrados). El PO junto al resto del equipo estuvo de acuerdo en que las contraseñas podían ser muy inseguras ya que no se solicitaba ningún requisitos de seguridad durante su actualización, además quedaban campos con información luego de actualizar la contraseña. Por lo que para arreglar este ajuste se formularon los siguientes criterios de aceptación:

* Escenario 1: Cambio de contraseña exitoso
Dado que el usuario desea cambiar su contraseña
Cuando el usuario ingresa una nueva contraseña que cumple con los requisitos de seguridad
Entonces el sistema debe permitir el cambio de contraseña y mostrar un mensaje de confirmación

* Escenario 2: Cambio de contraseña fallido por no cumplir con requisitos de seguridad
Dado que el usuario desea cambiar su contraseña
Cuando el usuario ingresa una nueva contraseña que no cumple con los requisitos de seguridad
Entonces el sistema debe mostrar un mensaje de error y solicitar al usuario que ingrese una nueva contraseña que cumpla con los requisitos de seguridad

# User Story

Para trabajar con los bugs, estos fueron refinados en historias de usuario: 

* Usuario con rol "Artista" no puede desloguearse#69
* Cambio de contraseña no valida la seguridad#68