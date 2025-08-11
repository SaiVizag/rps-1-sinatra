require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:main_header)
end

get("/rock") do
  moves = ["rock", "paper", "scissors"]
  @comp_move = moves.sample
  if @comp_move == "rock" then @outcome = "tied"
  elsif @comp_move == "scissors" then @outcome = "won"
  else @outcome = "lost"
  end
  erb(:rock)
end

get("/paper") do
  variant = "paper"
  moves = ["rock", "paper", "scissors"]
  @comp_move = moves.sample
  if @comp_move == "rock" then @outcome = "won"
  elsif @comp_move == "scissors" then @outcome = "lost"
  else @outcome = "tied"
  end
  erb(:paper)
end

get("/scissors") do
  variant = "scissors"
  moves = ["rock", "paper", "scissors"]
  @comp_move = moves.sample
  if @comp_move == "rock" then @outcome = "lost"
  elsif @comp_move == "scissors" then @outcome = "tied"
  else @outcome = "won"
  end
  erb(:scissors)
end
get("/rules") do
  erb(:rules)
end
