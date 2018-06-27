require 'rspec'
require 'rack/test'
require 'sinatra'
require 'json'
require 'sinatra/json'
require_relative '../app'
require_relative '../excepciones/faltan_contactos_json_exception'

describe 'Aplicacion Sinatra' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'data1.json deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data1.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end

  it 'data2_esquema_incorrecto.json deberia obtener status 500 y el cuerpo deberia devolver "error, entrada incorrecta"' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data2_esquema_incorrecto.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).not_to be_ok
    expect(last_response.status).to eq 500
    expect(cuerpo['resultado']).to eq 'error, entrada incorrecta'
  end

  it 'data3.json deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data3.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end

  it 'data4.json deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data4.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end

  it 'data5.json deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data5.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end

  it 'data6.json deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data6.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end

  it 'data7.json deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data7.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end

  it 'data8.json deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data8.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end

  it 'data9.json deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data9.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end

  it 'data10.json deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data10.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end

  it 'data11.json deberia obtener status 200 y el cuerpo deberia devolver "ok' do
    EnviadorDeEmail.any_instance.stub(:enviar_mail)
    archivo_json = './archivos_para_prueba/data11.json'
    datos_json = File.read(archivo_json)
    content = {'Content-Type' => 'application/json'}
    post '/', datos_json, content
    cuerpo = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.status).to eq 200
    expect(cuerpo['resultado']).to eq 'ok'
  end
end
