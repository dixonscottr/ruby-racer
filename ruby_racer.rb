class RubyRacer
  attr_reader :players, :die, :length
  attr_accessor :player_one_location, :player_two_location

  def initialize(players, die, length = 30)
    @players = players
    @die = die
    @length = length
    @player_one_location = 0
    @player_two_location = 0
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    if player_one_location >= (length-1) || player_two_location >= (length-1)
      true
    else
      false
    end
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    if player_one_location > player_two_location
      [players][0]
    elsif player_two_location > player_one_location
      [players][1]
    else
      nil
    end
  end

  # Rolls the die and advances +player+ accordingly
  def advance_player(player)
    @player_one_location += die.roll
    @player_two_location += die.roll
    @player_one_location = 29 if @player_one_location > 29
    @player_two_location = 29 if @player_two_location > 29
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization
    board = Array.new(@players.length) { Array.new(@length, "") }
    board[0][@player_one_location] = players[0]
    board[1][@player_two_location] = players[1]
    board.map do |row|
      row.join(" | ")
    end
  end
end
