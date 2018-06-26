require 'rspec' 
require_relative '../model/parseador'

describe 'Parseador' do
  let(:parseador) { Parseador.new }  

  it 'el nombre del contacto deberia ser Juan' do
    archivo_contactos = './archivos_para_prueba/archivo_contacto.json'
    datos_contactos = File.read(archivo_contactos)
    valor_esperado = 'Juan' 

    datos_obtenidos = parseador.parsear_archivo(datos_contactos)
    valor_obtenido = datos_obtenidos["nombre"]

    expect(valor_obtenido).to eq(valor_esperado)
  end 

  it 'los contactos deberian ser los mismos que en el archivos de datos1' do
    archivo_json = './data1.json'
    datos_json = File.read(archivo_json)
    valor_esperado =[{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}, {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]

    archivo_parseado = parseador.parsear_archivo(datos_json)
    valor_obtenido = parseador.get_contactos

    expect(valor_obtenido).to eq(valor_esperado)    
  end

  it 'el apellido del contacto deberia ser Perez' do
    archivo_contactos = './archivos_para_prueba/archivo_contacto.json'
    datos_contactos = File.read(archivo_contactos)
  	valor_esperado = 'Perez'

  	datos_obtenidos = parseador.parsear_archivo(datos_contactos)
  	valor_obtenido = datos_obtenidos["apellido"]

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el email del contacto deberia ser juanperez@test.com' do
    archivo_contactos = './archivos_para_prueba/archivo_contacto.json'
    datos_contactos = File.read(archivo_contactos)
  	valor_esperado = 'juanperez@test.com'

  	datos_obtenidos = parseador.parsear_archivo(datos_contactos)
  	valor_obtenido = datos_obtenidos["mail"]

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'los datos del primer contacto deberian ser juan perez juanperez@test.com' do
    archivo_json = './data1.json'
    datos_json = File.read(archivo_json)
  	nombre_esperado ="juan"
  	apellido_esperado ="perez"
  	mail_esperado ="juanperez@test.com"

    archivo_parseado = parseador.parsear_archivo(datos_json)
    valor_obtenido = parseador.get_contactos

    expect(valor_obtenido[0]['nombre']).to eq(nombre_esperado)    
    expect(valor_obtenido[0]['apellido']).to eq(apellido_esperado)    
    expect(valor_obtenido[0]['mail']).to eq(mail_esperado)    
  end

  it 'los datos del segundo contacto deberian ser maria gonzalez mariagonzalez@test.com' do
    archivo_json = './data1.json'
    datos_json = File.read(archivo_json)
  	nombre_esperado ="maria"
  	apellido_esperado ="gonzalez"
  	mail_esperado ="mariagonzalez@test.com"

    archivo_parseado = parseador.parsear_archivo(datos_json)
    valor_obtenido = parseador.get_contactos

    expect(valor_obtenido[1]['nombre']).to eq(nombre_esperado)    
    expect(valor_obtenido[1]['apellido']).to eq(apellido_esperado)    
    expect(valor_obtenido[1]['mail']).to eq(mail_esperado)    
  end

  it 'los datos del evento deberian ser los mismos que en el archivos de datos1' do
    archivo_json = './data1.json'
    datos_json = File.read(archivo_json)
  	valor_esperado = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "Mail_de_confirmacion"=>"fiesta@untref.com"}

    archivo_parseado = parseador.parsear_archivo(datos_json)
    valor_obtenido = parseador.get_datos_evento

    expect(valor_obtenido).to eq(valor_esperado)    
  end  

  it 'los datos del evento deberian ser los mismos que en el archivos de datos1' do
    archivo_json = './archivos_para_prueba/data3.json'
    datos_json = File.read(archivo_json)
    valor_esperado = {
       "asunto"=>"Ejemplo 3: Caso etiquetas varias",
       "remitente"=> "no-reply@test.com",
       "lugar_cumple"=>"Avenida de mayo 1333"
    }
    archivo_parseado = parseador.parsear_archivo(datos_json)
    valor_obtenido = parseador.get_datos_evento

    expect(valor_obtenido).to eq(valor_esperado)    
  end  
end
