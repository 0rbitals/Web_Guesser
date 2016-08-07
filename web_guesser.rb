require 'sinatra'
require 'sinatra/reloader'

random_num = rand(101)

get '/' do
  erb :index, :locals => {:number => random_num}
end
