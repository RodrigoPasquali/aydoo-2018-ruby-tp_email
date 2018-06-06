require 'rspec' 
require_relative '../model/contacto'

describe 'Contactos' do
  it 'el nombre del primer contacto deberia ser juan' do 	
    lista_contactos = [{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}, {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]  
    contacto = Contacto.new(lista_contactos[0])
    valor_esperado = 'juan' 

  	valor_obtenido = contacto.get_nombre

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el apellido del primer contacto deberia ser perez' do 	
    lista_contactos = [{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}, {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]  
    contacto = Contacto.new(lista_contactos[0])

  	valor_esperado = 'perez' 

  	valor_obtenido = contacto.get_apellido

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el mail del primer contacto deberia ser juanperez@test.com' do 	
    lista_contactos = [{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}, {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]  
    contacto = Contacto.new(lista_contactos[0])

  	valor_esperado = 'juanperez@test.com' 

  	valor_obtenido = contacto.get_mail

    expect(valor_obtenido).to eq(valor_esperado)
  end   

  it 'los datos del segundo contacto deberian ser maria gonzalez mariagonzalez@test.com' do 	
    lista_contactos = [{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}, {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]  
    contacto = Contacto.new(lista_contactos[1])

    nombre_esperado = 'maria'
    apellido_esperado = 'gonzalez'
    mail_esperado = 'mariagonzalez@test.com'

  	nombre_obtenido = contacto.get_nombre
  	apellido_obtenido = contacto.get_apellido
	  mail_obtenido = contacto.get_mail

    expect(nombre_obtenido).to eq(nombre_esperado)
    expect(apellido_obtenido).to eq(apellido_esperado)
    expect(mail_obtenido).to eq(mail_esperado)
  end   
end