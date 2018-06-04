require 'rspec' 
require_relative '../model/contactos'

describe 'Contactos' do
  lista_contactos = [{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}, {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]  
  let(:contactos) { Contactos.new(lista_contactos) }  

  it 'el nombre del primer contacto deberia ser juan' do 	
  	valor_esperado = 'juan' 

  	valor_obtenido = contactos.get_nombre(0)

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el apellido del primer contacto deberia ser perez' do 	
  	valor_esperado = 'perez' 

  	valor_obtenido = contactos.get_apellido(0)

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el mail del primer contacto deberia ser juanperez@test.com' do 	
  	valor_esperado = 'juanperez@test.com' 

  	valor_obtenido = contactos.get_mail(0)

    expect(valor_obtenido).to eq(valor_esperado)
  end   
end