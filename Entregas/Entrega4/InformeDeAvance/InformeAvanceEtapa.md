# Informe de avance de la etapa

## Conclusión de la entrega

En esta entrega cumplimos con los objetivos planteados. Logramos hacer los tests funcionales utilizando Selenium IDE para las funcionalidades de la entrega 3 y los bugs corregidos de la entrega 2. 
A parte tambien se corrigio o mejoro los puntos que nos marcaron en el feddback de la entrega 1. 

## Problemas encontrados y solución

Tuvimos varios problemas a la hora de hacer los tests con Selenium IDE. Por ejemplo al principio no podiamos ingresar numeros en los inputs numericos utilizando `type`. Se soluciono utilizando el comando `send keys` pero demoramos porque no hay mucha documentacion que nos diera la respuesta. Tambien quisimos utilizar un `if` para deslogear al usuario si es que estaba logeado, pero no pudimos hacerlo funcionar porque el `if` de Selenium IDE no funciona correctamente con {StatusOK} por lo tanto desistimos de hacerlo. La solucion fue simplemente fijarse que el usuario no este logeado antes de hacer el test.

## Aprendizajes y mejoras

Aprendimos bastante sobre Selenium IDE y como hacer tests funcionales. Sin embargo, creemos que se pudo haber mejorado mucho los tests si se utilizaban scripts en vez de grabar los tests. Utilizando scripts nos daba mucho mas flexibilidad para hacer los tests y nos permitia hacer cosas que no se pueden hacer con Selenium IDE. Por ejemplo, deslogear al usuario si es que estaba logeado.

Por otro lado, tampoco tuvimos tiempo de ver si se podia agregar estos tests al pipeline de github actions. Creemos que se podria haber hecho pero no tuvimos tiempo de investigar como hacerlo.



