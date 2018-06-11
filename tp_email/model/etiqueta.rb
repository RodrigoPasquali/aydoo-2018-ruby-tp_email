class Etiqueta
  attr_accessor :template, :datos_contacto, :datos_evento, :etiqueta_siguiente

  def initialize(template, datos_contacto, datos_evento)
    @template = template
    @datos_contacto = datos_contacto
    @datos_evento = datos_evento
    @etiqueta_siguiente = nil
  end
=begin
  def agregar_datos_contacto(datos_contacto)
	@datos_contacto = datos_contacto  	
  end

  def agregar_template(template)
  	@template = template
  end

  def agregar_datos_evento(datos_evento)
  	@datos_evento = datos_evento
  end
=end
end