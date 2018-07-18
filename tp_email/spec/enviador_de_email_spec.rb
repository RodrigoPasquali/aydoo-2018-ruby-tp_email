require 'rspec' 
require_relative '../model/enviador_de_email'
require_relative '../model/evento'
require_relative '../model/contacto'

describe 'mail' do
  it 'deberia enviar un mail' do
  	datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "Mail_de_confirmacion"=>"fiesta@untref.com"}
  	datos_contacto = [{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}, {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]
  	cuerpo = "Cuerpo para el mail"
  	contacto = Contacto.new(datos_contacto[0])
  	evento = Evento.new(datos_evento)
  	enviador_de_email = EnviadorDeEmail.new
  	enviador_de_email.stub(:enviador_de_email).with(evento, cuerpo, contacto)
  end
end
