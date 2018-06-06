class CuerpoDelMail
  attr_reader :cuerpo

  def initialize(template)
  	@cuerpo = template
  end

  def reemplazar_nombre_contacto(nombre)
  	@cuerpo = @cuerpo.gsub('<nombre>', nombre)
  end

  def reemplazar_nombre_evento(nombre_evento)
  	@cuerpo = @cuerpo.gsub('<nombre_evento>', nombre_evento)
  end

  def reemplazar_lugar_del_evento(lugar_del_evento)
  	@cuerpo = @cuerpo.gsub('<lugar_del_evento>', lugar_del_evento)
  end

  def reemplazar_fecha_del_evento(fecha_del_evento)
  	@cuerpo = @cuerpo.gsub('<fecha_del_evento>', fecha_del_evento)
  end

  def reemplazar_mail_de_confirmacion(mail_de_confirmacion)
  	@cuerpo = @cuerpo.gsub('<mail_de_confirmacion>', mail_de_confirmacion)
  end
end