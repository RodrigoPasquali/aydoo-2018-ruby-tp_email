require_relative './etiqueta'
require_relative './etiqueta_lugar_evento'

class EtiquetaNombreEvento < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	cuerpo = @template.gsub('<nombre_evento>', @datos_evento.get_nombre)	
  	@etiqueta_siguiente = EtiquetaLugarEvento.new(cuerpo, @datos_contacto, @datos_evento)
 	@template = @etiqueta_siguiente.reemplazar_etiqueta
  end
end