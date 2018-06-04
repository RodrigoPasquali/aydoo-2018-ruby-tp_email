require 'json'

class Parseador
  attr_accessor :archivo_parseado, :cuerpo, :contactos

  def parsear_archivo(json)
  	return @archivo_parseado = JSON.parse(json)
  end

  def get_cuerpo
  	return @cuerpo = @archivo_parseado["template"]
  end

  def get_contactos
  	return @contactos = @archivo_parseado["contactos"] 
  end

  def get_datos
  	return @datos = @archivo_parseado["datos"]
  end
end