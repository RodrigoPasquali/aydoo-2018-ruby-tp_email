require_relative './etiqueta'

class EtiquetaTime < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	  super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	if (@template.include? '<time>') 
  	  time_actual = Time.now
      @template = @template.gsub('<time>', time_actual.strftime("%H" + ":" + "%M"))  
    end  
#  	@etiqueta_siguiente = EtiquetaPais.new(@template, @datos_contacto, @datos_evento)
 #	  @etiqueta_siguiente.reemplazar_etiqueta
  end
end