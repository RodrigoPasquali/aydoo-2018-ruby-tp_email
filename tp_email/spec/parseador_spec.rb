require 'rspec' 
require_relative '../model/parseador'

describe 'Parseador' do
  let(:parseador) { Parseador.new }  
  archivo = File.read('./archivos_para_prueba/archivo_contacto.json')

  it 'el nombre del contacto deberia ser Juan' do
  	valor_esperado = 'Juan' 

  	datos_obtenidos = parseador.parsear_contacto(archivo)
  	valor_obtenido = datos_obtenidos["nombre"]

    expect(valor_obtenido).to eq(valor_esperado)
  end 

  it 'el apellido del contacto deberia ser Perez' do
  	valor_esperado = 'Perez'

  	datos_obtenidos = parseador.parsear_contacto(archivo)
  	valor_obtenido = datos_obtenidos["apellido"]

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el email del contacto deberia ser juanperez@test.com' do
  	valor_esperado = 'juanperez@test.com'

  	datos_obtenidos = parseador.parsear_contacto(archivo)
  	valor_obtenido = datos_obtenidos["mail"]

    expect(valor_obtenido).to eq(valor_esperado)
  end

end