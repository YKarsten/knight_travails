class Knight < Piece
  # this overrides the string representation (puts) of ruby and instead prints the piece name.
  def to_s
    # depending on the color, this prints unicode chess pieces in black or white
    color == :black ? "\u265E" : "\u2658"
  end

  def move_dirs
    [
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2],
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1]
    ]
  end
end
