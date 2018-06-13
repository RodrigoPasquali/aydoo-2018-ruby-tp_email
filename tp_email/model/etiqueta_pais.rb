require_relative './etiqueta'

class EtiquetaPais < Etiqueta
  attr_accessor :substring_etiqueta, :pais
  def initialize(template, datos_contacto, datos_evento)
  	super(template, datos_contacto, datos_evento)
  end

  def reemplazar_etiqueta
    preocesar_etiqueta_pais(@template)
    @template = @template.gsub(@substring_etiqueta, @pais)  
  	else
  	  return @template
  	end
#  	@etiqueta_siguiente = EtiquetaLugarEvento.new(@template, @datos_contacto, @datos_evento)
# 	@etiqueta_siguiente.reemplazar_etiqueta
  end

  def preocesar_etiqueta_pais(template)
    if(@template.include? '<empty(')
      @pais = ''
      posicion_inicial = @template.index("<empty(")
      posicion_final = @template.size - 1
      @substring_etiqueta = @template[posicion_inicial, posicion_final]
      if (@template.include? '<empty(pais,argentina)>')
        @pais = 'argentina'              
      else
        posicion_inicial = @substring_etiqueta.index("(") + 1
        @substring_pais = @substring_etiqueta[posicion_inicial, posicion_final]
        @substring_pais.each_char {|c| 
          break if(c == ',')
          @pais = @pais + c             
        }
      end 
  end
end