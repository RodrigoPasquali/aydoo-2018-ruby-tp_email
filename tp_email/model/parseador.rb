require 'json'

class Parseador
  attr_accessor :archivo_parseado, :cuerpo, :contactos

  def parsear_archivo(archivo)
  	datos = File.read(archivo)
  	@archivo_parseado = JSON.parse(datos)
  end

  def get_cuerpo
  	return @cuerpo = @archivo_parseado["template"]
  end

  def get_contactos
  	return @contactos = @archivo_parseado["contactos"] 
  end

  def get_datos_evento
  	return @datos = @archivo_parseado["datos"]
  end
end