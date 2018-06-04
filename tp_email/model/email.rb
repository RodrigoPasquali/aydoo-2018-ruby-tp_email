require 'mail'

class Email

  def initialize
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end
  end

  def enviar_mail(evento, cuerpo)
    cuerpo_reemplazo = cuerpo.gsub('<nombre>', 'Carlos')
    Mail.deliver do
	    from     evento.get_remitente
	    to       'rodrigo.spec@hotmail.com'
	    subject  evento.get_asunto
#	    body     File.read('body.txt')
      body     cuerpo_reemplazo
	  end
  end
end