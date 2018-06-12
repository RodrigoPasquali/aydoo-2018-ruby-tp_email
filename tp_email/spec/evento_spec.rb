require 'rspec' 
require_relative '../model/evento'

describe 'Evento' do
  datos_evento = {"remitente"=>"universidad@untref.com", "asunto"=>"Invitación a fiesta de fin de año", "nombre_evento"=>"la cena de fin de año de la UNTREF", "lugar_del_evento"=>"el Centro de estudios (avenida Directorio 887, Caseros)", "fecha_del_evento"=>"5 de diciembre", "Mail_de_confirmacion"=>"fiesta@untref.com"}
  let(:evento) { Evento.new(datos_evento) }  

  it 'el remitente deberia ser universidad@untref.com' do 	
  	valor_esperado = 'universidad@untref.com' 

  	valor_obtenido = evento.get_remitente

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el asunto deberia ser "Invitación a fiesta de fin de año"' do 	
  	valor_esperado = 'Invitación a fiesta de fin de año' 

  	valor_obtenido = evento.get_asunto

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el nombre deberia ser "la cena de fin de año de la UNTREF"' do 	
  	valor_esperado = 'la cena de fin de año de la UNTREF' 

  	valor_obtenido = evento.get_nombre

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el lugar deberia ser "el Centro de estudios (avenida Directorio 887, Caseros)"' do 	
  	valor_esperado = 'el Centro de estudios (avenida Directorio 887, Caseros)' 

  	valor_obtenido = evento.get_lugar

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'la fecha deberia ser 5 de diciembre' do 	
  	valor_esperado = '5 de diciembre' 

  	valor_obtenido = evento.get_fecha

    expect(valor_obtenido).to eq(valor_esperado)
  end

  it 'el mail de confirmacion deberia ser fiesta@untref.com' do 	
  	valor_esperado = 'fiesta@untref.com' 

  	valor_obtenido = evento.get_mail_confirmacion

    expect(valor_obtenido).to eq(valor_esperado)
  end
end