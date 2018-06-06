require 'sinatra'
require_relative './model/email'
require_relative './model/parseador'
require_relative './model/evento'
require_relative './model/cuerpo_del_mail'
require_relative './model/contacto'


get '/prueba/:nombre' do 
	nombre = params[:nombre]
	return 'hola :' + nombre
end

get '/enviar_mail' do 
	mail = Email.new	
	parseador = Parseador.new
	parseador.parsear_archivo('./archivos_para_prueba/data1.json')
	evento = Evento.new(parseador.get_datos_evento)
	cuerpo = CuerpoDelMail.new(parseador.get_cuerpo)
	primer_contato = parseador.get_contactos[0]
	contacto = Contacto.new(primer_contato)
	cuerpo.agregar_datos_contacto(contacto)
	cuerpo.agregar_datos_evento(evento)
	mail.armar_cuerpo(cuerpo)
	return mail.enviar_mail(evento)
end

=begin
post '/' do 
	enviador = Email.new	
	parseador = Parseador.new
	parseador.parsear_archivo(request.body.read)
	evento = Evento.new(parseador.get_datos_evento)
	cuerpo = parseador.get_cuerpo
	return enviador.enviar_mail(evento, cuerpo_reemplazo)
end
=end