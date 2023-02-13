# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/pieces_collection'
require_relative '../lib/pieces/piece'
require_relative '../lib/board_render'
require_relative '../lib/player'

describe Board do
  subject(:board) { described_class.start_chess }
  
  let(:player1) { Player.new(:white)}
  let(:player2) { Player.new(:black)}

  subject(:game) { Game.new(board, player1, player2, BoardRender)}
  describe '#over?' do
    context 'when the game starts' do
      it 'is not game over for either player' do
        expect(game.over?).to be false
        game.swap_player!
        expect(game.over?).to be false
      end
    end

    context 'when one player1 is in checkmate' do
      it 'is game over for player1' do
        board = Board.new
        board[[0, 0]] = King.new(board, [0, 0], :white)
        board[[7, 0]] = Rook.new(board, [7, 0], :black)
        board[[7, 1]] = Rook.new(board, [7, 1], :black)

        # does checkmate work, yet?
        expect(game.over?).to be true
      end
    end
  end
end