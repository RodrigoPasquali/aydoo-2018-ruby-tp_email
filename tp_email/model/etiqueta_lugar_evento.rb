require_relative './etiqueta'
require_relative './etiqueta'
require_relative './etiqueta_fecha_actual_inversa'

class EtiquetaLugarEvento < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	if (@template.include? '<lugar_del_evento>')   	
      @template = @template.gsub('<lugar_del_evento>', @datos_evento.get_lugar)
    end
      @etiqueta_siguiente = EtiquetaFechaActualInversa.new(@template, @datos_contacto, @datos_evento)
 	  @etiqueta_siguiente.reemplazar_etiqueta
  end
end
