require_relative '../excepciones/falta_mail_contacto_exception'

class Contacto
  attr_reader :contacto

  def initialize(dato_contacto)
	  @contacto = dato_contacto
  end

  def get_nombre
    return @contacto["nombre"]
  end

  def get_apellido
  	return @contacto["apellido"]
  end

  def get_mail
    if (@contacto["mail"].nil?)
      raise FaltaMailDeContactoException
    end
  	return @contacto["mail"]
  end
end