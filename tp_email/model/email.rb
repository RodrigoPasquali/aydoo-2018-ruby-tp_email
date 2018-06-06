require 'mail'

class Email
  attr_accessor :contacto

  def initialize
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end
  end

  def armar_cuerpo(cuerpo_ingresado, evento, contacto)
    cuerpo_ingresado.agregar_datos_contacto(contacto)
    cuerpo_ingresado.agregar_datos_evento(evento)
    return cuerpo_ingresado.reemplazar_etiquetas
  end

  def enviar_mail(evento,cuerpo,contacto)
     texto_cuerpo = armar_cuerpo(cuerpo,evento,contacto)   
    Mail.deliver do
	    from     evento.get_remitente
      to       contacto.get_mail
	    subject  evento.get_asunto
      body     texto_cuerpo
	  end
  end
end