class Evento
  attr_reader :evento

  def initialize(datos_evento)
  	@evento = datos_evento
  end

  def get_remitente
  	return @evento['remitente']
  end

  def get_asunto
  	return @evento['asunto']
  end

  def get_nombre
  	return @evento['nombre_evento']
  end

  def get_lugar
  	return @evento['lugar_del_evento']
  end

  def get_fecha
  	return @evento['fecha_del_evento']
  end

  def get_mail_confirmacion
  	return @evento['mail_de_confirmacion']
  end
end