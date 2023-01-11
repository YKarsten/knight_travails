# frozen_string_literal: true

# A parent class used for inheritance to the other chess pieces.
class Piece
  attr_reader :color, :board, :location

  def initialize(board, location, color)
    @board = board
    @color = color
    @location = location
  end

  def enemy?(location)
    !board[location].nil? && board[location].color != color
  end
end
