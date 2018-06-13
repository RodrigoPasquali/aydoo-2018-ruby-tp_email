require 'rspec' 
require_relative '../model/etiqueta_nombre_contacto'
require_relative '../model/contacto'
require_relative '../model/evento'
require_relative '../model/etiqueta_fecha_actual_inversa'

describe 'Etiqueta' do

  it 'deberia reemplazar <nombre> por "rodrigo"' do  
    template = "Mi nombre es <nombre>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "Mail_de_confirmacion"=>"fiesta@untref.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaNombreContacto.new(template, contacto, evento)

    valor_esperado = "Mi nombre es rodrigo" 
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <nombre_evento> por "mi cumple"' do  
    template = "Te invito a <nombre_evento>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"mi cumple", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "Mail_de_confirmacion"=>"fiesta@untref.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaNombreEvento.new(template, contacto, evento)

    valor_esperado = "Te invito a mi cumple" 
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  
    
  it 'deberia reemplazar <fecha_del_evento> por "10 de enero"' do  
    template = "La reunion es el <fecha_del_evento>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"10 de enero", "Mail_de_confirmacion"=>"fiesta@untref.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaFechaEvento.new(template, contacto, evento)

    valor_esperado = "La reunion es el 10 de enero" 
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <date:i> por la fecha actual de forma inversa' do  
    template = "La fecha actual es <date:i>"
    evento = "evento"
    contacto = "contacto"
    etiqueta = EtiquetaFechaActualInversa.new(template, contacto, evento)
    fecha_actual = Time.now
    fecha_actual = fecha_actual.strftime("%Y %m %d")

    valor_esperado = "La fecha actual es " + fecha_actual.to_s
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <Mail_de_confirmacion> por "algo@web.com"' do  
    template = "El mail es <Mail_de_confirmacion>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "Mail_de_confirmacion"=>"algo@web.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaMailConfirmacion.new(template, contacto, evento)

    valor_esperado = "El mail es algo@web.com" 
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <lugar_del_evento> por "mi casa"' do  
    template = "Los invito a <lugar_del_evento>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"mi casa", "fecha_del_evento"=>"5 de diciembre", "Mail_de_confirmacion"=>"algo@web.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaMailConfirmacion.new(template, contacto, evento)

    valor_esperado = "Los invito a mi casa" 
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar todas las etiquetas del template"' do  
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