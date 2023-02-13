# frozen_string_literal: true

# A parent class used for inheritance to the other chess pieces.
class Piece
  attr_reader :color, :board
  attr_accessor :location

  def initialize(board, location, color)
    @board = board
    @color = color
    @location = location
  end

  # available moves that dont move into check
  def safe_moves
    moves = []
    # look at available moves and prevent moving into check

    available_moves.each do |move|
      # try the move

      new_board = board.dup
      new_board.move_piece!(location, move)
      # if not in check
      unless new_board.in_check?(color)
        # add the move to the moves array
        moves << move
      end
    end
    moves
  end

  def enemy?(location)
    board.in_bounds?(location) && board[location].color != color
  end

  def current_r
    location.first
  end

  def current_c
    location.last
  end
end
