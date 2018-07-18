class FaltaMailDeContactoException < Exception
  def initialize(msg = 'Faltan mail de un contacto')
    super
  end
end