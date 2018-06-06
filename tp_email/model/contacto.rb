class Contacto
  attr_reader :contacto, :nombre

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
  	return @contacto["mail"]
  end
end