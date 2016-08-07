require 'sinatra'
require 'sinatra/reloader'

RANDOM_NUM = rand(100)

def check_guess(guess)
  if params['guess'].to_i > RANDOM_NUM + 5
    msg = "Way too high!"
  elsif params['guess'].to_i > RANDOM_NUM
    msg = "Too high!"
  elsif params['guess'].to_i < RANDOM_NUM - 5
    msg = "Way too low!"
  elsif params['guess'].to_i < RANDOM_NUM
    msg = "Too low!"
  else
    msg = "That's correct!"
  end
end

get '/' do
  guess = params["guess"]
  msg = check_guess(guess)
  erb :index, :locals => {:number => RANDOM_NUM, :message => msg}
end
