require 'rspec' 
require_relative '../model/etiqueta_nombre_contacto'
require_relative '../model/contacto'
require_relative '../model/evento'

describe 'Etiqueta' do

  it 'deberia reemplazar <nombre> por "juan"' do  
    template = "Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <Mail_de_confirmacion>.\n\rSin otro particular.La direccion"
    datos_contacto = [{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}, {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]  
    contacto = Contacto.new(datos_contacto[0])
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "Mail_de_confirmacion"=>"fiesta@untref.com"}
    evento = Evento.new(datos_evento)
    etiqueta = EtiquetaNombreContacto.new(template, contacto, evento)
    valor_esperado = "Hola juan,\n\r Por medio del presente mail te estamos invitando a la cena de fin de año de la UNTREF, que se desarrollará en el Centro de estudios (avenida Directorio 887, Caseros), el día 5 de diciembre. Por favor confirmar su participación enviando un mail a fiesta@untref.com.\n\rSin otro particular.La direccion"
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)
  end

end