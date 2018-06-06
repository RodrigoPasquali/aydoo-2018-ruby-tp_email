require 'rspec' 
require_relative '../model/email'
require_relative '../model/parseador'
require_relative '../model/evento'
require_relative '../model/cuerpo_del_mail'
require_relative '../model/contacto'

describe 'mail' do
  let(:mail) { Email.new }  

  it 'enviar mail' do 	
    lista_contactos = [{"nombre"=>"juan", "apellido"=>"perez", "mail"=>"juanperez@test.com"}]
    contacto = Contacto.new(lista_contactos)
	parseador = Parseador.new
	parseador.parsear_archivo('./archivos_para_prueba/data1.json')
	evento = Evento.new(parseador.get_datos_evento)
	cuerpo = CuerpoDelMail.new(parseador.get_cuerpo)
	primer_contato = parseador.get_contactos[0]
	contacto = Contacto.new(primer_contato)
	cuerpo.agregar_datos_contacto(contacto)
	cuerpo.agregar_datos_evento(evento)
	valor_esperado = "Hola juan,\n\r Por medio del presente mail te estamos invitando a la cena de fin de año de la UNTREF, que se desarrollará en el Centro de estudios (avenida Directorio 887, Caseros), el día 5 de diciembre. Por favor confirmar su participación enviando un mail a fiesta@untref.com.\n\rSin otro particular.La direccion"

	valor_obtenido = mail.armar_cuerpo(cuerpo)

	expect(valor_obtenido).to eq(valor_esperado)
  end
end