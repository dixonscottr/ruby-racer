require 'pry'
class RubyRacer
  attr_reader :num_of_players, :die, :length
  attr_accessor :player_locations

  def initialize(num_of_players, die, length = 30)
    @die = die
    @length = length
    @num_of_players = num_of_players
    @player_locations = {}
  end

  def record_player_symbols(array_of_symbols)
    array_of_symbols.each do |symbol|
      @player_locations[symbol] = 0
    end
  end

  def finished?
    finished = player_locations.values.select do |location|
      location >= (length - 1)
    end
    finished.empty? ? false : true
  end

  def winner
    winner =  player_locations.key(@player_locations.values.max)
    winning_location = player_locations[winner]
    player_locations.values.count(winning_location) > 1 ? nil : winner
  end

  def advance_players
    @player_locations.update(@player_locations) do |player,location|
      location += die.roll
      location > 29 ? location = 29 : location
    end
  end

  def board_visualization
    board = Array.new(num_of_players) { Array.new(@length, " ") }
    player_locations.each_with_index do |(player, location), idx|
      board[idx][location] = player
    end
    board.map { |row| row.join("|") + " Finish" }
  end
end
