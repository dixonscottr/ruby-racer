require_relative 'die'
require_relative 'ruby_racer'
require_relative 'reset_screen'


# players = [:a, :b]
die = Die.new
puts "Welcome to Ruby Racer"
puts "How many racers would like to compete?"

num_of_players = gets.to_i

game = RubyRacer.new(num_of_players, die, 30)
num = 1
player_symbols= []

num_of_players.times do 
  puts "Please enter the symbol for player #{num}"
  player_num = gets.chomp.to_sym
  player_symbols << player_num
  num += 1
end

game.record_player_symbols(player_symbols)

# game = RubyRacer.new(players, die)

# Clear the screen and print the board
# with players in their starting positions.
# Then pause, so users can see the starting board.
reset_screen
puts game.board_visualization
sleep(1)

# Play the game.
until game.finished?
  # Do this each round until the game is finished.

# Move each player forward.
  # game.players.each do |player|
  #   game.advance_player(player)
  # end
  game.advance_players

  # Now that each player has moved,
  # reprint the board with the new player positions
  # and pause so users can see the updated board.
  reset_screen
  puts game.board_visualization
  sleep(0.2)
end

# Once the game is finished, report the winner.
if game.winner
  puts "Player '#{game.winner}' wins!"
  # p game.winner
else
  puts "It's a tie!"
end
