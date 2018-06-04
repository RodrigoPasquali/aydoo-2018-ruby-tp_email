require 'rspec'
require 'rack/test'
require_relative '../app'

describe 'Aplicacion Sinatra' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "/prueba/jose deberia devolver jose " do
  	get '/prueba/jose'
  	valorEsperado = "hola :jose"

    valorObtenido = last_response.body

 	expect(last_response.status).to eq 200
    expect(valorObtenido).to eq valorEsperado
  end
end
