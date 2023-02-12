# frozen_string_literal: true

#  A basic chess piece class for a rook
class Bishop < Piece
  include Slideable

  # puts or p.to_s override
  # what does this piece look like if we print it to the console?
  def to_s
    color == :black ? "\u265D" : "\u2657"
  end

  def move_dirs
    [
      [1, 1],
      [-1, -1],
      [1, -1],
      [-1, 1]
    ]
  end
end
