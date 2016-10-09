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

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    finished = player_locations.values.select do |location|
      location >= (length - 1)
    end
    finished.empty? ? false : true
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner

    # winner = nil
    # front = 0
    # player_locations.each do |player, location|
    #   if location > front
    #     front = location
    #     winner = player
    #   end
    # end
    # winner

    winner =  player_locations.key(@player_locations.values.max)

    winning_location = player_locations[winner]

    # ties = player_locations.values.select {|location| location == winning_location}

    # ties.empty? ? nil : ties

    player_locations.values.count(winning_location) > 1 ? nil : winner


  end

  # Rolls the die and advances +player+ accordingly
  def advance_players
    @player_locations.update(@player_locations) do |player,location|
      location += die.roll
      location > 29 ? location = 29 : location
    end


  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization
    board = Array.new(num_of_players) { Array.new(@length, " ") }
    # board[0][@player_one_location] = players[0]
    # board[1][@player_two_location] = players[1]
    # board.each do |row|
    #   puts row.join("|") + " Finish"
    # end
    player_locations.each_with_index do |(player, location), idx|
      # p player
      # p board[idx]
      # p board[idx][location]
      board[idx][location] = player
    end
    board.map do |row|
      row.join("|") + " Finish"
    end
  end
end
