
FUNCIONAMIENTO DE LA APLICACION

-La app envia mails a un solo contacto. Lo hace a traves de un POST(curl -X POST -H "Content-Type: application/json" --data @data1.json localhost:4567/) y a traves de un GET(/enviar_mail).
En el mail se logra reemplazar las etiquetas tanto del cuerpo como las etiquetas de "Asunto de mail",
"Mail de contacto" y "Remitente". 

FUNCIONAMIENTO FALTANTE

-Soportar el envio de mail para mas de un contacto
-Consideracion para reemplazo de etiquetas especiales
-Manejo de resultado ante una entrada erronea
-Falta diagrama de clase y de secuencia
-Realizar test para el envio de los mails

POSIBLES MEJORAS

-En la clase CuerpoDelMail se realiza el reemplazo de las etiquetas del cuerpo. Por cada etiqueta existe un metodo para reemplazarlo. Una posible refactorizacion seria buscar la forma de agregar todas las etiquetas a una coleccion e ir iterando dicha coleccion para reemplazar segun sea el caso de la etiqueta eventual.

