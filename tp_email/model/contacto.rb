class Contacto
  attr_accessor :nombre, :apellido, :correo

  def initialize(nombre_ingresado, apellido_ingresado, correo_ingresado)
  	@nombre = nombre_ingresado
  	@apellido = apellido_ingresado
  	@correo = correo_ingresado
  end
end