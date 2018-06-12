require 'sinatra'
require 'net/smtp'
require 'json'
require_relative './model/enviador_de_email'
require_relative './model/parseador'
require_relative './model/evento'
require_relative './model/cuerpo_del_mail'
require_relative './model/contacto'
require_relative './model/etiqueta_nombre_contacto'

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
	evento = Evento.new(parseador.get_datos_evento)
	cuerpo = parseador.get_cuerpo
	parseador.get_contactos
	lista_contactos = parseador.contactos
	cantidad_contactos = lista_contactos.length - 1
	i = 0
	while (i <= cantidad_contactos)
		contacto_actual = Contacto.new(lista_contactos[i])
		reemplazador_de_etiqueta = EtiquetaNombreContacto.new(parseador.get_cuerpo, contacto_actual, evento) 
		cuerpo_final = reemplazador_de_etiqueta.reemplazar_etiqueta
		mail.enviar_mail(evento, cuerpo_final, contacto_actual)
		i = i+1
	end
end
