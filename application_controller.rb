require 'bundler'
require_relative "models/model.rb"
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  get '/get_fact' do
    @fact = get_fact
    erb :results
  end
end
