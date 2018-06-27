class FaltaTemplateException < Exception
  def initialize(msg = 'Falta template en el archivo json')
    super
  end
end