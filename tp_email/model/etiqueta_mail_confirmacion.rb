require_relative './etiqueta'
#require_relative './etiqueta_fecha_actual_inverso'

class EtiquetaMailConfirmacion < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
  	@template.gsub('<mail_de_confirmacion>', @datos_evento.get_mail_confirmacion)
  end
end