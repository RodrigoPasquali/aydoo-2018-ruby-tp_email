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

  it 'deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    archivo_json = File.dirname(__FILE__) + "/data1.json"
#    puts '1****************** ARCHIVO *********************************1'
#    puts archivo_json
#    puts '1****************** ARCHIVO ******************************1'
    datos_json = File.read(archivo_json)
#    puts '2****************** DATOS_JSON ********************************2'   
#    puts datos_json
#    puts '2****************** DATOS_JSON *********************************2'
    content = {'CONTENT-TYPE' => 'application/json'}
    post '/', datos_json, content
#    puts '3****************** RESPONSE_BODY *********************************3'    
#    puts last_response.body
#    puts '3****************** RESPONSE_BODY *********************************3'    
#    puts '4****************** LAST_RESPONSE *********************************4'    
#    puts last_response
#    puts '4****************** RESPONSE_BODY *********************************4'    
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end

    it 'deberia obtener status 200 y el cuerpo deberia devolver "ok"' do
    archivo_json = File.dirname(__FILE__) + "/data1.json"
    datos_json = File.read(archivo_json)
    post '/', datos_json
    expect(last_response).to be_ok
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
