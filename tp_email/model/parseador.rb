require 'json'

class Parseador
  def parsear_contacto(json)
  	return datos_contacto = JSON.parse(json)
  end
end