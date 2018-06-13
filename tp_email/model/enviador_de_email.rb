require 'mail'

class EnviadorDeEmail
  attr_accessor :contacto

  def initialize
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025      
    end
  end

  def enviar_mail(evento, cuerpo, contacto)
    Mail.deliver do
	    from     evento.get_remitente
      to       contacto.get_mail
	    subject  evento.get_asunto
      body     cuerpo.to_s
 	  end
  end
end