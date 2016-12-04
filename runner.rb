require_relative 'die'
require_relative 'ruby_racer'
require_relative 'reset_screen'

die = Die.new
puts "Welcome to Ruby Racer"
puts "How many racers would like to compete?"

num_of_players = gets.to_i

game = RubyRacer.new(num_of_players, die, 30)

num = 1
player_symbols= []

num_of_players.times do 
  puts "Please enter the symbol for player #{num}"
  player_sym = gets.chomp.to_sym
  until player_sym.length == 1
    puts "Please only enter a 1-character-long symbol for player #{num}"
    player_sym = gets.chomp.to_sym
  end
  player_symbols << player_sym
  num += 1
end

game.record_player_symbols(player_symbols)

reset_screen
puts game.board_visualization
sleep(1)

until game.finished?

  game.advance_players

  reset_screen
  puts game.board_visualization
  sleep(0.2)
end

if game.winner
  puts "Player '#{game.winner}' wins!"
else
  puts "It's a tie!"
end
