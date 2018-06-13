class EtiquetaFechaActualDirecta < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	if (@template.include? '<date:d>') 
  	  fecha_actual = Time.now
      @template = @template.gsub('<date:d>', fecha_actual.strftime("%d %m %Y"))  
  	end
#  	@etiqueta_siguiente = EtiquetaLugarEvento.new(@template, @datos_contacto, @datos_evento)
# 	@etiqueta_siguiente.reemplazar_etiqueta
  end
end