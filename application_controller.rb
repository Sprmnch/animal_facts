require 'bundler'
require_relative 'models/model.rb'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
#     @fact = get_fact
    erb :index
  end
  get '/POST' do
    @fact = get_fact()
    erb :results
  end
  
  get '/SEND' do
    @fact = get_fact()
    send_message(params[:number], @fact)
    erb :results
  end
end