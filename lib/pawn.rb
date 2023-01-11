# Basic pawn chess piece
class Pawn < Piece

  # this overrides the string representation (puts) of ruby and instead prints the piece name.
  def to_s
    # depending on the color, this prints unicode chess pieces in black or white
    color == :black ? "\u265F" : "\u2659"
  end

  def move_dirs
    [
      [0, 1]
    ]
  end
end
