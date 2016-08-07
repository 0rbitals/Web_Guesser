require 'sinatra'
require 'sinatra/reloader'

@@random_num = rand(100)
@@guesses = 5

def check_guess(guess)
  @@current_num = @@random_num
  if params['guess'].to_i > @@random_num + 5 && @@guesses > 0
    @@guesses -= 1
    msg = "Way too high!"
  elsif params['guess'].to_i > @@random_num && @@guesses > 0
    @@guesses -= 1
    msg = "Too high!"
  elsif params['guess'].to_i < @@random_num - 5 && @@guesses > 0
    @@guesses -= 1
    msg = "Way too low!"
  elsif params['guess'].to_i < @@random_num && @@guesses > 0
    @@guesses -= 1
    msg = "Too low!"
  else
    if @@guesses > 0
      @@random_num = rand(100)
      @@guesses = 5
      msg = "That's correct!"
    else
      @@random_num = rand(100)
      @@guesses = 5
      msg = "You lost ! Good luck next time #{@@current_num}"
    end
  end
end

get '/' do
  guess = params["guess"]
  msg = check_guess(guess)
  erb :index, :locals => {:number => @@current_num, :message => msg}
end
