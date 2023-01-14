# frozen_string_literal: true

require_relative './node'
require_relative './tree'
require_relative './piece'

# Basic pawn chess piece
class Knight < Piece
    # this overrides the string representation (puts) of ruby and instead prints the piece name.

  def to_s
    # depending on the color, this prints unicode chess pieces in black or white
    color == :black ? "\u265E" : "\u2658"
  end

  # Es bruacht ein BST das die möglichen Züge aufzechnet. Start oder root Punkt ist die aktuelle Position des piece. Davon ausgehend gibt es bis zu 8 mögliche Positionen an die der knight springen kann. Diese 8 Positionen sind child nodes von root. Von diesen child nodes werden wieder alle Züge gecheckt. Wiederholen bis zu Level 7/8 ab diesem Zeitpunkt sind alle Felder mind. 1 mal erreicht worden.

  def available_moves
    tree = Tree.new(current_r, current_c)
    print tree

    # [
    #   [1, 2],
    #   [1, -2],
    #   [-1, 2],
    #   [-1, -2],
    #   [2, 1],
    #   [2, -1],
    #   [-2, 1],
    #   [-2, -1]
    # ]
  end
end
