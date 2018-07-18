require_relative './etiqueta'
require_relative './etiqueta_nombre_evento'

class EtiquetaNombreContacto < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	if (@template.include? '<nombre>') 
  	  @template = @template.gsub('<nombre>', @datos_contacto.get_nombre)
  	end
 	  @etiqueta_siguiente = EtiquetaNombreEvento.new(@template, @datos_contacto, @datos_evento)
      @etiqueta_siguiente.reemplazar_etiqueta		
  end
end 