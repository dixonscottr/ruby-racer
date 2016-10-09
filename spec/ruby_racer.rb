require_relative '../ruby_racer'
require_relative '../die'

describe RubyRacer do

  context 'game play with 2 players' do

    let(:die) { Die.new }
    let(:players) { [:a, :b] }
    let(:game) { RubyRacer.new(players, die) }

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

  it 'displays a board with two rows' do
    expect(game.board_visualization.length).to eq 2
  end

end

end