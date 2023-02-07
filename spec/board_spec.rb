# frozen_string_literal: true

require_relative '../lib/board'


describe Board do
  let(:pawn) {double('pawn')}
  subject(:board) {described_class.new}

  describe '[]= aka setter method' do
    context 'when placing a pawn' do
      it 'changes the value for that location' do
        piece = 'pawn'
        location = [1, 1]
        board[location] = piece
        expect(board[location]).to be('pawn')
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
end