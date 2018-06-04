require 'json'

class Parseador
  attr_accessor :archivo_paseado, :cuerpo, :contactos

  def parsear_contacto(json)
  	return datos_contacto = JSON.parse(json)
  end

  def parsear_archivo(json)
  	return @archivo_paseado = JSON.parse(json)
  end

  def get_cuerpo
  	return @cuerpo = @archivo_paseado["template"]
  end

  def get_contactos
  	return @contactos = @archivo_paseado["contactos"] 
  end
end