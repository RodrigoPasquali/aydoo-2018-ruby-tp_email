class Etiqueta
  attr_accessor :template, :datos_contacto, :datos_evento, :etiqueta_siguiente

  def initialize(template, datos_contacto, datos_evento)
    @template = template
    @datos_contacto = datos_contacto
    @datos_evento = datos_evento
    @etiqueta_siguiente = nil
  end
end