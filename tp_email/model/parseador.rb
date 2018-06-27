require 'json'

class Parseador
  attr_accessor :archivo_parseado, :cuerpo, :contactos, :datos

  def parsear_archivo(archivo)
    json1 = JSON.parse(archivo)
    json2 = json1.to_json
    @archivo_parseado = JSON.parse(json2)
  end

  def get_cuerpo
  	return @cuerpo = @archivo_parseado['template']
  end

  def get_contactos
    if (@archivo_parseado['contactos'].nil?)
      raise FaltaDatosDeContactosException
    end
  	return @contactos = @archivo_parseado['contactos']
  end

  def get_datos_evento
  	return @datos = @archivo_parseado['datos']
  end
end