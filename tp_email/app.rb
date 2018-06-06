require 'sinatra'
require_relative './model/email'
require_relative './model/parseador'
require_relative './model/evento'
require_relative './model/cuerpo_del_mail'
require_relative './model/contacto'

get '/enviar_mail' do 
	mail = Email.new	
	parseador = Parseador.new
	parseador.parsear_archivo('./archivos_para_prueba/data1.json')
	evento = Evento.new(parseador.get_datos_evento)
	cuerpo = CuerpoDelMail.new(parseador.get_cuerpo)
	primer_contacto = parseador.get_contactos[0]
	contacto = Contacto.new(primer_contacto)
	return mail.enviar_mail(evento, cuerpo, contacto)
end

post '/' do 
	mail = Email.new	
	parseador = Parseador.new
	parseador.parsear_archivo('./archivos_para_prueba/data1.json')
	evento = Evento.new(parseador.get_datos_evento)
	cuerpo = CuerpoDelMail.new(parseador.get_cuerpo)
	primer_contacto = parseador.get_contactos[0]
	contacto = Contacto.new(primer_contacto)
	mail.enviar_mail(evento, cuerpo, contacto)  
end
