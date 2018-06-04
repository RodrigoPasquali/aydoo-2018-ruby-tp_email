require 'sinatra'
require_relative './model/email'
require_relative './model/parseador'
require_relative './model/evento'


get '/prueba/:nombre' do 
	nombre = params[:nombre]
	return 'hola :' + nombre
end

get '/enviar_mail' do 
	enviador = Email.new	
	parseador = Parseador.new
	parseador.parsear_archivo('./archivos_para_prueba/data1.json')
	evento = Evento.new(parseador.get_datos_evento)
	cuerpo = parseador.get_cuerpo
	return enviador.enviar_mail(evento, cuerpo)
end

post '/prueba_mail' do 
	enviador = Email.new	
	parseador = Parseador.new
	parseador.parsear_archivo(request.body.read)
	evento = Evento.new(parseador.get_datos_evento)
	cuerpo = parseador.get_cuerpo
	return enviador.enviar_mail(evento, cuerpo_reemplazo)
end