
FUNCIONAMIENTO DE LA APLICACION

-Etiquetas erroneas se ignoran
-Etiqueta para pais se considera de la siguiente manera :  "<empty(pais,argentina)>"

FUNCIONAMIENTO FALTANTE

-Etiqueta para realizar sumatoria : "<sum(monto1, monto2)>: debe reemplazarse por la suma de los placesholders monto1 y monto2"
-No se realizan validaciones para datos incompletos (ejemplo : un contacto no pose nombre en archivo json)
-Excepciones en cada caso particular que lo amerite (relacionado con el item de arriba, si falta el mail de un contacto deberia enviar una expecion de que falta mail)

POSIBLES MEJORAS

-Quitar logica del metodo Post '/' de la clase app.rb --> el while podria introducirse en otra clase/s
