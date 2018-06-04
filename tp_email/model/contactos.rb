class Contactos
  attr_accessor :contactos

  def initialize(datos_contactos)
	@contactos = datos_contactos
  end

  def get_nombre(posicion)
  	return @contactos[posicion]["nombre"]
  end

  def get_apellido(posicion)
  	return @contactos[posicion]["apellido"]
  end

  def get_mail(posicion)
  	return @contactos[posicion]["mail"]
  end
end