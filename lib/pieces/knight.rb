# frozen_string_literal: true

# Basic pawn chess piece
class Knight < Piece
  include Stepable

  attr_accessor :result

  # puts or p.to_s override
  # what does this piece look like if we print it to the console?
  def to_s
    # depending on the color, this prints unicode chess pieces in black or white
    color == :black ? "\u265E" : "\u2658"
  end

  def move_dirs
    [
      [-2, -1],
      [-2, 1],

      [-1, 2],
      [1, 2],

      [2, 1],
      [2, -1],

      [-1, -2],
      [1, -2]
    ]
  end
end
