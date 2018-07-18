class FaltaMailDeRemitenteException < Exception
  def initialize(msg = 'Faltan mail de remitente')
    super
  end
end