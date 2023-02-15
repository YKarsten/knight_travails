# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require_relative '../lib/pieces_collection'
require_relative '../lib/pieces/piece'
require_relative '../lib/invalid_move_error'
require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '[]= aka setter method' do
    context 'when placing a pawn' do
      it 'changes the value for that location' do
        board[[0, 2]] = Pawn.new(board, [0, 2], :black)
        test_piece = board[[0, 2]]

        expect(test_piece).to be_a(Pawn)
      end
    end
    context 'when placing a Knight' do
      it 'changes the value for that location' do
        board[[4, 6]] = Knight.new(board, [4, 6], :black)
        test_piece = board[[4, 6]]

        expect(test_piece).to be_a(Knight)
      end
    end
  end

  describe '#in_bounds?' do
    context 'when location is within board' do
      it 'is a valid move' do
        location = [2, 2]
        expect(board.in_bounds?(location)).to be true
      end
    end
    context 'when location is out of bounds' do
      it 'is an invalid move' do
        location = [10, 1]
        expect(board.in_bounds?(location)).not_to be true
      end
    end
    context 'when location is negative' do
      it 'is an invalid move' do
        location = [-2, -4]
        expect(board.in_bounds?(location)).not_to be true
      end
    end
  end

  describe '#empty?' do
    context 'When the board is not populated' do
      it 'is empty' do
        location = [2, 2]
        expect(board.empty?(location)).to be true
      end
    end
    context 'When the board is populated with pawns'
  end

  describe '#in_check?' do
    context 'when player1 (white) is put in check' do
      it 'in_check? returns true' do
        board[[0, 0]] = King.new(board, [0, 0], :white)

        board[[5, 7]] = King.new(board, [5, 7], :black)
        board[[0, 7]] = Queen.new(board, [0, 7], :black)

        expect(board.in_check?(:white)).to be true
        expect(board.checkmate?(:white)).to be false

        expect(board.in_check?(:black)).to be false
      end
    end
    context 'when player2 (black) is put in check' do
      it 'in_check? returns true' do
        board[[0, 0]] = King.new(board, [0, 0], :black)

        board[[5, 7]] = King.new(board, [5, 7], :white)
        board[[0, 7]] = Queen.new(board, [0, 7], :white)

        expect(board.in_check?(:white)).to be false

        expect(board.in_check?(:black)).to be true
        expect(board.checkmate?(:black)).to be false
      end
    end
    context 'when player2 (black) is put in checkmate' do
      it 'in_check? and checkmate? return true' do
        board[[0, 0]] = King.new(board, [0, 0], :black)

        board[[5, 7]] = King.new(board, [5, 7], :white)
        board[[0, 7]] = Queen.new(board, [0, 7], :white)
        board[[1, 7]] = Queen.new(board, [1, 7], :white)

        expect(board.in_check?(:white)).to be false

        expect(board.in_check?(:black)).to be true
        expect(board.checkmate?(:black)).to be true
      end
    end
  end

  describe '#pieces' do
    context 'when the board is populated' do
      it 'returns all 32 pieces' do
        board = Board.start_chess

        expect(board.pieces.size).to eq(32)
        expect(board.pieces[0]).to be_a(Rook)
        expect(board.pieces[8]).to be_a(Pawn)
      end
    end
    context 'when the board is populated' do
      it 'Can access individual pieces by their index' do
        board = Board.start_chess

        expect(board.pieces[0]).to be_a(Rook)
        expect(board.pieces[8]).to be_a(Pawn)
      end
    end
    context 'when the board is populated' do
      it 'Does not list Nullobjects' do
        board = Board.start_chess

        expect(board.pieces.find { |piece| piece.is_a?(NullPiece) }).to be nil
      end
    end
  end

  describe '#move_piece/ #move_piece!' do
    context 'When moving a pawn to a valid position' do
      it 'removes the piece from its start and moves it to the end position' do
        board = Board.start_chess

        board.move_piece([1, 0], [2, 0])

        expect(board[[1, 0]]).to be_a(NullPiece)
        expect(board[[2, 0]]).to be_a(Pawn)
      end
    end

    context 'When moving a pawn to an invalid position' do
      it 'expect to receive an InvalidMoveError' do
        board = Board.start_chess

        expect { board.move_piece([1, 0], [2, 6]) }.to raise_error(InvalidMoveError)
      end
    end

    context 'When moving a piece to a position beyond the board' do
      it 'expect to receive an InvalidMoveError' do
        board = Board.start_chess

        expect { board.move_piece([1, 0], [10, 6]) }.to raise_error(InvalidMoveError)
      end
    end
  end

  describe '#dup' do
    let(:original_board) { Board.start_chess }
    let(:duped_board) { original_board.dup }

    context 'when making a deep copy of board' do
      it 'is eq to each other (only values)' do
        expect(original_board.pieces.class).to eq(duped_board.pieces.class)
      end
      it 'is eql to each other (values and types' do
        expect(original_board.pieces.class).to eql(duped_board.pieces.class)
      end
      it 'is not equal to each other (identity)' do
        expect(original_board).not_to equal(duped_board)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
