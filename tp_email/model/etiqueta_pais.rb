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
      if (cuerpo.include? '<empty(pais,argentina)>')
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