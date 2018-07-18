require_relative './etiqueta'
require_relative './etiqueta_mail_confirmacion'

class EtiquetaFechaEvento < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	if (@template.include? '<fecha_del_evento>') 
  	  @template = @template.gsub('<fecha_del_evento>', @datos_evento.get_fecha)
  	end
  	  @etiqueta_siguiente = EtiquetaMailConfirmacion.new(@template, @datos_contacto, @datos_evento)
  	  @etiqueta_siguiente.reemplazar_etiqueta
  end
end