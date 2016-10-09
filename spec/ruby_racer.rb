require_relative '../ruby_racer'
require_relative '../die'

describe RubyRacer do

    let(:die) { Die.new }
    let(:num_of_players) { 4 }
    let(:game) { RubyRacer.new(num_of_players, die, 30) }

    it 'finishes the game if a player passes the finish line' do
      game.player_locations = {:a => 9, :b => 29, :c => 29, :d => 15}
      expect(game.finished?).to eq true
    end

    it 'determines a winner' do
      game.player_locations = {:a => 9, :b => 20, :c => 29, :d => 15}
      expect(game.winner).to eq :c
    end

    it 'calls the game a tie if both players cross the finish line in the same turn' do
      game.player_locations = {:a => 9, :b => 29, :c => 29, :d => 15}
      expect(game.winner).to eq nil
    end

    it 'moves the player forward according to the die roll' do
      game.player_locations = {:a => 9, :b => 20, :c => 29, :d => 15}
      game.advance_players
      expect(game.player_locations.values[0]).to be > 9
    end

    it 'displays a board for each player' do
      expect(game.board_visualization.length).to eq num_of_players
    end

end