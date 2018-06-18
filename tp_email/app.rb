require 'sinatra'
require 'sinatra/json'
require 'net/smtp'
require 'json'
require_relative './model/enviador_de_email'
require_relative './model/parseador'
require_relative './model/evento'
require_relative './model/contacto'
require_relative './model/etiqueta_nombre_contacto'

post '/' do 
  begin	
	mail = EnviadorDeEmail.new	
	parseador = Parseador.new
    puts '*********************PARAMS******************************'
	puts params
    puts '*********************PARAMS******************************'
	archivo = request.body.read
    puts '*********************ARCHIVO******************************'
    puts archivo
#	puts "Archivo: #{archivo}"
    puts '*********************ARCHIVO******************************'
	parseador.parsear_archivo(archivo)
    puts '*********************EVENTO******************************'
	evento = Evento.new(parseador.get_datos_evento)
    puts evento
    puts '*********************EVENTO******************************'
    puts '*********************CUERPO******************************'
	cuerpo = parseador.get_cuerpo
	puts cuerpo
    puts '*********************CUERPO******************************'
	parseador.get_contactos
	puts '*********************CONTACTOS******************************'
	lista_contactos = parseador.contactos
	puts lista_contactos
    puts '*********************CONTACTOS******************************'
	cantidad_contactos = lista_contactos.length - 1
	i = 0
	while (i <= cantidad_contactos)
		contacto_actual = Contacto.new(lista_contactos[i])
		reemplazador_de_etiqueta = EtiquetaNombreContacto.new(parseador.get_cuerpo, contacto_actual, evento) 
		cuerpo_final = reemplazador_de_etiqueta.reemplazar_etiqueta
		mail.enviar_mail(evento, cuerpo_final, contacto_actual)
		i = i+1
	end
	json({ "resultado": "ok"})
  rescue
    status 500
	json({"resultado": "error, entrada incorrecta"})  
  end
end
