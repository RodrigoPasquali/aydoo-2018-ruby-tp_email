require_relative './etiqueta'
require_relative './etiqueta_lugar_evento'

class EtiquetaMailConfirmacion < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	@template = @template.gsub('<mail_de_confirmacion>', @datos_evento.get_mail_confirmacion)
  	@etiqueta_siguiente = EtiquetaLugarEvento.new(@template, @datos_contacto, @datos_evento)
 	@etiqueta_siguiente.reemplazar_etiqueta
  end
end