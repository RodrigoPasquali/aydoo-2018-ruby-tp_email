require 'rspec' 
require_relative '../model/cuerpo_del_mail'

describe 'Cuerpo del Mail ' do
  template = "Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion"
  let(:cuerpo) { CuerpoDelMail.new(template) }  

  it '<nombre> deberia ser reemplazo por Juan' do
  	valor_esperado = "Hola Juan,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion" 
  	nombre = "Juan"

  	valor_obtenido = cuerpo.reemplazar_nombre(nombre)

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it '<nombre_evento> deberia ser reemplazo por "la cena de fin de año de la UNTREF"' do
  	valor_esperado = "Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a la cena de fin de año de la UNTREF, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion" 
  	nombre_evento = "la cena de fin de año de la UNTREF"

  	valor_obtenido = cuerpo.reemplazar_nombre_evento(nombre_evento)

    expect(valor_obtenido).to eq(valor_esperado)
  end 

  it '<lugar_del_evento> deberia ser reemplazo por "el Centro de estudios (avenida Directorio 887, Caseros)"' do
  	valor_esperado = "Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en el Centro de estudios (avenida Directorio 887, Caseros), el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion" 
  	lugar_del_evento = "el Centro de estudios (avenida Directorio 887, Caseros)"

  	valor_obtenido = cuerpo.reemplazar_lugar_del_evento(lugar_del_evento)

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it '<fecha_del_evento> deberia ser reemplazo por 5 de diciembre' do
  	valor_esperado = "Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día 5 de diciembre. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion" 
  	fecha_del_evento = "5 de diciembre"

  	valor_obtenido = cuerpo.reemplazar_fecha_del_evento(fecha_del_evento)

    expect(valor_obtenido).to eq(valor_esperado)
  end  

  it '<mail_de_confirmacion> deberia ser reemplazo por fiesta@untref.com' do
  	valor_esperado = "Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a fiesta@untref.com.\n\rSin otro particular.La direccion" 
  	mail_de_confirmacion = "fiesta@untref.com"

  	valor_obtenido = cuerpo.reemplazar_mail_de_confirmacion(mail_de_confirmacion)

    expect(valor_obtenido).to eq(valor_esperado)
  end  
end