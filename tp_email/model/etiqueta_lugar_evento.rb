require_relative './etiqueta'

class EtiquetaLugarEvento < Etiqueta
  def initialize(template, datos_contacto, datos_evento)
 	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
    @template = @template.gsub('<lugar_del_evento>', @datos_evento.get_lugar)
  end
end
