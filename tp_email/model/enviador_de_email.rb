require 'mail'

class EnviadorDeEmail
  attr_accessor :contacto

  def initialize
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end
  end

=begin
  def armar_cuerpo(cuerpo_ingresado, evento, contacto)
    cuerpo_ingresado.agregar_datos_contacto(contacto)
    cuerpo_ingresado.agregar_datos_evento(evento)
    return cuerpo_ingresado.reemplazar_etiquetas
  end
=end

  def enviar_mail(evento, cuerpo, contacto)
    Mail.deliver do
	    from     evento.get_remitente
      to       contacto.get_mail
	    subject  evento.get_asunto
      body     cuerpo.to_s
 	  end
  end
=begin

  def enviar_mails_a_lista_contactos(evento, cuerpo, lista_contactos)
    lista_contactos.each do |contacto|
      contacto_actual = Contacto.new(contacto)
      self.enviar_mail(evento, cuerpo, contacto) 
    end  
  end
=end
end