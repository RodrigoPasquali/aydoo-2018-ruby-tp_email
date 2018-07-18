require_relative './etiqueta'
require_relative './etiqueta_fecha_evento'

class EtiquetaNombreEvento < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	if (@template.include? '<nombre_evento>') 
  	  @template = @template.gsub('<nombre_evento>', @datos_evento.get_nombre)	
  	end
  	  @etiqueta_siguiente = EtiquetaFechaEvento.new(@template, @datos_contacto, @datos_evento)
 	  @etiqueta_siguiente.reemplazar_etiqueta
  end
end