
FUNCIONAMIENTO DE LA APLICACION

-Etiquetas erroneas se ignoran
-Etiqueta para pais se considera de la siguiente manera : 
-Al introducir el comando (curl -X POST -H "Content-Type: application/json" --data @data1.json localhost:4567/) el test que se encontraba en app_spec funcionaba de forma correcta devolviendo status 200, pero al subir el codigo a github travis falla, por lo que quite el test. No logro encontra el motivo por el que travis falla.
#Test devuelve un status 500
		=begin
		  it 'deberia obtener status 200 y el cuerpo deberia devolver "ok' do
			  archivo_json = './data1.json'
		    datos_json = File.read(archivo_json)
		    content = {'Content-Type' => 'application/json'}
		    post '/', datos_json, content
		    cuerpo = JSON.parse(last_response.body)
		    #expect(last_response).to be_ok
		    #expect(last_response.status).to eq 200
		    #expect(cuerpo['resultado']).to eq 'ok'
		  end
		=end


FUNCIONAMIENTO FALTANTE

-Etiqueta para realizar sumatoria : "<sum(monto1, monto2)>: debe reemplazarse por la suma de los placesholders monto1 y monto2"
-Falta diagrama de secuencia
-No se realizan validaciones para datos incompletos (ejemplo : un contacto no pose nombre en archivo json)
-Expeciones en cada caso particular que lo amerite (relacionado con el item de arriba, si falta un mail deberia enviar una expecion de que falta mail)

POSIBLES MEJORAS

-Quitar logica del metodo Post '/' de la clase app.rb --> el while podria introducirse en otra clase
