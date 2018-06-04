require 'sinatra'
require_relative './model/email'

get '/prueba/:nombre' do 
	nombre = params[:nombre]
	return 'hola :' + nombre
end

get '/enviar_mail/:nombre' do 
	enviador = Email.new	
	nombre = params[:nombre]
	return enviador.enviar_mail(nombre)
end