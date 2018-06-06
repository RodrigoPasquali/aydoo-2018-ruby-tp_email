require 'mail'

class Email
  attr_reader :contactos, :evento, :cuerpo

  def initialize
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end
  end

  def armar_cuerpo(cuerpo_ingresado)
    @cuerpo = cuerpo_ingresado.reemplazar_etiquetas
  end

  def enviar_mail(evento)
    Mail.deliver do
	    from     evento.get_remitente
	    to       'rodrigo.spec@hotmail.com'
	    subject  evento.get_asunto
#	    body     File.read('body.txt')
      body     @cuerpo
	  end
  end
end