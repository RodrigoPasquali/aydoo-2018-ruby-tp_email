require_relative './etiqueta'
require_relative './etiqueta_time'

class EtiquetaPais < Etiqueta
  attr_accessor :substring_etiqueta, :pais

  def initialize(template, datos_contacto, datos_evento)
  	super(template, datos_contacto, datos_evento)
  end
  
  def reemplazar_etiqueta
    if(@template.include? '<empty(')
      preocesar_etiqueta_pais(@template)
      @template = @template.gsub(@substring_etiqueta, @pais)  
    end
      @etiqueta_siguiente = EtiquetaTime.new(@template, @datos_contacto, @datos_evento)
      @etiqueta_siguiente.reemplazar_etiqueta
  end

  def preocesar_etiqueta_pais(template)
      cuerpo = @template
      @pais = ''
      posicion_inicial = cuerpo.index("<empty(")
      posicion_final = cuerpo.size - 1
      @substring_etiqueta = cuerpo[posicion_inicial, posicion_final]
      posicion_inicial = @substring_etiqueta.index(",") + 1
      posicion_final = @substring_etiqueta.index(")") - 1
      @pais = @substring_etiqueta[posicion_inicial..posicion_final] 
      @pais = @pais.strip
  end
end