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

  it 'los datos del segundo contacto deberian ser maria gonzalez mariagonzalez@test.com' do 	
  	nombre_esperado = 'maria' 
  	apellido_esperado = 'gonzalez' 
  	mail_esperado = 'mariagonzalez@test.com' 

  	nombre_obtenido = contactos.get_nombre(1)
	apellido_obtenido = contactos.get_apellido(1)
	mail_obtenido = contactos.get_mail(1)

    expect(nombre_obtenido).to eq(nombre_esperado)
    expect(apellido_obtenido).to eq(apellido_esperado)
    expect(mail_obtenido).to eq(mail_esperado)
  end   
end