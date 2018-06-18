require 'mail'

class EnviadorDeEmail
  def initialize
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025      
    end
  end

  def enviar_mail(evento, cuerpo, contacto)
    puts '**************EVENTO ENVIO MAIL********************' 
    puts evento
    puts '**************EVENTO ENVIO MAIL********************' 
    puts '**************CUERPO ENVIO MAIL********************' 
    puts cuerpo
    puts '**************CUERPO ENVIO MAIL********************' 
    puts '**************CONTACTO ENVIO MAIL********************' 
    puts contacto
    puts '**************CONTACTO ENVIO MAIL********************' 
      
    Mail.deliver do
	    from     evento.get_remitente
      to       contacto.get_mail
	    subject  evento.get_asunto
      body     cuerpo.to_s
 	  end

      puts 'xxxxxxxxxxxxxxxxxxPASO ENVIO DE MAILxxxxxxxxxxxxxxxxxxxxxxxx' 

  end
end