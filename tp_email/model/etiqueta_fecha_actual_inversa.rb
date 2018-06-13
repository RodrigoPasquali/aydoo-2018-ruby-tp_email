require_relative './etiqueta'
require_relative './etiqueta_fecha_actual_directa'

class EtiquetaFechaActualInversa < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	if (@template.include? '<date:i>') 
  	  fecha_actual = Time.now
      @template = @template.gsub('<date:i>', fecha_actual.strftime("%Y" + "-" + "%m" + "-" + "%d"))  
  	end
 	@etiqueta_siguiente = EtiquetaFechaActualDirecta.new(@template, @datos_contacto, @datos_evento)
 	@etiqueta_siguiente.reemplazar_etiqueta
  end
end