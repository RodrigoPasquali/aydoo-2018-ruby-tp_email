require_relative './etiqueta'
require_relative './etiqueta_nombre_evento'

class EtiquetaNombreContacto < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	cuerpo = @template.gsub('<nombre>', @datos_contacto.get_nombre)
 	@etiqueta_siguiente = EtiquetaNombreEvento.new(cuerpo, @datos_contacto, @datos_evento)
  	@template = @etiqueta_siguiente.reemplazar_etiqueta	
  end

end 