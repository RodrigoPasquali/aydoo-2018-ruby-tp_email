class CuerpoDelMail
  attr_reader :cuerpo, :contacto, :evento

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

  def agregar_datos_contacto(contacto_ingresado)
	  @contacto  = contacto_ingresado	
  end

  def agregar_datos_evento(evento_ingresado)
 	  @evento = evento_ingresado 
  end

  def reemplazar_etiquetas
  	self.reemplazar_nombre_contacto(@contacto.get_nombre)
  	self.reemplazar_nombre_evento(@evento.get_nombre)
  	self.reemplazar_lugar_del_evento(@evento.get_lugar)
  	self.reemplazar_fecha_del_evento(@evento.get_fecha)
  	self.reemplazar_mail_de_confirmacion(@evento.get_mail_confirmacion)
  end
end