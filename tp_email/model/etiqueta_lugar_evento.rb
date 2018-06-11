require_relative './etiqueta'
require_relative './etiqueta_fecha_evento'

class EtiquetaLugarEvento < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
   	@etiqueta_siguiente = EtiquetaFechaEvento.new(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	@template.gsub('<lugar_del_evento>', @datos_evento.get_lugar)
  	@etiqueta_siguiente.reemplazar_etiqueta
  end
end