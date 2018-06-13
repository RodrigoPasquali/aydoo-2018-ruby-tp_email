require_relative './etiqueta'

class EtiquetaTime12 < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	  super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	if (@template.include? '<time:12>') 
  	  time_actual = Time.now
      @template = @template.gsub('<time:12>', time_actual.strftime("%I" + ":" + "%M " "%p"))  
    end  
#  	@etiqueta_siguiente = EtiquetaPais.new(@template, @datos_contacto, @datos_evento)
 #	  @etiqueta_siguiente.reemplazar_etiqueta
  end
end