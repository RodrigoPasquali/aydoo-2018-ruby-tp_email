require 'rspec'
require 'rack/test'
require 'sinatra'
require 'json'
require 'sinatra/json'
require_relative '../app'

describe 'Aplicacion Sinatra' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  it 'deberia obtener status 500 y el cuerpo deberia devolver "error, entrada incorrecta"' do
    archivo_json = File.dirname(__FILE__) + "/data2_esquema_incorrecto.json"
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).not_to be_ok
    expect(last_response.status).to eq 500
    expect(cuerpo['resultado']).to eq 'error, entrada incorrecta'
  end
end
