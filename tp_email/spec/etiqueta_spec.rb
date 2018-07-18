require 'rspec' 
require_relative '../model/etiqueta_nombre_contacto'
require_relative '../model/contacto'
require_relative '../model/evento'
require_relative '../model/etiqueta_fecha_actual_inversa'
require_relative '../model/etiqueta_fecha_actual_directa'
require_relative '../model/etiqueta_pais'
require_relative '../model/etiqueta_time'
require_relative '../model/etiqueta_time_12'
require_relative '../model/etiqueta_suma'

describe 'Etiqueta' do
  it 'deberia reemplazar <nombre> por "rodrigo"' do  
    template = "Mi nombre es <nombre>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "mail_de_confirmacion"=>"fiesta@untref.com"}
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
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"mi cumple", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "mail_de_confirmacion"=>"fiesta@untref.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaNombreEvento.new(template, contacto, evento)

    valor_esperado = "Te invito a mi cumple" 
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <mail_de_confirmacion> por "algo@web.com"' do  
    template = "El mail es <mail_de_confirmacion>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "mail_de_confirmacion"=>"algo@web.com"}
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
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"mi casa", "fecha_del_evento"=>"5 de diciembre", "mail_de_confirmacion"=>"algo@web.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaLugarEvento.new(template, contacto, evento)

    valor_esperado = "Los invito a mi casa" 
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <fecha_del_evento> por "10 de enero"' do  
    template = "La reunion es el <fecha_del_evento>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"10 de enero", "mail_de_confirmacion"=>"fiesta@untref.com"}
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
    fecha_actual = fecha_actual.strftime("%Y" + "-" + "%m" + "-" + "%d")

    valor_esperado = "La fecha actual es " + fecha_actual.to_s
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <date:d> por la fecha actual de forma directa' do  
    template = "La fecha actual es <date:d>"
    evento = "evento"
    contacto = "contacto"
    etiqueta = EtiquetaFechaActualDirecta.new(template, contacto, evento)
    fecha_actual = Time.now
    fecha_actual = fecha_actual.strftime("%d" + "-" + "%m" + "-" + "%Y")

    valor_esperado = "La fecha actual es " + fecha_actual.to_s
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <time> por la hora actual' do  
    template = "La hora actual es <time>"
    evento = "evento"
    contacto = "contacto"
    etiqueta = EtiquetaTime.new(template, contacto, evento)
    fecha_actual = Time.now
    fecha_actual = fecha_actual.strftime("%H" + ":" + "%M")

    valor_esperado = "La hora actual es " + fecha_actual.to_s
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <time:12> por la hora actual, con las horas en 1 digito' do  
    template = "La hora actual es <time:12>"
    evento = "evento"
    contacto = "contacto"
    etiqueta = EtiquetaTime12.new(template, contacto, evento)
    fecha_actual = Time.now
    fecha_actual = fecha_actual.strftime("%I" + ":" + "%M " "%p")

    valor_esperado = "La hora actual es " + fecha_actual.to_s
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <empty(pais,argentina)> por "argentina"' do  
    template = "Messi juega en <empty(pais, argentina)>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"10 de enero", "mail_de_confirmacion"=>"fiesta@untref.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaPais.new(template, contacto, evento)

    valor_esperado = "Messi juega en argentina" 
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <empty(pais, belgica)> por "belgica"' do  
    template = "Lukaku juega en <empty(pais, belgica)>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"10 de enero", "mail_de_confirmacion"=>"fiesta@untref.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaPais.new(template, contacto, evento)

    valor_esperado = "Lukaku juega en belgica" 
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <sum(1,3)> por "4"' do  
    template = "Cuando sumo 1 y 3 obtengo <sum(1,3)>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"mi casa", "fecha_del_evento"=>"5 de diciembre", "mail_de_confirmacion"=>"algo@web.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaSuma.new(template, contacto, evento)

    valor_esperado = "Cuando sumo 1 y 3 obtengo 4" 
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar <sum(50,7)> por "57"' do  
    template = "Cuando sumo 50 y 7 obtengo <sum(50,7)>"
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"mi casa", "fecha_del_evento"=>"5 de diciembre", "mail_de_confirmacion"=>"algo@web.com"}
    evento = Evento.new(datos_evento)    
    datos_contacto =  {"nombre"=>"rodrigo", "apellido"=>"perez", "mail"=>"juanperez@test.com"}
    contacto = Contacto.new(datos_contacto)
    etiqueta = EtiquetaSuma.new(template, contacto, evento)

    valor_esperado = "Cuando sumo 50 y 7 obtengo 57" 
    
    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)    
  end  

  it 'deberia reemplazar todas las etiquetas del template"' do  
    template = "Fecha Actual D : <date:d>  Hora Actual(24hs) : <time> \n\rHola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion\n\rFecha Actual I : <date:i>  Hora Actual(12hs) : <time:12>\n\rPais : <empty(pais, china)>  Codigo: <sum(100,9)>" 
    datos_contacto = [{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}, {"nombre"=>"maria", "apellido"=>"gonzalez", "mail"=>"mariagonzalez@test.com"}]  
    contacto = Contacto.new(datos_contacto[0])
    datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "mail_de_confirmacion"=>"fiesta@untref.com"}
    evento = Evento.new(datos_evento)
    etiqueta = EtiquetaNombreContacto.new(template, contacto, evento)
    fecha_actual = Time.now
    fecha_actual_d = fecha_actual.strftime("%d" + "-" + "%m" + "-" + "%Y")
    fecha_actual_i = fecha_actual.strftime("%Y" + "-" + "%m" + "-" + "%d")
    hora_actual_24 = fecha_actual.strftime("%H" + ":" + "%M")
    hora_actual_12 = fecha_actual.strftime("%I" + ":" + "%M " "%p")
    valor_esperado = "Fecha Actual D : " + fecha_actual_d.to_s + "  Hora Actual(24hs) : " + hora_actual_24.to_s + " \n\rHola juan,\n\r Por medio del presente mail te estamos invitando a la cena de fin de año de la UNTREF, que se desarrollará en el Centro de estudios (avenida Directorio 887, Caseros), el día 5 de diciembre. Por favor confirmar su participación enviando un mail a fiesta@untref.com.\n\rSin otro particular.La direccion\n\r" + "Fecha Actual I : " + fecha_actual_i.to_s + "  Hora Actual(12hs) : " + hora_actual_12.to_s + "\n\rPais : china  Codigo: 109"

    valor_obtenido = etiqueta.reemplazar_etiqueta

    expect(valor_esperado).to eq(valor_obtenido)
  end
end