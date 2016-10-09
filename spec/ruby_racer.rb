require_relative '../ruby_racer'
require_relative '../die'

describe RubyRacer do
  let(:die) { Die.new }
  let(:players) { [:a, :b] }
  let(:game) { RubyRacer.new(players, die) }

  context 'game play' do

    it 'finishes the game if a player passes the finish line' do
      game.player_one_location = 29
      expect(game.finished?).to eq true
    end

    it 'determines a winner' do
      game.player_one_location = 25
      game.player_two_location = 29
      expect(game.winner).to eq players[1]
    end

    it 'calls the game a tie if both players cross the finish line in the same turn' do
      game.player_one_location = 29
      game.player_two_location = 29
      expect(game.winner).to eq nil
    end

    it 'moves the player forward according to the die roll' do
      game.player_one_location = 20
      game.advance_player(players[0])
      expect(game.player_one_location).to be > 20
    end

  end

  context 'board_visualization' do

    it 'displays a board with a row for each player' do
      expect(game.board_visualization.length).to eq players.length
    end

  end

end