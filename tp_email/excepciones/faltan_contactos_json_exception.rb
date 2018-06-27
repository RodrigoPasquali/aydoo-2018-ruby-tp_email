class FaltaDatosDeContactosException < Exception
  def initialize(msg = 'Faltan datos de contactos en el archivo json')
    super
  end
end