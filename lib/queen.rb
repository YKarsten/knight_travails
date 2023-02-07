# frozen_string_literal: true

#  A basic chess piece class for a rook
class Queen < Piece
  include Slideable

  # puts or p.to_s override
  # what does this piece look like if we print it to the console?
  def to_s
    color == :black ? "\u265B" : "\u2655"
  end

  def move_dirs
    [
      [0, 1],
      [1, 1],
      [1, 0],
      [1, -1],
      [0, -1],
      [-1, -1],
      [-1, 0],
      [1, -1]
    ]
  end
end
