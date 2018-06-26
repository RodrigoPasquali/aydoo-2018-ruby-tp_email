
FUNCIONAMIENTO DE LA APLICACION

-Etiquetas erroneas y/o etiquetas no incluidas se ignoran.
Ejemplo : template --> "El de 10 de Brasil es <nombre_de_jugador_de_futbol>"
-Etiqueta para pais se considera de la siguiente manera :  "<empty(pais,argentina)>".


FUNCIONAMIENTO FALTANTE

-Excepciones en cada caso particular que lo amerite (relacionado con el item de arriba, si falta el mail de un contacto deberia enviar una expecion de que falta mail).
Ejemplo : Ante el faltante de algun dato del eveto o del contacto, no se arroja una excepcion especifica, sino que se arroja un error 505 ("error, entrada incorrecta").


POSIBLES MEJORAS

-Quitar logica del metodo Post '/' de la clase app.rb --> el while podria introducirse en otra clase/s.
Ejemplo : El armado del cuerpo del mail podria realizarse en otra clase, la que se encargaria de reemplazar todas las etiquetas.
-Realizar un refactor en la clase parseador, y aplicar un patron como Chains Of Responsability, donde se crean clases individuales para la obtencion de cada dato en particular.
Ejemplo : clase parseador_evento devolveria los datos del evento (esto actualmente se realiza desde la clase pareseador con el metodo get_datos_evento).