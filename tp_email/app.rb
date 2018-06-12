require 'sinatra'
require 'net/smtp'
require 'json'
#require 'sinatra/json'
require_relative './model/enviador_de_email'
require_relative './model/parseador'
require_relative './model/evento'
require_relative './model/cuerpo_del_mail'
require_relative './model/contacto'
require_relative './model/etiqueta_nombre_contacto'

=begin
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
=end

get '/enviar_mail' do 
	mail = EnviadorDeEmail.new	
	parseador = Parseador.new
	parseador.parsear_archivo('./archivos_para_prueba/data1.json')
	evento = Evento.new(parseador.get_datos_evento)
	primer_contacto = parseador.get_contactos[0]
	contacto = Contacto.new(primer_contacto)
	reemplazador_de_etiqueta = EtiquetaNombreContacto.new(parseador.get_cuerpo, contacto, evento) 
	cuerpo_final = reemplazador_de_etiqueta.reemplazar_etiqueta
	mail.enviar_mail(evento, cuerpo_final, contacto)  
end


post '/' do 
	mail = EnviadorDeEmail.new	
	parseador = Parseador.new
	archivo = request.body.read
	parseador.parsear_archivo(archivo)	
=begin
	parseador.parsear_archivo(archivo)	
	evento = Evento.new(parseador.get_datos_evento)
	i = 0
	lista_contactos = parseador.get_contactos

	lista_contactos.each do |contacto|
		contacto_actual = Contacto.new(lista_contactos[i])
#		reemplazador_de_etiqueta = EtiquetaNombreContacto.new(parseador.get_cuerpo, contacto_actual, evento) 
#		cuerpo_final = reemplazador_de_etiqueta.reemplazar_etiqueta
		mail.enviar_mail(evento, parseador.get_cuerpo, contacto_actual)		
	end
=end
end
