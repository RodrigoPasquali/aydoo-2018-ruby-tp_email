require_relative './etiqueta'

class EtiquetaSuma < Etiqueta
  attr_accessor :substring_etiqueta, :resultado_suma

  def initialize(template, datos_contacto, datos_evento)
  	super(template, datos_contacto, datos_evento)
  end
  
  def reemplazar_etiqueta
    if(@template.include? '<sum(')
      preocesar_etiqueta_suma(@template)
      @template = @template.gsub(@substring_etiqueta, @resultado_suma)  
    else
      return @template
    end
  end

  def preocesar_etiqueta_suma(template)
    cuerpo = @template
    posicion_inicial = cuerpo.index("<sum(")
    posicion_final = cuerpo.size - 1
    posicion_final = cuerpo.size - 1
    cuerpo =  cuerpo[posicion_inicial..posicion_final]
    posicion_final = cuerpo.index(">")
    @substring_etiqueta = cuerpo[0..posicion_final]
    @substring_etiqueta = @substring_etiqueta.strip
    posicion_inicial = @substring_etiqueta.index("(") + 1
    posicion_final =  @substring_etiqueta.index(",") - 1
    primer_numero = @substring_etiqueta[posicion_inicial..posicion_final].to_i
    posicion_inicial = posicion_final + 2
    posicion_final = @substring_etiqueta.index(")") - 1
    segundo_numero = @substring_etiqueta[posicion_inicial..posicion_final].to_i
    @resultado_suma = (primer_numero + segundo_numero).to_s
  end
end