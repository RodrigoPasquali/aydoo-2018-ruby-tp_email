require 'rspec' 
require_relative '../model/parseador'

describe 'Parseador' do
  let(:parseador) { Parseador.new }  
  archivo = File.read('./archivos_para_prueba/archivo_contacto.json')
  data1 = File.read('./archivos_para_prueba/data1.json')

  it 'el nombre del contacto deberia ser Juan' do
  	valor_esperado = 'Juan' 

  	datos_obtenidos = parseador.parsear_archivo(archivo)
  	valor_obtenido = datos_obtenidos["nombre"]

    expect(valor_obtenido).to eq(valor_esperado)
  end 

  it 'el apellido del contacto deberia ser Perez' do
  	valor_esperado = 'Perez'

  	datos_obtenidos = parseador.parsear_archivo(archivo)
  	valor_obtenido = datos_obtenidos["apellido"]

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el email del contacto deberia ser juanperez@test.com' do
  	valor_esperado = 'juanperez@test.com'

  	datos_obtenidos = parseador.parsear_archivo(archivo)
  	valor_obtenido = datos_obtenidos["mail"]

    expect(valor_obtenido).to eq(valor_esperado)
  end
  
  it 'el template deberia ser el mismo que en el archivo datos1' do
  	valor_esperado = 'Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion'

    archivo_parseado = parseador.parsear_archivo(data1)
    valor_obtenido = parseador.get_cuerpo

    expect(valor_obtenido).to eq(valor_esperado)    
  end

  it 'los contactos deberian ser los mismos que en el archivos de datos1' do
  	valor_esperado =[{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}, {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]

    archivo_parseado = parseador.parsear_archivo(data1)
    valor_obtenido = parseador.get_contactos

    expect(valor_obtenido).to eq(valor_esperado)    
  end

  it 'los datos del primer contacto deberian ser juan perez juanperez@test.com' do
  	nombre_esperado ="juan"
  	apellido_esperado ="perez"
  	mail_esperado ="juanperez@test.com"

    archivo_parseado = parseador.parsear_archivo(data1)
    valor_obtenido = parseador.get_contactos

    expect(valor_obtenido[0]['nombre']).to eq(nombre_esperado)    
    expect(valor_obtenido[0]['apellido']).to eq(apellido_esperado)    
    expect(valor_obtenido[0]['mail']).to eq(mail_esperado)    
  end

  it 'los datos del segundo contacto deberian ser maria gonzalez mariagonzalez@test.com' do
  	nombre_esperado ="maria"
  	apellido_esperado ="gonzalez"
  	mail_esperado ="mariagonzalez@test.com"

    archivo_parseado = parseador.parsear_archivo(data1)
    valor_obtenido = parseador.get_contactos

    expect(valor_obtenido[1]['nombre']).to eq(nombre_esperado)    
    expect(valor_obtenido[1]['apellido']).to eq(apellido_esperado)    
    expect(valor_obtenido[1]['mail']).to eq(mail_esperado)    
  end
end