class Contacto
  attr_reader :contactos, :nombre

  def initialize(contacto)
	  @contactos = contacto
  end

  def get_nombre#(posicion)
  	#return @contactos[posicion]["nombre"]
    return @contactos["nombre"]
  end

  def get_apellido#(posicion)
  	return @contactos["apellido"]
  end

  def get_mail#(posicion)
  	return @contactos["mail"]
  end
end