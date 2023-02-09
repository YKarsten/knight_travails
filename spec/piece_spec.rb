# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

# These HAVE to be at the top, before loading the piece classes
require_relative '../lib/stepable'
require_relative '../lib/piece'
require_relative '../lib/board'

require_relative '../lib/pieces_collection'

# Pawn tests
describe Board do
  subject(:board) { described_class.new }

  describe 'Pawn #available_moves' do
    context 'when a pawn is on an empty board in starting position' do
      it 'can move to 2 positions' do
        board[[1, 1]] = Pawn.new(board, [1, 1], :black)
        test_piece = board[[1, 1]]

        expect(test_piece.available_moves).to eq([[2, 1], [3, 1]])
      end
    end
    context 'when a pawn is at its starting position and flanked by two enemy pieces' do
      it 'can move to 4 different positions' do
        board = Board.start_chess
        test_piece = board[[1, 1]]

        board[[2, 0]] = Pawn.new(board, [1, 1], :white)
        board[[2, 2]] = Pawn.new(board, [1, 1], :white)

        expect(test_piece.available_moves.size).to eq(4)
      end
    end
    context 'when a pawn is NOT in its starting position on an empty board' do
      it 'can move to only one position' do
        board[[3, 1]] = Pawn.new(board, [3, 1], :black)
        test_piece = board[[3, 1]]

        expect(test_piece.available_moves.size).to eq(1)
      end
    end
    context 'when a pawn is facing another piece' do
      it 'can not move' do
        board[[3, 1]] = Pawn.new(board, [3, 1], :black)
        test_piece = board[[3, 1]]

        board[[4, 1]] = Pawn.new(board, [4, 1], :white)
        expect(test_piece.available_moves.size).to eq(0)
      end
    end
  end
end

# King tests

describe Board do
  subject(:board) { described_class.new }
  describe 'King #available moves' do
    context 'when the king is in the starting position on a new board' do
      it 'can not move' do
        board = Board.start_chess
        # black king
        test_piece = board[[0, 4]]

        expect(test_piece.available_moves.size).to eq(0)
      end
    end
    context 'when the king is in the middle of an empty board' do
      it 'can move to 8 positions' do
        board[[4, 4]] = King.new(board, [4, 4], :white)
        test_piece = board[[4, 4]]

        expect(test_piece.available_moves.size).to eq(8)
      end
    end
    context 'when the 3 pawns in front of the king are removed' do
      it 'can move to 3 positions' do
        board[[7, 3]] = Queen.new(board, [7, 3], :white)
        board[[7, 4]] = King.new(board, [7, 4], :white)
        board[[7, 5]] = Bishop.new(board, [7, 5], :white)
        # white king
        test_piece = board[[7, 4]]

        expect(test_piece.available_moves).to eq([[6, 3], [6, 4], [6, 5]])
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
