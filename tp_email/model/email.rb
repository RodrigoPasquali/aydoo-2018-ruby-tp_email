require 'mail'

class Email
	def enviar_mail(nombre)
		Mail.defaults do
		  delivery_method :smtp, address: "localhost", port: 1025
		end

		Mail.deliver do
		  from     'rodrigo.spec@hotmail.com'
		  to       'rodrigo.spec@hotmail.com'
		  subject  'Prueba envio de mail para ' + nombre
		  body     File.read('body.txt')
		end
	end
end